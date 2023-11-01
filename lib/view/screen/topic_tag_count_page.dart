import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/topic_tag_counts_provider.dart';
import '/view/widget/topic_container_p.dart';
import '/view/widget/search_topic_p.dart';
import 'package:auto_route/auto_route.dart';
import '/model/topic_info.dart';

@RoutePage()
class TopicTagCountPage extends ConsumerWidget {
  const TopicTagCountPage({super.key, required this.topic});
  final TopicInfo topic;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const defaultDaysCount = 30;
    final tagCountAsync = ref.watch(
        topicTagCountsProvider(id: topic.id, daysCount: defaultDaysCount));
    final topicName = topic.displayName;
    return Scaffold(
      appBar: AppBar(title: Text('$topicNameのタグ数の推移')),
      body: tagCountAsync.when(
        error: (e, s) => Text(e.toString()),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (tagCounts) {
          return ListView.builder(
            itemCount: tagCounts.length,
            itemBuilder: (context, index) {
              final tagCount = tagCounts[index];
              return Text(tagCount.taggingsCount.toString());
            },
          );
        },
      ),
    );
  }
}
