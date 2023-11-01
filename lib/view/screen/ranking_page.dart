import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/topics_provider.dart';
import '/view/widget/topic_container_p.dart';
import '/view/widget/search_topic_p.dart';
import '/model/search.dart';
import '/provider/search_provider.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class RankingPage extends ConsumerWidget {
  const RankingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicAsync = ref.watch(topicsProvider);
    Search search = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(
        title: const SearchTopic(),
      ),
      body: topicAsync.when(
        error: (e, s) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (topics) {
          final filteredTopics = search.filter(topics);
          final sortedTopics = filteredTopics
            ..sort((a, b) => -a.id.compareTo(b.id));
          return ListView.builder(
            itemCount: sortedTopics.length,
            itemBuilder: (context, index) {
              final topic = sortedTopics[index];
              return TopicContainer(topic: topic);
            },
          );
        },
      ),
    );
  }
}
