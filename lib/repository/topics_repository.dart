import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/topic_info.dart';

part 'topics_repository.g.dart';

class TopicsRepository {
  Future<List<TopicInfo>> getAllTopics() async {
    try {
      final snap = await FirebaseFirestore.instance.collection('topics').get();
      return snap.docs.map((e) => TopicInfo.fromDocument(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
TopicsRepository topicsRepository(TopicsRepositoryRef ref) {
  return TopicsRepository();
}
