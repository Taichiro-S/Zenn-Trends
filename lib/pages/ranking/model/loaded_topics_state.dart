import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

part 'loaded_topics_state.freezed.dart';

@freezed
class LoadedTopicsState with _$LoadedTopicsState {
  const factory LoadedTopicsState({
    required AsyncValue<List<RankedTopic>> weeklyRankedTopics,
    required AsyncValue<List<RankedTopic>> monthlyRankedTopics,
    required AsyncValue<List<RankedTopic>> weeklySearchedTopics,
    required AsyncValue<List<RankedTopic>> monthlySearchedTopics,
    required DocumentSnapshot? weeklyRankedLastDoc,
    required DocumentSnapshot? monthlyRankedLastDoc,
    required DocumentSnapshot? weeklySearchedLastDoc,
    required DocumentSnapshot? monthlySearchedLastDoc,
    required bool isLoadingMore,
    required bool isSearching,
    required bool showSearchResult,
    required Timestamp lastUpdatedAt,
    String? searchWord,
  }) = _LoadedTopicsState;
}
