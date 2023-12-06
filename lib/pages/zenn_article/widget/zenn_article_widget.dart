// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:zenn_trends/constant/api_endpoint.dart';
// import 'package:zenn_trends/constant/url.dart';
// import 'package:zenn_trends/constant/zenn.dart';
// import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
// import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_content_provider.dart';
// import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_webview_provider.dart';

// class ZennArticleWidget extends ConsumerWidget {
//   const ZennArticleWidget({super.key, required this.article});
//   final RssFeedArticle article;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     InAppWebViewController? webViewController;
//     // final webView = ref.watch(zennArticleWebViewProvider);
//     final webViewNotifier = ref.read(zennArticleWebViewProvider.notifier);
//     // final zennArticleContent = ref.watch(zennArticleContentProvider);
//     final zennArticleContentNotifier =
//         ref.watch(zennArticleContentProvider.notifier);
//     List<String> loadedPages = [];
//     return InAppWebView(
//       initialUrlRequest: URLRequest(url: Uri.parse(article.link)),
//       initialOptions: InAppWebViewGroupOptions(
//           crossPlatform: InAppWebViewOptions(
//         javaScriptEnabled: true,
//         useShouldOverrideUrlLoading: true,
//         useOnLoadResource: true,
//         clearCache: true,
//         userAgent: Platform.isIOS
//             ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1'
//             : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36',
//       )),
//       onWebViewCreated: (controller) {
//         webViewController = controller;
//       },
//       onLoadResource: (controller, resource) {
//         loadedPages.add(resource.url.toString());
//         // if (resource.url.toString() == article.link) {
//         //   webViewNotifier.setUrl(url: resource.url.toString());
//         //   print('load resource');
//         //   print(resource.url);
//         // } else if (resource.url.toString().startsWith(ZENN_API)) {
//         //   print('api request');
//         //   print(resource.url);
//         // } else {}
//         if (resource.url.toString() == article.link) {
//           print('load resource');
//           print(resource.url);
//         }
//         if (loadedPages.isNotEmpty && loadedPages.contains(article.link)) {
//           print('contains');
//           webViewNotifier.setUrl(article.link);
//         } else {
//           webViewNotifier.setUrl('');
//         }
//       },
//       onLoadStart: (controller, url) async {
//         if (url != null) {
//           webViewNotifier.loading();
//           webViewNotifier.clearError();
//           webViewNotifier.setUrl(url.toString());
//         }
//       },
//       onLoadStop: (controller, url) async {
//         if (url != null && url.toString() == article.link) {
//           webViewNotifier.setUrl(url.toString());
//           String? emoji = await controller.evaluateJavascript(source: """
//             document.querySelector('$ZENN_EMOJI_CLASS').textContent;""")
//               as String?;
//           print(emoji);
//           String? authorName = await controller.evaluateJavascript(source: """
//             document.querySelector('$ZENN_AUTHOR_LINK_CLASS').href;""")
//               as String?;
//           String? authorLink;
//           if (authorName != null) {
//             authorLink = '$ZENN_DEV_URL${authorName.split('/').last}';
//           }
//           print(authorLink);
//           String? topicsJson = await controller.evaluateJavascript(source: """
//             JSON.stringify(Array.from(document.querySelectorAll('$ZENN_TOPIC_CLASS')).map(function(element) {
//             return element.textContent;
//             }));
//             """) as String?;
//           List<String>? topics;
//           if (topicsJson != null) {
//             Iterable<dynamic> topicsIterable =
//                 json.decode(topicsJson) as Iterable<dynamic>;
//             topics = List<String>.from(topicsIterable);
//           }
//           print(topics);

//           zennArticleContentNotifier.setProperties(
//             emoji: emoji ?? '',
//             authorLink: authorLink ?? '',
//             topics: topics ?? [],
//           );
//         } else {
//           ref.invalidate(zennArticleContentProvider);
//         }
//         webViewNotifier.loaded();
//       },
//       onLoadError: (controller, url, code, message) {
//         webViewNotifier.error(message);
//       },
//     );
//   }
// }
