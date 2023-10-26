import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/topic_tag_counts_provider.dart';
import '/view/widget/topic_container_p.dart';
import '/view/widget/search_topic_p.dart';

class TagCount extends ConsumerWidget {
  const TagCount({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = ;
    const defaultDaysCount = 30;
    final tagCountAsync = ref.watch(topicTagCountsProvider(id: ,daysCount: defaultDaysCount));
    return Scaffold(
      appBar: AppBar(
        title: const SearchTopic(),
      ),
      body: tagCountAsync.when(
        error: (e, s) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (topics) {
          return ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              final topic = topics[index];
              return TopicContainer(topic: topic);
            },
          );
        },
      ),
    );
  }
}
