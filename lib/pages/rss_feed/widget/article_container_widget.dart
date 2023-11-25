import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/rss_feed/service/format_published_date.dart';

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
    final publishedDate = formatPublishedDate(article.publishedDate);
    return Container(
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
        child: StickyHeaderBuilder(
          builder: (context, stuckAmount) {
            // stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
            return Container(
              height: 50.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topRight,
                  colors: [
                    const Color.fromARGB(255, 107, 202, 255)
                        .withOpacity(0.6 + 0.4 * stuckAmount),
                    const Color.fromARGB(255, 179, 152, 255)
                        .withOpacity(0.6 + 0.4 * stuckAmount),
                  ],
                  stops: const [
                    0.0,
                    1.0,
                  ],
                ),
              ),
              // color: Colors.deepPurple[300],
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerLeft,
              child: Row(children: [
                Text(
                  publishedDate,
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                      size: 20,
                    ))
              ]),
            );
          },
          content: Container(
            color: Colors.grey[300],
            child: Card(
                elevation: 3,
                margin: const EdgeInsets.only(
                    top: 24, bottom: 24, left: 8, right: 8),
                child: Column(children: [
                  CachedNetworkImage(
                      imageUrl: article.enclosure ?? '',
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 180)
                ])),
          ),
        ));
  }
}
