import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/zenn_article/provider/notion_database_provider.dart';
import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_webview_provider.dart';
import 'package:zenn_trends/pages/zenn_article/widget/zenn_article_widget.dart';
import 'package:zenn_trends/theme/app_colors.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class ZennArticlePage extends ConsumerWidget {
  const ZennArticlePage({super.key, required this.article});
  final RssFeedArticle article;
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
    return Scaffold(
        appBar: AppBar(
            title: const Row(children: [
          Padding(
              padding: EdgeInsetsDirectional.only(start: 20),
              child: Text("Article")),
        ])),
        body: Column(children: [
          Expanded(
              child: Stack(children: <Widget>[
            ZennArticleWidget(articleUrl: article.link),
            webView.isError
                ? Container(
                    color: Colors.white,
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text(webView.errorText,
                              style:
                                  TextStyle(color: AppColors.light().onError))
                        ])))
                : webView.isLoading
                    ? Container(
                        color: Colors.white,
                        child: const Center(
                            child: CircleLoadingWidget(
                                color: Colors.green, fontSize: 20)),
                      )
                    : googleAuthAsync.user.when(
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
                            return notionAuthStorageAsync.when(
                                data: (notionAuthState) {
                                  if (notionAuthState.isAuth) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      if (notionDatabaseAsync is AsyncLoading ||
                                          (notionDatabaseAsync is AsyncData &&
                                              notionDatabaseAsync.value ==
                                                  '')) {
                                        notionDatabaseNotifier.searchDatabase();
                                      }
                                    });
                                    return notionDatabaseAsync.when(
                                        data: (databaseId) {
                                          if (databaseId == null) {
                                            return const Text(
                                                'databaseId is null');
                                          }
                                          return FloatingActionButton(
                                              onPressed: () async {
                                                await notionDatabaseNotifier
                                                    .insertArticle(
                                                        databaseId: databaseId!,
                                                        article: article);
                                              },
                                              child: const Icon(Icons.add));
                                        },
                                        loading: () =>
                                            const Text('loading n user'),
                                        error: (err, stack) =>
                                            Text(err.toString()));
                                  } else {
                                    return const Text('not auth');
                                  }
                                },
                                loading: () => const Text('loading n user'),
                                error: (err, stack) => Text(err.toString()));
                          } else {
                            return Container();
                          }
                        })
          ]))
        ]));
  }
}
