import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/zenn_article/api/notion_database_api.dart';
import 'package:zenn_trends/pages/zenn_article/model/zenn_article_webview_state.dart';
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
    final result = await notionDatabaseApi.searchDatabase();
    state = AsyncValue.data(result);
  }

  Future<void> insertArticle(
      {required String databaseId, required RssFeedArticle article}) async {
    state = const AsyncValue.loading();
    final notionDatabaseApi = ref.read(notionDatabaseApiProvider);

    try {
      final result = await notionDatabaseApi.insertArticle(
          databaseId: databaseId, article: article);
      print(result);
      state = AsyncValue.data(databaseId);
    } catch (e, s) {
      state = AsyncValue.error(e.toString(), s);
    }
  }
}
