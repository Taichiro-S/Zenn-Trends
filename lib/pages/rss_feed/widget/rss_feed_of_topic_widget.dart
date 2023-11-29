import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/constant/default_value.dart';
import 'package:zenn_trends/pages/rss_feed/provider/scroll_controller_provider.dart';
import 'package:zenn_trends/pages/rss_feed/provider/topics_rss_feed_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/widget/article_container_widget.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

class RssFeedOfTopicWidget extends ConsumerWidget {
  const RssFeedOfTopicWidget({
    Key? key,
    required this.topicName,
  }) : super(key: key);
  final String topicName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articles = ref.watch(topicsRssFeedArticlesProvider.select(
        (state) => state.topicsRssFeedArticles[topicName]!.rssFeedArticles));
    // final scrollController = ScrollController();
    final scrollController = ref.watch(scrollControllerNotifierProvider);
    final lastDoc = ref.watch(topicsRssFeedArticlesProvider.select(
        (state) => state.topicsRssFeedArticles[topicName]!.lastDocument));
    print(lastDoc == null);
    print(lastDoc?.id);
    return articles.when(
        loading: () => const Center(
            child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
        error: (error, stack) {
          print(error);
          return Center(child: Text('エラー: $error'));
        },
        data: (articles) {
          if (articles.isEmpty) {
            print('empty');
            return const Center(
                child: Text('記事がありません😢',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
          } else {
            return RefreshIndicator(
                child: ListView.builder(
                  controller: scrollController,
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
                                child: Text('トピックがありません')));
                      } else {
                        return Container();
                      }
                    }
                    final article = articles[index];

                    return ArticleContainerWidget(
                        article: article, index: index);
                  },
                ),
                onRefresh: () async {
                  if (await ref
                      .read(topicsRssFeedArticlesProvider.notifier)
                      .getTopicsRssFeedArticles(topicName: topicName!)) {
                    Fluttertoast.showToast(
                        msg: 'データを更新しました',
                        backgroundColor: AppTheme.light().appColors.primary);
                  } else {
                    Fluttertoast.showToast(
                        msg: 'データは最新です',
                        backgroundColor: AppTheme.light().appColors.primary);
                  }
                });
          }
        });
  }
}
