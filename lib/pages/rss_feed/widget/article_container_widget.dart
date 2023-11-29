import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/rss_feed/service/format_published_date.dart';
import 'package:zenn_trends/pages/rss_feed/widget/bookmark_button_widget.dart';

class ArticleContainerWidget extends ConsumerWidget {
  const ArticleContainerWidget({
    super.key,
    required this.article,
    required this.index,
  });
  final RssFeedArticle article;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final now = DateTime.now();
    final publishedDate = formatPublishedDate(article.publishedDate, now);
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
              BookmarkButtonWidget(article: article),
            ]),
          );
        },
        content: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CachedNetworkImage(imageUrl: article.enclosure ?? '')),
          ],
        )
        // Card(
        //     elevation: 3,
        //     child: Padding(
        //         padding: const EdgeInsets.all(16),
        //         child: Column(children: [
        //           RichText(
        //               overflow: TextOverflow.ellipsis,
        //               maxLines: 4,
        //               text: TextSpan(children: [
        //                 TextSpan(
        //                     text: article.title,
        //                     style: const TextStyle(
        //                         color: Colors.black,
        //                         fontSize: 18,
        //                         fontWeight: FontWeight.bold)),
        //               ])),
        //         ]))),
        );
  }
}
