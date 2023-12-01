import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/pages/account/provider/bookmarked_articles_provider.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/account/provider/read_articles_provider.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';
import 'package:zenn_trends/pages/rss_feed/provider/topics_rss_feed_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/provider/trend_topics_provider.dart';
import 'package:zenn_trends/pages/rss_feed/widget/article_container_widget.dart';
import 'package:zenn_trends/pages/rss_feed/widget/rss_feed_of_topic_widget.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';
import 'package:zenn_trends/widget/skeleton_for_stickyheader_widget.dart';

@RoutePage()
class RssFeedOfTopicPage extends ConsumerWidget {
  const RssFeedOfTopicPage({Key? key, required this.selectedTopic})
      : super(key: key);
  final RankedTopic selectedTopic;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final topicsRssFeedAticlesNotifier =
        ref.read(topicsRssFeedArticlesProvider.notifier);
    ref.listen<AsyncValue<User?>>(
        googleAuthProvider.select((state) => state.user), (_, user) {
      if (user.value != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {});
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      topicsRssFeedAticlesNotifier.getTopicsRssFeedArticles(
          topicName: selectedTopic.name);
    });
    final articles = ref.watch(topicsRssFeedArticlesProvider.select((state) =>
        state.topicsRssFeedArticles[selectedTopic.name]?.rssFeedArticles));
    final articlesScrollController = ScrollController();
    articlesScrollController.addListener(() {
      if (articlesScrollController.position.pixels ==
          articlesScrollController.position.maxScrollExtent) {
        ref
            .read(topicsRssFeedArticlesProvider.notifier)
            .getMoreTopicsRssFeedArticles(topicName: selectedTopic.name);
      }
    });
    final lastDoc = ref.watch(topicsRssFeedArticlesProvider.select((state) =>
        state.topicsRssFeedArticles[selectedTopic.name]?.lastDocument));
    return Scaffold(
        appBar: AppBar(
          title: Row(children: [
            CircleAvatar(
              backgroundColor: Colors.white70,
              backgroundImage: selectedTopic.imageUrl != null
                  ? CachedNetworkImageProvider(selectedTopic.imageUrl!)
                  : const AssetImage('assets/images/no_image.png')
                      as ImageProvider<Object>,
              radius: 24,
            ),
            const SizedBox(width: 10),
            Text(selectedTopic.displayName)
          ]),
        ),
        body: googleAuth.user.when(
            loading: () => const Center(
                child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
            error: (error, stack) => Center(
                child: Text('エラー: $error',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold))),
            data: (user) {
              if (user != null) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref
                      .read(bookmarkedArticlesProvider.notifier)
                      .getBookmarkedArticles(user: user);
                  ref
                      .read(readArticlesProvider.notifier)
                      .getReadArticles(user: user);
                });
              }
              if (articles == null) {
                return ListView.builder(
                  controller: articlesScrollController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const SkeltonContainerForStickyHeaderWidget();
                  },
                );
              }
              return articles.when(loading: () {
                return ListView.builder(
                  controller: articlesScrollController,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const SkeltonContainerForStickyHeaderWidget();
                  },
                );
              }, error: (error, stack) {
                return Center(child: Text('エラー: $error'));
              }, data: (articles) {
                if (articles.isEmpty) {
                  return const Center(
                      child: Text('記事がありません😢',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)));
                } else {
                  return RefreshIndicator(
                      child: ListView.builder(
                        controller: articlesScrollController,
                        itemCount: articles.length + 1,
                        itemBuilder: (context, index) {
                          if (index == articles.length) {
                            if (lastDoc != null &&
                                articles.length >= DEFAULT_LOAD_ARTICLES) {
                              return const Center(
                                  child: Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: SizedBox(
                                          height: 24,
                                          width: 24,
                                          child: CircularProgressIndicator(
                                              color: Colors.blue))));
                            } else if (articles.length > 1) {
                              return const Center(
                                  child: Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text('記事がありません')));
                            } else {
                              return Container();
                            }
                          }

                          final article = articles[index];

                          return ArticleContainerWidget(
                              user: user, article: article, index: index);
                        },
                      ),
                      onRefresh: () async {
                        if (await ref
                            .read(topicsRssFeedArticlesProvider.notifier)
                            .getTopicsRssFeedArticles(
                                topicName: selectedTopic.name)) {
                          Fluttertoast.showToast(
                              msg: 'データを更新しました',
                              backgroundColor:
                                  AppTheme.light().appColors.primary);
                        } else {
                          Fluttertoast.showToast(
                              msg: 'データは最新です',
                              backgroundColor:
                                  AppTheme.light().appColors.primary);
                        }
                      });
                }
              });
            }));
  }
}
