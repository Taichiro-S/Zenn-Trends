import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_webview_provider.dart';

class ZennArticleWidget extends ConsumerWidget {
  const ZennArticleWidget({super.key, required this.articleUrl});
  final String articleUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    InAppWebViewController? webViewController;
    final webViewNotifier = ref.read(zennArticleWebViewProvider.notifier);
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(articleUrl)),
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
            useShouldOverrideUrlLoading: true,
            useOnLoadResource: true,
            clearCache: true,
            userAgent: Platform.isIOS
                ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15' +
                    ' (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1'
                : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) ' +
                    'AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36',
          ),
          android: AndroidInAppWebViewOptions(
              initialScale: 100, disableDefaultErrorPage: true)),
      onWebViewCreated: (controller) {
        webViewController = controller;
      },
      onLoadStart: (controller, url) async {
        if (url != null) {
          webViewNotifier.loading();
          webViewNotifier.clearError();
          webViewNotifier.setUrl(url: url.toString());
        }
      },
      onLoadStop: (controller, url) async {
        webViewNotifier.loaded();
      },
      onLoadError: (controller, url, code, message) {
        webViewNotifier.error(message);
      },
    );
  }
}
