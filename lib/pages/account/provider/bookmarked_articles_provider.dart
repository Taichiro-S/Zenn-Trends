import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/firestore.dart';
import 'package:zenn_trends/pages/account/model/bookmarked_articles_state.dart';
import 'package:zenn_trends/pages/account/repository/bookmarked_articles_repository.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'bookmarked_articles_provider.g.dart';

@riverpod
class BookmarkedArticles extends _$BookmarkedArticles {
  @override
  BookmarkedArticlesState build() {
    return const BookmarkedArticlesState(
      articles: AsyncValue.data([]),
      articleIds: AsyncValue.data([]),
    );
  }

  Future<void> getBookmarkedArticles({required User user}) async {
    final bookmarkedArticlesRepository =
        ref.read(bookmarkedArticlesRepositoryProvider);
    final articles = state.articles.value ?? [];
    if (articles.isEmpty) {
      state = state.copyWith(
          articles: const AsyncValue.loading(),
          articleIds: const AsyncValue.loading());
      try {
        final articles = await bookmarkedArticlesRepository
            .fetchBookmarkedArticle(user: user);
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

  Future<bool> addBookmarkedArticle(
      {required User user, required RssFeedArticle article}) async {
    if (state.articles.value!.length > BOOKMARK_LIMIT) {
      return false;
    }
    final bookmarkedArticlesRepository =
        ref.read(bookmarkedArticlesRepositoryProvider);
    try {
      final updatedArticles = await bookmarkedArticlesRepository
          .addBookmarkedArticle(user: user, article: article);
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
    return true;
  }

  Future<void> removeBookmarkedArticle(
      {required User user, required RssFeedArticle article}) async {
    final bookmarkedArticlesRepository =
        ref.read(bookmarkedArticlesRepositoryProvider);
    try {
      final updatedArticles = await bookmarkedArticlesRepository
          .removeBookmarkedArticle(user: user, article: article);
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
