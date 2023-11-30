import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'read_articles_repository.g.dart';

class ReadArticlesRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<RssFeedArticle>> addReadArticle(
      {required RssFeedArticle article, required User user}) async {
    try {
      String articleId = '${article.creator}${article.slug}';
      DocumentReference userDocRef =
          _firestore.collection('users_info').doc(user.uid);
      DocumentReference readArticlesRef =
          userDocRef.collection('read_articles').doc(articleId);
      await readArticlesRef.set({
        'title': article.title,
        'link': article.link,
        'creator': article.creator,
        'slug': article.slug,
        'published_date': Timestamp.fromDate(article.publishedDate),
        'description': article.description,
        'enclosure': article.enclosure,
        'read_date': Timestamp.now(),
      });
      return await fetchReadArticle(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RssFeedArticle>> updateReadArticle(
      {required RssFeedArticle article, required User user}) async {
    try {
      String articleId = '${article.creator}${article.slug}';
      DocumentReference userDocRef =
          _firestore.collection('users_info').doc(user.uid);
      DocumentReference readArticlesRef =
          userDocRef.collection('read_articles').doc(articleId);
      if (await readArticlesRef.get().then((value) => !value.exists)) {
        return await addReadArticle(article: article, user: user);
      }
      await readArticlesRef.update({
        'read_date': Timestamp.now(),
      });
      return await fetchReadArticle(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RssFeedArticle>> deleteReadArticle({required User user}) async {
    try {
      DocumentReference userDocRef =
          _firestore.collection('users_info').doc(user.uid);
      QuerySnapshot readArticlesRef = await userDocRef
          .collection('read_articles')
          .orderBy('read_date', descending: false)
          .limit(1)
          .get();

      if (readArticlesRef.docs.isNotEmpty) {
        await readArticlesRef.docs.first.reference.delete();
      }

      return await fetchReadArticle(user: user);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<RssFeedArticle>> fetchReadArticle({required User user}) async {
    List<RssFeedArticle> articles = [];
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users_info')
          .doc(user.uid)
          .collection('read_articles')
          .get();
      for (var doc in snapshot.docs) {
        articles.add(RssFeedArticle.fromDocument(doc));
      }
      return articles;
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
ReadArticlesRepository readArticlesRepository(ReadArticlesRepositoryRef ref) {
  return ReadArticlesRepository();
}
