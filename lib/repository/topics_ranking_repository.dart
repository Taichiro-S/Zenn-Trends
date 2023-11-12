import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/model/topic_info.dart';

part 'topics_ranking_repository.g.dart';

class TopicsRankingRepository {
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
TopicsRankingRepository topicsRankingRepository(TopicsRankingRepositoryRef ref) {
  return TopicsRankingRepository();
}
