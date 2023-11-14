import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/ranking/model/loaded_tags_state.dart';
import 'package:zenn_trends/ranking/repository/ranked_tags_repository.dart';

part 'loaded_tags_provider.g.dart';

@riverpod
class LoadedTags extends _$LoadedTags {
  @override
  LoadedTagsState build() {
    return const LoadedTagsState(
      rankedTags: AsyncValue.loading(),
      lastDoc: null,
      isLoadingMore: false,
    );
  }

  Future<void> fetchRankedTags(
      {required Collection timePeriod,
      required RankedTagsSortOrder sortOrder}) async {
    final rankedTagsrepository = ref.watch(rankedTagsRepositoryProvider);
    state = state.copyWith(rankedTags: const AsyncValue.loading());
    try {
      final newTags = await rankedTagsrepository.getRankedTags(
          timePeriod: timePeriod, sortOrder: sortOrder);
      state = state.copyWith(
        rankedTags: AsyncValue.data(newTags),
        lastDoc: newTags.isNotEmpty ? newTags.last.documentSnapshot : null,
      );
    } catch (e, s) {
      state = state.copyWith(rankedTags: AsyncValue.error(e, s));
    }
  }

  Future<void> fetchMoreRankedTags(
      {required Collection timePeriod,
      required RankedTagsSortOrder sortOrder}) async {
    final rankedTagsrepository = ref.watch(rankedTagsRepositoryProvider);
    if (state.lastDoc == null ||
        state.rankedTags is! AsyncData ||
        state.isLoadingMore) {
      return;
    }
    state = state.copyWith(isLoadingMore: true);
    try {
      final newTags = await rankedTagsrepository.getRankedTags(
          timePeriod: timePeriod,
          sortOrder: sortOrder,
          startAfter: state.lastDoc);
      state = state.copyWith(
        rankedTags:
            AsyncValue.data([...(state.rankedTags.value ?? []), ...newTags]),
        lastDoc: newTags.isNotEmpty ? newTags.last.documentSnapshot : null,
        isLoadingMore: false,
      );
    } catch (e, s) {
      state = state.copyWith(rankedTags: AsyncValue.error(e, s));
    } finally {
      state = state.copyWith(isLoadingMore: false);
    }
  }
}
