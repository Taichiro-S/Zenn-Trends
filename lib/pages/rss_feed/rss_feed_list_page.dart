import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:zenn_trends/pages/account/provider/bookmarked_articles_provider.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/account/provider/read_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/provider/topics_rss_feed_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/provider/trend_topics_provider.dart';
import 'package:zenn_trends/pages/rss_feed/widget/rss_feed_of_topic_widget.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';
import 'package:zenn_trends/widget/custom_circle_avator.dart';
import 'package:zenn_trends/widget/skeleton_for_stickyheader_widget.dart';

@RoutePage()
class RssFeedListPage extends ConsumerWidget {
  const RssFeedListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendTopicsAsync =
        ref.watch(trendTopicsProvider.select((state) => state.trendTopics));
    final loadedTopicsRssFeedArticles = ref.watch(topicsRssFeedArticlesProvider
        .select((state) => state.topicsRssFeedArticles));
    final loadedTrendTopicsNotifier = ref.read(trendTopicsProvider.notifier);
    final googleAuth = ref.watch(googleAuthProvider);
    final topicsRssFeedAticlesNotifier =
        ref.read(topicsRssFeedArticlesProvider.notifier);
    final selectedIndex =
        ref.watch(trendTopicsProvider.select((state) => state.index));
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

    return trendTopicsAsync.when(loading: () {
      return DefaultTabController(
          length: 1,
          child: Scaffold(
              appBar: AppBar(
                leading: Padding(
                  padding: const EdgeInsets.all(8),
                  child: SkeletonAnimation(
                    child: const CircleAvatar(
                      backgroundColor: Colors.white70,
                      radius: 16,
                    ),
                  ),
                ),
                bottom: TabBar(
                  tabs: [
                    SkeletonAnimation(child: const Tab(text: 'Loading ... ')),
                  ],
                ),
              ),
              body: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return const SkeltonContainerForStickyHeaderWidget();
                },
              )));
    }, error: (error, stack) {
      return Center(child: Text('エラー: $error'));
    }, data: (topics) {
      if (topics.isEmpty) {
        return const Center(
            child: Text('トピックがありません😢',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
      } else {
        int initialIndex = 0;
        bool init = true;
        for (var topic in topics) {
          if (loadedTopicsRssFeedArticles.isEmpty && init) {
            init = false;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              topicsRssFeedAticlesNotifier.getTopicsRssFeedArticles(
                  topicName: topics[0].name);
              topicsRssFeedAticlesNotifier.setSelectedTopicName(
                  topicName: topics[0].name);
            });
          }
          if (!loadedTopicsRssFeedArticles.keys.contains(topic.name)) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              topicsRssFeedAticlesNotifier.initializeTopicsRssFeedArticles(
                  topicName: topic.name);
            });
          }
        }
        return DefaultTabController(
            initialIndex: initialIndex,
            length: topics.length,
            child: Scaffold(
                appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomCircleAvator(
                        imageUrl: topics[selectedIndex].imageUrl),
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: topics.map((topic) {
                      // golangのdisplayNameがGoになっているので修正
                      if (topic.name == 'golang') {
                        return const Tab(text: 'Golang');
                      }
                      return Tab(text: topic.displayName);
                    }).toList(),
                    onTap: (value) async {
                      loadedTrendTopicsNotifier.setIndex(value);
                      topicsRssFeedAticlesNotifier.setSelectedTopicName(
                          topicName: topics[value].name);
                    },
                  ),
                ),
                body: googleAuth.user.when(
                    loading: () =>
                        const SkeltonContainerForStickyHeaderWidget(),
                    error: (error, stack) => Center(
                        child: Text('エラー: $error',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    data: (user) {
                      if (user != null) {
                        /*TODO
                            bookmarked articlesのfetchが3回くらい走る
                            この処理をウィジェットの外に出したい
                            */
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ref
                              .read(bookmarkedArticlesProvider.notifier)
                              .getBookmarkedArticles(user: user);
                          ref
                              .read(readArticlesProvider.notifier)
                              .getReadArticles(user: user);
                        });
                      }
                      return TabBarView(
                          /* TODO
                              tabcontoollerを使ってタブ切り替え時にデータフェッチしたいが
                              エラーが出るので切り替えられない様にしている
                              */
                          physics: const NeverScrollableScrollPhysics(),
                          children: loadedTopicsRssFeedArticles.values
                              .map<Widget>((state) {
                            if (state.rssFeedArticles.isLoading) {
                              return const SkeltonContainerForStickyHeaderWidget();
                            } else if (state.rssFeedArticles.hasValue) {
                              return RssFeedOfTopicWidget(
                                topicName: state.selectedTopicName,
                                user: user,
                              );
                            } else {
                              return const Center(
                                  child: Text('エラーが発生しました😢',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)));
                            }
                          }).toList());
                    })));
      }
    });
  }
}
