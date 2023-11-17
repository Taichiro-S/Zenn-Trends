import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/recent_article/model/articles_info.dart';
import 'package:zenn_trends/pages/recent_article/model/articles_info_state.dart';
import 'package:zenn_trends/pages/recent_article/repository/articles_info_repository.dart';

part 'articles_info_provider.g.dart';

@riverpod
// class ArticlesInfo extends _$ArticlesInfo {
//   @override
//   ArticlesInfoState build() {
//     return const ArticlesInfoState(
//       articlesInfo: AsyncValue.loading(),
//     );
//   }

//   Future<void> getRankedTopics({required String topicId}) async {
//     final articlesInfoRepository = ref.watch(articlesInfoRepositoryProvider);
//     state = state.copyWith(articlesInfo: const AsyncValue.loading());
//     try {
//       final articlesInfo =
//           await articlesInfoRepository.fetchArticlesOfTopic(topicId: topicId);
//       state = state.copyWith(
//         articlesInfo: AsyncValue.data(articlesInfo),
//       );
//     } catch (e, s) {
//       state = state.copyWith(articlesInfo: AsyncValue.error(e, s));
//     }
//   }
// }

Future<List<ArticlesInfo>> articlesInfo(
  ArticlesInfoRef ref, {
  required String topicId,
}) async {
  final repository = ref.watch(articlesInfoRepositoryProvider);
  return repository.fetchArticlesOfTopic(topicId: topicId);
}
