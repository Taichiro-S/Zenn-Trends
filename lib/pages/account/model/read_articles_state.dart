import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'read_articles_state.freezed.dart';

@freezed
class ReadArticlesState with _$ReadArticlesState {
  const factory ReadArticlesState({
    required AsyncValue<List<RssFeedArticle>> articles,
    required AsyncValue<List<String>> articleIds,
  }) = _ReadArticlesState;
}
