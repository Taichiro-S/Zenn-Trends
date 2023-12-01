import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_articles_state.dart';

part 'topics_rss_feed_articles_state.freezed.dart';

@freezed
class TopicsRssFeedArticlesState with _$TopicsRssFeedArticlesState {
  const factory TopicsRssFeedArticlesState({
    required Map<String, RssFeedArticlesState> topicsRssFeedArticles,
    required String selectedTopicName,
    required bool isLoadingMore,
  }) = _TopicsRssFeedArticlesState;
}
