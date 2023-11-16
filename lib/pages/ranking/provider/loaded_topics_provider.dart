import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/firestore_arg.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/model/loaded_topics_state.dart';
import 'package:zenn_trends/pages/ranking/repository/ranked_topics_repository.dart';

part 'loaded_topics_provider.g.dart';

@riverpod
class LoadedTopics extends _$LoadedTopics {
  @override
  LoadedTopicsState build() {
    return const LoadedTopicsState(
      rankedTopics: AsyncValue.loading(),
      lastDoc: null,
      isLoadingMore: false,
      isSearching: false,
    );
  }

  /*
  topicの取得
  */

  Future<void> getRankedTopics(
      {required Collection timePeriod,
      required RankedTopicsSortOrder sortOrder}) async {
    final rankedTopicsrepository = ref.watch(rankedTopicsRepositoryProvider);
    state = state.copyWith(rankedTopics: const AsyncValue.loading());
    try {
      final newTopics = await rankedTopicsrepository.fetchRankedTopics(
          timePeriod: timePeriod, sortOrder: sortOrder);
      state = state.copyWith(
        rankedTopics: AsyncValue.data(newTopics),
        lastDoc: newTopics.isNotEmpty ? newTopics.last.documentSnapshot : null,
      );
    } catch (e, s) {
      state = state.copyWith(rankedTopics: AsyncValue.error(e, s));
    }
  }

  Future<void> getMoreRankedTopics(
      {required Collection timePeriod,
      required RankedTopicsSortOrder sortOrder}) async {
    final rankedTopicsrepository = ref.watch(rankedTopicsRepositoryProvider);
    if (state.lastDoc == null ||
        state.rankedTopics is! AsyncData ||
        state.isLoadingMore) {
      return;
    }
    state = state.copyWith(isLoadingMore: true);
    try {
      final newTopics = await rankedTopicsrepository.fetchRankedTopics(
          timePeriod: timePeriod,
          sortOrder: sortOrder,
          startAfter: state.lastDoc);
      state = state.copyWith(
        rankedTopics: AsyncValue.data(
            [...(state.rankedTopics.value ?? []), ...newTopics]),
        lastDoc: newTopics.isNotEmpty ? newTopics.last.documentSnapshot : null,
        isLoadingMore: false,
      );
    } catch (e, s) {
      state = state.copyWith(rankedTopics: AsyncValue.error(e, s));
    } finally {
      state = state.copyWith(isLoadingMore: false);
    }
  }

  /*
  検索機能
  */

  Future<void> searchRankedTopics(
      {required Collection timePeriod,
      required RankedTopicsSortOrder sortOrder,
      required String searchWord}) async {
    final rankedTopicsrepository = ref.watch(rankedTopicsRepositoryProvider);
    state = state.copyWith(rankedTopics: const AsyncValue.loading());
    try {
      final newTopics = await rankedTopicsrepository.fetchRankedTopics(
          timePeriod: timePeriod, sortOrder: sortOrder, searchWord: searchWord);
      state = state.copyWith(
        rankedTopics: AsyncValue.data(newTopics),
        lastDoc: newTopics.isNotEmpty ? newTopics.last.documentSnapshot : null,
      );
    } catch (e, s) {
      state = state.copyWith(rankedTopics: AsyncValue.error(e, s));
    }
  }

  void setSearchWord(String searchWord) {
    state = state.copyWith(isSearching: true);
    state = state.copyWith(searchWord: searchWord);
  }

  void clearSearchWord() {
    state = state.copyWith(isSearching: true);
    state = state.copyWith(searchWord: '');
  }

  void startSearching() {
    state = state.copyWith(isSearching: true);
  }

  void search({required String searchWord}) {
    final displaySettings = ref.watch(displaySettingsProvider);
    state = state.copyWith(isSearching: false);
    state = state.copyWith(searchWord: searchWord);

    searchRankedTopics(
        timePeriod: displaySettings.timePeriod,
        sortOrder: displaySettings.sortOrder,
        searchWord: searchWord);
  }

  void stopSearching() {
    state = state.copyWith(isSearching: false);
  }

  /*
  お気に入り機能
  */
}
