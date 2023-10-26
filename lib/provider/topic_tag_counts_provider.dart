import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/topic_tag_count.dart';
import '../repository/topic_tag_counts_repository.dart';
part 'topic_tag_counts_provider.g.dart';

@riverpod
Future<List<TopicTagCount>> topicTagCounts(
  TopicTagCountsRef ref, {
  required String id,
  required int daysCount,
}) async {
  final repository = ref.watch(topicTagCountsRepositoryProvider);
  return repository.getTopicTagCounts(id, daysCount);
}
