import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/zenn_article/provider/notion_database_provider.dart';
import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_content_provider.dart';
import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_webview_provider.dart';
import 'package:zenn_trends/pages/zenn_article/widget/zenn_article_widget.dart';
import 'package:zenn_trends/theme/app_colors.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';
import 'package:zenn_trends/widget/skeleton_for_card_widget.dart';
import 'package:zenn_trends/widget/skelton_container_widget.dart';

@RoutePage()
class ZennArticlePage extends ConsumerWidget {
  const ZennArticlePage(
      {super.key, required this.article, required this.topicName});
  final RssFeedArticle article;
  final String topicName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webView = ref.watch(zennArticleWebViewProvider);
    final webViewNotifier = ref.watch(zennArticleWebViewProvider.notifier);
    final notionAuthStorageAsync = ref.watch(notionAuthStorageProvider
        .select((state) => state.notionAuthStorageState));
    final googleAuthAsync = ref.watch(googleAuthProvider);
    final router = AutoRouter.of(context);
    final notionDatabaseNotifier = ref.watch(notionDatabaseProvider.notifier);
    final notionDatabaseAsync = ref.watch(notionDatabaseProvider);
    final zennAricleContent = ref.watch(zennArticleContentProvider);
    return Scaffold(
      appBar: AppBar(
          title: Row(children: [
        Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(children: [
              const Text("Article"),
              googleAuthAsync.user.when(
                  loading: () => const Text('loading g user'),
                  error: (err, stack) => Text(err.toString()),
                  data: (user) {
                    if (user != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (notionAuthStorageAsync is AsyncLoading) {
                          ref
                              .read(notionAuthStorageProvider.notifier)
                              .getNotionWorkspace();
                        }
                      });
                      return const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text('google user'));
                    }
                    return Container();
                  }),
            ])),
      ])),
      body: Column(children: [
        Expanded(
            child: Stack(children: <Widget>[
          // ZennArticleWidget(article: article),
          webView.isError
              ? Container(
                  color: Colors.white,
                  child: Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                        Text(webView.errorText,
                            style: TextStyle(color: AppColors.light().onError))
                      ])))
              : webView.isLoading
                  ? Container(
                      color: Colors.white,
                      child: const Center(
                          child: CircleLoadingWidget(
                              color: Colors.green, fontSize: 20)),
                    )
                  : Container()
          // }
        ]))
      ]),
      floatingActionButton: notionAuthStorageAsync.when(
          data: (notionAuthState) {
            if (notionAuthState.isAuth) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (notionDatabaseAsync is AsyncLoading ||
                    (notionDatabaseAsync is AsyncData &&
                        notionDatabaseAsync.value == '')) {
                  notionDatabaseNotifier.searchDatabase();
                }
              });
              return notionDatabaseAsync.when(
                  data: (databaseId) {
                    if (databaseId == null ||
                        webView.currentUrl != article.link) {
                      return Container();
                    }
                    return FloatingActionButton(
                        backgroundColor: AppTheme.light().appColors.onPrimary,
                        onPressed: () async {
                          bool isError = false;
                          try {
                            await notionDatabaseNotifier.insertArticle(
                                databaseId: databaseId,
                                article: article,
                                content: zennAricleContent);
                          } catch (e, s) {
                            isError = true;
                            Fluttertoast.showToast(
                                backgroundColor: AppColors.light().error,
                                msg: "記事の追加に失敗しました");
                          }
                          if (!isError) {
                            Fluttertoast.showToast(
                                backgroundColor: AppColors.light().primary,
                                msg: "記事を追加しました");
                          }
                        },
                        child: const Icon(Icons.add));
                  },
                  loading: () => Container(),
                  // FloatingActionButton(
                  //       onPressed: () {},
                  //       backgroundColor: AppTheme.light().appColors.primary,
                  //       child:
                  //           const CircularProgressIndicator(color: Colors.blue),
                  //     ),
                  error: (err, stack) => Container());
            } else {
              return Container();
            }
          },
          loading: () =>
              const SkeltonContainerWidget(width: 60, height: 60, radius: 10),
          error: (err, stack) => Container()),
    );
  }
}
