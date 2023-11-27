import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_articles_state.dart';
import 'package:zenn_trends/pages/rss_feed/model/topics_rss_feed_articles_state.dart';
import 'package:zenn_trends/pages/rss_feed/repository/rss_feed_articles_repository.dart';
import 'package:zenn_trends/pages/rss_feed/service/is_over_update_time.dart';

part 'topics_rss_feed_articles_provider.g.dart';

@riverpod
class TopicsRssFeedArticles extends _$TopicsRssFeedArticles {
  @override
  TopicsRssFeedArticlesState build() {
    return const TopicsRssFeedArticlesState(
      topicsRssFeedArticles: {},
    );
  }

  /*
  rss feed articlesの取得
  */
  Future<bool> getTopicsRssFeedArticles({required String topicName}) async {
    final now = DateTime.now();
    final lastUpdatedAt =
        state.topicsRssFeedArticles[topicName]?.lastUpdatedAt.toDate() ??
            Timestamp(0, 0).toDate();
    final hasArticle = state.topicsRssFeedArticles.containsKey(topicName) &&
        state.topicsRssFeedArticles[topicName]!.rssFeedArticles.value
                ?.isNotEmpty ==
            true;
    final shouldFetchData = !hasArticle &&
        isOverUpdateTime(
            lastUpdatedAt: lastUpdatedAt,
            now: now,
            updateTimes: [7, 13, 19, 25]);
    if (shouldFetchData) {
      try {
        state = state.copyWith(
          topicsRssFeedArticles: {
            ...state.topicsRssFeedArticles,
            topicName: RssFeedArticlesState(
              rssFeedArticles: const AsyncValue.loading(),
              selectedTopicName: '',
              lastDocument: null,
              lastUpdatedAt: Timestamp(0, 0),
            )
          },
        );
        final topicsRssFeedArticles = await ref
            .read(rssFeedArticlesRepositoryProvider)
            .fetchRssFeedArticles(topicName: topicName);
        state = state.copyWith(topicsRssFeedArticles: {
          ...state.topicsRssFeedArticles,
          topicName: RssFeedArticlesState(
            rssFeedArticles: AsyncValue.data(topicsRssFeedArticles),
            selectedTopicName: topicName,
            lastDocument: null,
            lastUpdatedAt: Timestamp.now(),
          )
        });
      } catch (e, s) {
        state = state.copyWith(topicsRssFeedArticles: {
          ...state.topicsRssFeedArticles,
          topicName: RssFeedArticlesState(
            rssFeedArticles: AsyncValue.error(e, s),
            selectedTopicName: topicName,
            lastDocument: null,
            lastUpdatedAt: Timestamp.now(),
          )
        });
      }
      return true;
    } else {
      return false;
    }
  }

  void initializeTopicsRssFeedArticles({required String topicName}) {
    state = state.copyWith(
      topicsRssFeedArticles: {
        ...state.topicsRssFeedArticles,
        topicName: RssFeedArticlesState(
          rssFeedArticles: const AsyncValue.data([]),
          selectedTopicName: topicName,
          lastDocument: null,
          lastUpdatedAt: Timestamp(0, 0),
        )
      },
    );
  }

  /*
  topic nameを設定
  */
}
