import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/zenn_article/api/notion_database_api.dart';
import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_content_provider.dart';
part 'notion_database_provider.g.dart';

@riverpod
class NotionDatabase extends _$NotionDatabase {
  @override
  AsyncValue<String?> build() {
    return const AsyncValue.data('');
  }

  Future<void> searchDatabase() async {
    state = const AsyncValue.loading();
    final notionDatabaseApi = ref.read(notionDatabaseApiProvider);
    try {
      final result = await notionDatabaseApi.searchDatabase();
      state = AsyncValue.data(result);
    } catch (e, s) {
      state = const AsyncValue.data('');
      throw Exception('Failed to search database: $e, $s');
    }
  }

  Future<void> insertArticle(
      {required String databaseId,
      required RssFeedArticle article,
      required ZennArticleContentState content}) async {
    state = const AsyncValue.loading();
    final notionDatabaseApi = ref.read(notionDatabaseApiProvider);

    try {
      await notionDatabaseApi.insertArticle(
          databaseId: databaseId, article: article, content: content);
      state = AsyncValue.data(databaseId);
    } catch (e, s) {
      state = const AsyncValue.data('');
      throw Exception('Failed to insert article: $e, $s');
    }
  }
}
