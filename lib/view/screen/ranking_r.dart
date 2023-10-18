import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/helper/favorite.dart';
import '/view/widget/topic_container.dart';
import '/model/topic.dart';
import '/provider/search_provider.dart';

class Ranking extends ConsumerWidget {
  const Ranking({super.key, this.searchText = ''});
  final String searchText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchProvider);
    return GestureDetector(
        onTap: search.isSearching ? search.stopSearching : null,
        child: Scaffold(
          appBar: AppBar(
            title: !search.isSearching
                ? const Text('Zenn Trends',
                    style: TextStyle(color: Colors.blue))
                : Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.grey[600],
                          ),
                          onPressed: search.stopSearching),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                            right: 8,
                            bottom: 8,
                          ),
                          child: TextField(
                            controller: _searchController,
                            autofocus: true,
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              suffixIcon: _searchController.text.isEmpty
                                  ? null
                                  : IconButton(
                                      icon: const Icon(Icons.clear),
                                      onPressed: () {
                                        _searchController.clear();
                                        setState(() {});
                                      },
                                    ),
                            ),
                            onChanged: (value) {
                              setState(() {});
                            },
                            onSubmitted: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
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
            stream: FirebaseFirestore.instance.collection('topics').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const CircularProgressIndicator();

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

                    var topics = snapshot.data!
                        .where((topic) =>
                            _searchController.text.isEmpty ||
                            topic.displayName
                                .toLowerCase()
                                .contains(_searchController.text.toLowerCase()))
                        .toList();
                    topics
                        .sort((a, b) => a.currentRank.compareTo(b.currentRank));
                    if (topics.isEmpty) {
                      return const Center(
                          child: Text('No topics found 😢',
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.bold)));
                    }

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
                                rank: topic.currentRank,
                                isSelected: isSelected,
                                isFavorite: _favoriteIds.contains(topic.id),
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
                                onFavoriteToggle: () =>
                                    _onToggleFavorite(topic),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  });
            },
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => Trend(topicIds: selectedTopics)),
          //     );
          //   },
          //   child: const Icon(Icons.trending_up),
          // ),
        ));
  }
}
