import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_topics_provider.dart';

part 'scroll_controller_provider.g.dart';

@riverpod
class ScrollControllerNotifier extends _$ScrollControllerNotifier {
  @override
  ScrollController build() {
    final ScrollController controller = ScrollController();
    controller.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchInitialDatas();
    });
    return controller;
  }

  void _fetchInitialDatas() {
    final displaySettings = ref.read(displaySettingsProvider);
    ref.read(loadedTopicsProvider.notifier).getRankedTopics(
        timePeriod: displaySettings.timePeriod,
        sortOrder: displaySettings.sortOrder);
  }

  void _scrollListener() {
    if (state.position.pixels == state.position.maxScrollExtent) {
      final showSearchResult = ref.watch(
          loadedTopicsProvider.select((state) => state.showSearchResult));
      final searchWord =
          ref.watch(loadedTopicsProvider.select((state) => state.searchWord));
      final displaySettings = ref.read(displaySettingsProvider);
      if (showSearchResult) {
        ref.read(loadedTopicsProvider.notifier).getMoreSearchedTopics(
            timePeriod: displaySettings.timePeriod,
            sortOrder: displaySettings.sortOrder,
            searchWord: searchWord!);
      } else {
        ref.read(loadedTopicsProvider.notifier).getMoreRankedTopics(
            timePeriod: displaySettings.timePeriod,
            sortOrder: displaySettings.sortOrder);
      }
    }
  }
}
