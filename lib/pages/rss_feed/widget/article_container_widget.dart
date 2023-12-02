import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:zenn_trends/pages/account/provider/read_articles_provider.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/rss_feed/service/format_published_date.dart';
import 'package:zenn_trends/pages/rss_feed/widget/bookmark_button_widget.dart';
import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_webview_provider.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/widget/skelton_container_widget.dart';

class ArticleContainerWidget extends ConsumerWidget {
  const ArticleContainerWidget({
    super.key,
    required this.article,
    required this.index,
    this.user,
  });
  final RssFeedArticle article;
  final int index;
  final User? user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uri = Uri.parse(article.link);
    final now = DateTime.now();
    final publishedDate = formatPublishedDate(article.publishedDate, now);
    final readArticleIdsAsync =
        ref.watch(readArticlesProvider.select((state) => state.articleIds));
    final readArticlesNotifier = ref.read(readArticlesProvider.notifier);
    final articleId = '${article.creator}${article.slug}';
    final router = AutoRouter.of(context);
    final webViewNotifier = ref.watch(zennArticleWebViewProvider.notifier);
    return StickyHeaderBuilder(
        builder: (context, stuckAmount) {
          return Container(
            height: 50.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight,
                colors: [
                  Color.fromARGB(255, 107, 202, 255),
                  Color.fromARGB(255, 179, 152, 255)
                ],
                stops: [
                  0.0,
                  1.0,
                ],
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Row(children: [
              Text(
                publishedDate,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              BookmarkButtonWidget(user: user, article: article),
            ]),
          );
        },
        content: readArticleIdsAsync.when(
            loading: () => const SkeltonContainerWidget(),
            error: (error, stack) {
              return Center(child: Text('エラー: $error'));
            },
            data: (readArticles) {
              return Stack(
                children: [
                  GestureDetector(
                    child: Opacity(
                        opacity: readArticles.contains(articleId) ? 0.3 : 1,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: article.enclosure != null
                              ? CachedNetworkImage(
                                  imageUrl: article.enclosure!,
                                  placeholder: (context, url) =>
                                      const SkeltonContainerWidget(),
                                  errorWidget: (context, url, error) =>
                                      const Image(
                                          image: AssetImage(
                                              'assets/images/no_image.png')))
                              : const Image(
                                  image:
                                      AssetImage('assets/images/no_image.png')),
                        )),
                    onTap: () async {
                      if (!readArticles.contains(articleId) && user != null) {
                        readArticlesNotifier.addReadArticle(
                            user: user!, article: article);
                      } else if (readArticles.contains(articleId) &&
                          user != null) {
                        readArticlesNotifier.updateReadArticle(
                            user: user!, article: article);
                      }
                      router.push(
                        ZennArticleRoute(article: article),
                      );

                      // if (await canLaunchUrl(uri)) {
                      //   launchUrl(uri);
                      // }
                    },
                  ),
                ],
              );
            }));
  }
}
