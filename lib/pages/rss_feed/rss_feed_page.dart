import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/rss_feed/provider/topics_rss_feed_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/provider/trend_topics_provider.dart';
import 'package:zenn_trends/pages/rss_feed/widget/rss_feed_of_topic_widget.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class RssFeedPage extends ConsumerWidget {
  const RssFeedPage({Key? key, this.selectedTopic}) : super(key: key);
  final RankedTopic? selectedTopic;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendTopicsAsync =
        ref.watch(trendTopicsProvider.select((state) => state.trendTopics));
    final loadedTopicsRssFeedArticles = ref.watch(topicsRssFeedArticlesProvider
        .select((state) => state.topicsRssFeedArticles));
    final loadedTrendTopicsNotifier = ref.read(trendTopicsProvider.notifier);
    ref.listen<AsyncValue<User?>>(
        googleAuthProvider.select((state) => state.user), (_, user) {
      if (user.value != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {});
      }
    });
    ref.listen<int>(trendTopicsProvider.select((state) => state.index),
        (prev, next) {
      if (prev != next) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref
              .read(topicsRssFeedArticlesProvider.notifier)
              .getTopicsRssFeedArticles(
                  topicName: trendTopicsAsync.value![next].name);
        });
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadedTrendTopicsNotifier.getTrendTopics();
    });

    return trendTopicsAsync.when(
        loading: () => const Center(
            child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
        error: (error, stack) {
          print(error);
          return Center(child: Text('エラー: $error'));
        },
        data: (topics) {
          if (topics.isEmpty) {
            return const Center(
                child: Text('トピックがありません😢',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
          } else {
            var initialIndex = 0;
            bool init = true;
            for (var topic in topics) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (selectedTopic != null &&
                    selectedTopic!.name == topic.name) {
                  loadedTrendTopicsNotifier.setIndex(topics.indexOf(topic));
                  initialIndex = topics.indexOf(topic);
                  ref
                      .read(topicsRssFeedArticlesProvider.notifier)
                      .getTopicsRssFeedArticles(topicName: selectedTopic!.name);
                } else if (loadedTopicsRssFeedArticles.isEmpty && init) {
                  init = false;
                  ref
                      .read(topicsRssFeedArticlesProvider.notifier)
                      .getTopicsRssFeedArticles(topicName: topics[0].name);
                }
                if (!loadedTopicsRssFeedArticles.keys.contains(topic.name)) {
                  ref
                      .read(topicsRssFeedArticlesProvider.notifier)
                      .initializeTopicsRssFeedArticles(topicName: topic.name);
                }
              });
            }
            return DefaultTabController(
                initialIndex: initialIndex,
                animationDuration: const Duration(milliseconds: 500),
                length: topics.length,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: topics
                          .map((topic) => Tab(text: topic.displayName))
                          .toList(),
                      onTap: (value) async {
                        loadedTrendTopicsNotifier.setIndex(value);
                      },
                    ),
                  ),
                  body: TabBarView(
                      /* TODO
                      tabcontoollerを使ってタブ切り替え時にデータフェッチしたいが
                      エラーが出るので切り替えられない様にしている
                      */
                      physics: const NeverScrollableScrollPhysics(),
                      children: loadedTopicsRssFeedArticles.values
                          .map<Widget>((state) {
                        if (state.rssFeedArticles.isLoading) {
                          return const Center(
                              child: CircleLoadingWidget(
                                  color: Colors.blue, fontSize: 20));
                        } else if (state.rssFeedArticles.hasValue) {
                          return RssFeedOfTopicWidget(
                            topicName: state.selectedTopicName,
                          );
                        } else {
                          return const Center(
                              child: Text('エラーが発生しました😢',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)));
                        }
                      }).toList()),
                ));
          }
        });
  }
}
