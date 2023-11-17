import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/recent_article/model/articles_info.dart';

part 'articles_info_repository.g.dart';

class ArticlesInfoRepository {
  Future<List<ArticlesInfo>> fetchArticlesOfTopic({
    required String topicId,
  }) async {
    try {
      final QuerySnapshot articlesSlugSnapshot = await FirebaseFirestore
          .instance
          .collection('articlesSlug')
          .orderBy('date', descending: true)
          .limit(1)
          .get();
      if (articlesSlugSnapshot.docs.isEmpty) {
        throw Exception('articlesSlug is empty');
      }
      final DocumentSnapshot latestArticleSlugDoc =
          articlesSlugSnapshot.docs.first;
      final DocumentSnapshot slugDoc = await latestArticleSlugDoc.reference
          .collection('slugs')
          .doc(topicId)
          .get();

      if (!slugDoc.exists) {
        throw Exception('Slug document not found for topicId: $topicId');
      }

      final Map<String, dynamic> slugsData =
          slugDoc.data() as Map<String, dynamic>;
      final Map<String, dynamic> slugs =
          slugsData['slugs'] as Map<String, dynamic>;
      List<ArticlesInfo> articlesInfoList = [];

      slugs.forEach((slug, articleData) {
        articlesInfoList
            .add(ArticlesInfo.fromJson(articleData as Map<String, dynamic>));
      });

      return articlesInfoList;
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }
}

@riverpod
ArticlesInfoRepository articlesInfoRepository(ArticlesInfoRepositoryRef ref) {
  return ArticlesInfoRepository();
}
