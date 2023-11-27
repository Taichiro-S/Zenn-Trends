import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
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
    );
  }

  Future<void> getBookmarkedArticles({required User user}) async {
    final bookmarkedArticlesRepository =
        ref.read(bookmarkedArticlesRepositoryProvider);
    final articles = state.articles.value ?? [];
    if (articles.isEmpty) {
      state = state.copyWith(articles: const AsyncValue.loading());
      try {
        final articles = await bookmarkedArticlesRepository
            .fetchBookmarkedArticle(user: user);
        state = state.copyWith(articles: AsyncValue.data(articles));
      } catch (e, s) {
        state = state.copyWith(articles: AsyncValue.error(e, s));
      }
    }
  }

  Future<void> addBookmarkedArticle(
      {required User user, required RssFeedArticle article}) async {
    final bookmarkedArticlesRepository =
        ref.read(bookmarkedArticlesRepositoryProvider);
    try {
      final updatedArticles = await bookmarkedArticlesRepository
          .addBookmarkedArticle(user: user, article: article);
      state = state.copyWith(
        articles: AsyncValue.data(updatedArticles),
      );
    } catch (e, s) {
      state = state.copyWith(
        articles: AsyncValue.error(e, s),
      );
    }
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
      );
    } catch (e, s) {
      state = state.copyWith(
        articles: AsyncValue.error(e, s),
      );
    }
  }
}
