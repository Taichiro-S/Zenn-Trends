import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/screens/trend.dart';
import '/widgets/topic_container.dart';
import '/models/topic.dart';
import '/widgets/search_topic.dart';

class Ranking extends StatefulWidget {
  const Ranking({super.key, this.searchText = ''});
  final String searchText;
  @override
  State<Ranking> createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  List<String> selectedTopics = [];
  bool _isSearching = false;

  void _startSearching() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: _isSearching ? _stopSearching : null,
        child: Scaffold(
          appBar: AppBar(
            title: !_isSearching
                ? const Text('Zenn Trends',
                    style: TextStyle(color: Colors.blue))
                : const TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
            actions: [
              if (!_isSearching)
                IconButton(
                  onPressed: _startSearching,
                  icon: const Icon(Icons.search),
                ),
            ],
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('topics')
                .orderBy('taggings_count', descending: true)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();

              // List<Topic> topics = snapshot.data!.docs
              //     .map((doc) => Topic.fromDocument(doc))
              //     .toList();
              Future<List<Topic>> futureTopics =
                  Future.wait(snapshot.data!.docs.map((doc) async {
                final historySnapshot = await doc.reference
                    .collection('history')
                    .orderBy('date', descending: true)
                    .limit(2)
                    .get();
                int previousCount = 0;
                int currentCount = 0;
                int currentRank = 0;
                int previousRank = 0;
                if (historySnapshot.docs.length > 1) {
                  previousCount = historySnapshot.docs[1]['taggings_count'];
                  currentCount = historySnapshot.docs[0]['taggings_count'];
                  previousRank = historySnapshot.docs[1]['rank'];
                  currentRank = historySnapshot.docs[0]['rank'];
                } else {
                  currentCount = historySnapshot.docs[0]['taggings_count'];
                  currentRank = historySnapshot.docs[0]['rank'];
                }

                return Topic.fromDocument(doc, previousCount, currentCount,
                    previousRank, currentRank);
              }));

              return FutureBuilder<List<Topic>>(
                  future: futureTopics,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }

                    final topics = snapshot.data!;

                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: topics.length,
                            itemBuilder: (context, index) {
                              final topic = topics[index];
                              final isSelected =
                                  selectedTopics.contains(topic.id);

                              return TopicContainer(
                                topic: topic,
                                rank: index + 1,
                                isSelected: isSelected,
                                onChanged: (bool? value) {
                                  if (value == true && !isSelected) {
                                    setState(() {
                                      selectedTopics.add(topic.id);
                                      if (selectedTopics.length > 10) {
                                        selectedTopics.removeAt(0);
                                      }
                                    });
                                  } else if (value == false) {
                                    setState(() {
                                      selectedTopics.remove(topic.id);
                                    });
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Trend(topicIds: selectedTopics)),
              );
            },
            child: const Icon(Icons.trending_up),
          ),
        ));
  }
}
