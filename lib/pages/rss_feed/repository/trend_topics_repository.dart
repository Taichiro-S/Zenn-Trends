import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/trend_topic.dart';

part 'trend_topics_repository.g.dart';

class TrendTopicsRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<TrendTopic>> fetchTrendTopics() async {
    try {
      final QuerySnapshot trendTopicsSnapshot =
          await _firestore.collection('rss_feed').orderBy('name').get();

      List<TrendTopic> articles = trendTopicsSnapshot.docs
          .map((doc) => TrendTopic.fromDocument(doc))
          .toList();
      return articles;
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
TrendTopicsRepository trendTopicsRepository(TrendTopicsRepositoryRef ref) {
  return TrendTopicsRepository();
}
