import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/ranking/provider/display_settings_provider.dart';
import 'package:zenn_trends/pages/ranking/provider/loaded_topics_provider.dart';
import 'package:zenn_trends/pages/rss_feed/provider/topics_rss_feed_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/provider/trend_topics_provider.dart';

part 'scroll_controller_provider.g.dart';

@riverpod
class ScrollControllerNotifier extends _$ScrollControllerNotifier {
  @override
  ScrollController build() {
    final ScrollController controller = ScrollController();
    controller.addListener(_scrollListener);
    return controller;
  }

  void _scrollListener() {
    if (state.position.pixels == state.position.maxScrollExtent) {
      final topicName = ref.watch(topicsRssFeedArticlesProvider
          .select((state) => state.selectedTopicName));
      if (topicName != '') {
        ref
            .read(topicsRssFeedArticlesProvider.notifier)
            .getMoreTopicsRssFeedArticles(topicName: topicName);
      }
    }
  }
}
