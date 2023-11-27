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
      DocumentReference favoriteTopicDocRef =
          userDocRef.collection('bookmarked_articles').doc(articleId);
      await favoriteTopicDocRef.set(article);
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
    } catch (e) {
      throw Exception(e);
    }
    return articles;
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
