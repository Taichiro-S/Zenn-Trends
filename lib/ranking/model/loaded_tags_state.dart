import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/ranking/model/ranked_tag.dart';
part 'loaded_tags_state.freezed.dart';

@freezed
class LoadedTagsState with _$LoadedTagsState {
  const factory LoadedTagsState({
    required AsyncValue<List<RankedTag>> rankedTags,
    required DocumentSnapshot? lastDoc,
    required bool isLoadingMore,
  }) = _LoadedTagsState;
}
