import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'bookmarked_articles_state.freezed.dart';

@freezed
class BookmarkedArticlesState with _$BookmarkedArticlesState {
  const factory BookmarkedArticlesState({
    required AsyncValue<List<RssFeedArticle>> articles,
    required AsyncValue<List<String>> articleIds,
  }) = _BookmarkedArticlesState;
}
