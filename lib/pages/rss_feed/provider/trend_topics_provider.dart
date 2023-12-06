import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/trend_topic.dart';
import 'package:zenn_trends/pages/rss_feed/repository/trend_topics_repository.dart';
import 'package:zenn_trends/pages/rss_feed/service/is_over_update_time.dart';

part 'trend_topics_provider.g.dart';
part 'trend_topics_provider.freezed.dart';

@freezed
class TrendTopicsState with _$TrendTopicsState {
  const factory TrendTopicsState({
    required AsyncValue<List<TrendTopic>> trendTopics,
    required int index,
    required DateTime lastUpdatedAt,
  }) = _TrendTopicsState;
}

@riverpod
class TrendTopics extends _$TrendTopics {
  @override
  TrendTopicsState build() {
    return TrendTopicsState(
      trendTopics: const AsyncValue.loading(),
      index: 0,
      lastUpdatedAt: Timestamp(0, 0).toDate(),
    );
  }

  Future<bool> getTrendTopics() async {
    // 現在の日時と最終更新日時を取得
    final now = DateTime.now();
    final lastUpdate = state.lastUpdatedAt;

    if (isOverUpdateTime(
        lastUpdatedAt: lastUpdate, now: now, updateTimes: [15])) {
      try {
        state = state.copyWith(trendTopics: const AsyncValue.loading());
        final trendTopicsRepository = ref.read(trendTopicsRepositoryProvider);

        final newTopics = await trendTopicsRepository.fetchTrendTopics();

        state = state.copyWith(
          trendTopics: AsyncValue.data(newTopics),
          lastUpdatedAt: DateTime.now(),
        );
      } catch (e, s) {
        state = state.copyWith(trendTopics: AsyncValue.error(e, s));
      }
      return true;
    } else {
      return false;
    }
  }

  void setIndex(int index) {
    state = state.copyWith(index: index);
  }
}
