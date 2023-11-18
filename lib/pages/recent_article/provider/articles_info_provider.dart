import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/recent_article/model/articles_info.dart';
import 'package:zenn_trends/pages/recent_article/model/articles_info_state.dart';
import 'package:zenn_trends/pages/recent_article/repository/articles_info_repository.dart';

part 'articles_info_provider.g.dart';

@riverpod
Future<List<ArticlesInfo>> articlesInfo(
  ArticlesInfoRef ref, {
  required String topicId,
}) async {
  final repository = ref.watch(articlesInfoRepositoryProvider);
  return repository.fetchArticlesOfTopic(topicId: topicId);
}
