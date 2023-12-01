import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'bookmarked_articles_repository.g.dart';

class BookmarkedArticlesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RssFeedArticle>> addBookmarkedArticle(
      {required RssFeedArticle article, required User user}) async {
    try {
      String articleId = '${article.creator}${article.slug}';
      DocumentReference userDocRef =
          _firestore.collection('users_info').doc(user.uid);
      DocumentReference bookmrkedArticlesRef =
          userDocRef.collection('bookmarked_articles').doc(articleId);
      await bookmrkedArticlesRef.set({
        'title': article.title,
        'link': article.link,
        'creator': article.creator,
        'slug': article.slug,
        'published_date': Timestamp.fromDate(article.publishedDate),
        'description': article.description,
        'enclosure': article.enclosure,
      });
      return await fetchBookmarkedArticle(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RssFeedArticle>> fetchBookmarkedArticle(
      {required User user}) async {
    List<RssFeedArticle> articles = [];
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users_info')
          .doc(user.uid)
          .collection('bookmarked_articles')
          .get();
      for (var doc in snapshot.docs) {
        articles.add(RssFeedArticle.fromDocument(doc));
      }
      return articles;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RssFeedArticle>> removeBookmarkedArticle(
      {required RssFeedArticle article, required User user}) async {
    try {
      String articleId = '${article.creator}${article.slug}';
      DocumentReference favoriteTopicDocRef = _firestore
          .collection('users_info')
          .doc(user.uid)
          .collection('bookmarked_articles')
          .doc(articleId);

      await favoriteTopicDocRef.delete();
      return await fetchBookmarkedArticle(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
BookmarkedArticlesRepository bookmarkedArticlesRepository(
    BookmarkedArticlesRepositoryRef ref) {
  return BookmarkedArticlesRepository();
}
