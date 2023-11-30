import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/firestore.dart';
import 'package:zenn_trends/pages/account/model/read_articles_state.dart';
import 'package:zenn_trends/pages/account/repository/read_articles_repository.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'read_articles_provider.g.dart';

@riverpod
class ReadArticles extends _$ReadArticles {
  @override
  ReadArticlesState build() {
    return const ReadArticlesState(
      articles: AsyncValue.data([]),
      articleIds: AsyncValue.data([]),
    );
  }

  Future<void> getReadArticles({required User user}) async {
    final readArticlesRepository = ref.read(readArticlesRepositoryProvider);
    final articles = state.articles.value ?? [];
    if (articles.isEmpty) {
      state = state.copyWith(
          articles: const AsyncValue.loading(),
          articleIds: const AsyncValue.loading());
      try {
        final articles =
            await readArticlesRepository.fetchReadArticle(user: user);
        state = state.copyWith(
            articles: AsyncValue.data(articles),
            articleIds: AsyncValue.data(
                articles.map((e) => '${e.creator}${e.slug}').toList()));
      } catch (e, s) {
        state = state.copyWith(
            articles: AsyncValue.error(e, s),
            articleIds: AsyncValue.error(e, s));
      }
    }
  }

  Future<void> addReadArticle(
      {required User user, required RssFeedArticle article}) async {
    final readArticlesRepository = ref.read(readArticlesRepositoryProvider);
    try {
      if (state.articles.value!.length > READ_LIMIT) {
        await readArticlesRepository.deleteReadArticle(user: user);
      }
      final updatedArticles = await readArticlesRepository.addReadArticle(
          user: user, article: article);
      state = state.copyWith(
        articles: AsyncValue.data(updatedArticles),
        articleIds: AsyncValue.data(
            updatedArticles.map((e) => '${e.creator}${e.slug}').toList()),
      );
    } catch (e, s) {
      state = state.copyWith(
        articles: AsyncValue.error(e, s),
        articleIds: AsyncValue.error(e, s),
      );
    }
  }

  Future<void> updateReadArticle(
      {required User user, required RssFeedArticle article}) async {
    final readArticlesRepository = ref.read(readArticlesRepositoryProvider);
    try {
      final updatedArticles = await readArticlesRepository.updateReadArticle(
          user: user, article: article);
      state = state.copyWith(
        articles: AsyncValue.data(updatedArticles),
        articleIds: AsyncValue.data(
            updatedArticles.map((e) => '${e.creator}${e.slug}').toList()),
      );
    } catch (e, s) {
      state = state.copyWith(
        articles: AsyncValue.error(e, s),
        articleIds: AsyncValue.error(e, s),
      );
    }
  }
}
