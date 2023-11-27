import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'rss_feed_articles_repository.g.dart';

class RssFeedArticlesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<RssFeedArticle>> fetchRssFeedArticles(
      {required String topicName, String? searchWord}) async {
    try {
      print('fetchRssFeedArticles');

      final QuerySnapshot rssFeedArticleSnapshot = await _firestore
          .collection('rss_feed')
          .doc(topicName)
          .collection('articles')
          .orderBy('publishedDate', descending: true)
          .limit(20)
          .get();

      List<RssFeedArticle> articles = rssFeedArticleSnapshot.docs
          .map((doc) => RssFeedArticle.fromDocument(doc))
          .toList();
      articles.sort((a, b) => b.publishedDate.compareTo(a.publishedDate));
      return articles;
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
RssFeedArticlesRepository rssFeedArticlesRepository(
    RssFeedArticlesRepositoryRef ref) {
  return RssFeedArticlesRepository();
}
