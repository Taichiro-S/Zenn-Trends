import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/topic_info.dart';
import '../repository/topics_repository.dart';
part 'topics_provider.g.dart';

@riverpod
Future<List<TopicInfo>> topics(TopicsRef ref) async {
  final repository = ref.watch(topicsRepositoryProvider);
  return repository.getAllTopics();
}
