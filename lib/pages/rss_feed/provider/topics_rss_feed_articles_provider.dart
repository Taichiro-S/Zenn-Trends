import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/firestore.dart';
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
      selectedTopicName: '',
      isLoadingMore: false,
    );
  }

  /*
  rss feed articlesの取得
  */
  Future<bool> getTopicsRssFeedArticles({required String topicName}) async {
    final now = DateTime.now();
    final lastUpdatedAt =
        state.topicsRssFeedArticles[topicName]?.lastUpdatedAt ??
            Timestamp(0, 0).toDate();
    final hasArticle = state.topicsRssFeedArticles.containsKey(topicName) &&
        state.topicsRssFeedArticles[topicName]!.rssFeedArticles.value
                ?.isNotEmpty ==
            true;
    final shouldFetchData = !hasArticle &&
        isOverUpdateTime(
            lastUpdatedAt: lastUpdatedAt,
            now: now,
            updateTimes: TIME_TO_FETCH_RSS_FEED,
            delayMinutes: 30);
    if (shouldFetchData) {
      try {
        state = state.copyWith(
          topicsRssFeedArticles: {
            ...state.topicsRssFeedArticles,
            topicName: RssFeedArticlesState(
              rssFeedArticles: const AsyncValue.loading(),
              lastDocument: null,
              selectedTopicName: topicName,
              lastUpdatedAt: Timestamp(0, 0).toDate(),
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
            lastDocument: topicsRssFeedArticles.isNotEmpty
                ? topicsRssFeedArticles.last.documentSnapshot
                : null,
            selectedTopicName: topicName,
            lastUpdatedAt: DateTime.now(),
          )
        });
      } catch (e, s) {
        state = state.copyWith(topicsRssFeedArticles: {
          ...state.topicsRssFeedArticles,
          topicName: RssFeedArticlesState(
            rssFeedArticles: AsyncValue.error(e, s),
            lastDocument: null,
            selectedTopicName: topicName,
            lastUpdatedAt: DateTime.now(),
          )
        });
      }
      return true;
    } else {
      return false;
    }
  }

  Future<void> getMoreTopicsRssFeedArticles({required String topicName}) async {
    if ((state.topicsRssFeedArticles[topicName]!.lastDocument == null ||
            state.topicsRssFeedArticles[topicName]!.rssFeedArticles
                is! AsyncData) ||
        state.isLoadingMore) {
      print(topicName);
      print(state
          .topicsRssFeedArticles[topicName]!.rssFeedArticles.value!.length);
      return;
    }
    state = state.copyWith(isLoadingMore: true);
    try {
      final topicsRssFeedArticles = await ref
          .read(rssFeedArticlesRepositoryProvider)
          .fetchRssFeedArticles(
              topicName: topicName,
              startAfter: state.topicsRssFeedArticles[topicName]!.lastDocument);
      state = state.copyWith(
        topicsRssFeedArticles: {
          ...state.topicsRssFeedArticles,
          topicName: RssFeedArticlesState(
            rssFeedArticles: AsyncValue.data([
              ...(state.topicsRssFeedArticles[topicName]?.rssFeedArticles
                      .value ??
                  []),
              ...topicsRssFeedArticles
            ]),
            lastDocument: topicsRssFeedArticles.isNotEmpty
                ? topicsRssFeedArticles.last.documentSnapshot
                : null,
            selectedTopicName: topicName,
            lastUpdatedAt: DateTime.now(),
          ),
        },
        isLoadingMore: false,
      );
    } catch (e, s) {
      state = state.copyWith(topicsRssFeedArticles: {
        ...state.topicsRssFeedArticles,
        topicName: RssFeedArticlesState(
          rssFeedArticles: AsyncValue.error(e, s),
          lastDocument: null,
          selectedTopicName: topicName,
          lastUpdatedAt: DateTime.now(),
        )
      });
    } finally {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  void initializeTopicsRssFeedArticles({required String topicName}) {
    state = state.copyWith(
      topicsRssFeedArticles: {
        ...state.topicsRssFeedArticles,
        topicName: RssFeedArticlesState(
          rssFeedArticles: const AsyncValue.data([]),
          lastDocument: null,
          selectedTopicName: '',
          lastUpdatedAt: Timestamp(0, 0).toDate(),
        )
      },
    );
  }

  void setSelectedTopicName({required String topicName}) {
    state = state.copyWith(selectedTopicName: topicName);
  }
}
