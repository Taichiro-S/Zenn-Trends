import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'rss_feed_articles_state.freezed.dart';

@freezed
class RssFeedArticlesState with _$RssFeedArticlesState {
  const factory RssFeedArticlesState({
    required AsyncValue<List<RssFeedArticle>> rssFeedArticles,
    required DocumentSnapshot? lastDocument,
    required String selectedTopicName,
    required DateTime lastUpdatedAt,
  }) = _RssFeedArticlesState;
}
