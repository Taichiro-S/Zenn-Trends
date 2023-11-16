import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/display_settings/provider/display_settings_provider.dart';
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
      final displaySettings = ref.read(displaySettingsProvider);

      ref.read(loadedTopicsProvider.notifier).getMoreRankedTopics(
          timePeriod: displaySettings.timePeriod,
          sortOrder: displaySettings.sortOrder);
    }
  }
}
