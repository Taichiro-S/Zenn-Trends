// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:zenn_trends/pages/recent_article/model/articles_info.dart';

// part 'articles_info_repository.g.dart';

// class ArticlesInfoRepository {
//   Future<List<ArticlesInfo>> fetchArticlesOfTopic({
//     required String topicName,
//   }) async {
//     try {
//       final QuerySnapshot articlesSlugSnapshot = await FirebaseFirestore
//           .instance
//           .collection('articles')
//           .where('name', isEqualTo: topicName)
//           .limit(1)
//           .get();
//       if (articlesSlugSnapshot.docs.isEmpty) {
//         throw Exception('articles empty');
//       }
//       final DocumentSnapshot latestArticleSlugDoc =
//           articlesSlugSnapshot.docs.first;
//     } catch (e) {
//       print(e);
//       throw Exception(e);
//     }
//   }
// }

// @riverpod
// ArticlesInfoRepository articlesInfoRepository(ArticlesInfoRepositoryRef ref) {
//   return ArticlesInfoRepository();
// }
