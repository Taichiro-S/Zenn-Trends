import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'rss_feed_articles_repository.g.dart';

class RssFeedArticlesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<RssFeedArticle>> fetchRssFeedArticles(
      {required String topicName,
      int limit = DEFAULT_LOAD_TOPICS,
      DocumentSnapshot? startAfter,
      String? searchWord}) async {
    try {
      Query rssFeedArticlesRef = _firestore
          .collection('rss_feed')
          .doc(topicName)
          .collection('articles')
          .orderBy('published_date', descending: true)
          .limit(limit);
      if (startAfter != null) {
        print(startAfter.id);
        rssFeedArticlesRef = rssFeedArticlesRef.startAfterDocument(startAfter);
      }
      final QuerySnapshot rssFeedArticleSnapshot =
          await rssFeedArticlesRef.get();
      List<RssFeedArticle> articles = rssFeedArticleSnapshot.docs
          .map((doc) => RssFeedArticle.fromDocument(doc))
          .toList();
      print(articles.length);
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
