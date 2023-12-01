import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/rss_feed/model/trend_topic.dart';
part 'trend_topics_state.freezed.dart';

@freezed
class TrendTopicsState with _$TrendTopicsState {
  const factory TrendTopicsState({
    required AsyncValue<List<TrendTopic>> trendTopics,
    required int index,
    required DateTime lastUpdatedAt,
  }) = _TrendTopicsState;
}
