import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
part 'loaded_topics_state.freezed.dart';

@freezed
class LoadedTopicsState with _$LoadedTopicsState {
  const factory LoadedTopicsState({
    required AsyncValue<List<RankedTopic>> rankedTopics,
    required DocumentSnapshot? lastDoc,
    required bool isLoadingMore,
    required bool isSearching,
    required bool showSearchResult,
    String? searchWord,
  }) = _LoadedTopicsStatee;
}
