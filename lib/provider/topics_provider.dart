import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/topic_info.dart';
import '/repository/topic_repository.dart';
part 'topic_provider.g.dart';

@riverpod
Future<List<TopicInfo>> topics(TopicsRef ref) async {
  final repository = ref.watch(topicRepositoryProvider);
  return repository.getAllTopics();
}
