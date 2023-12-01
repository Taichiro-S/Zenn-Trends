import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/env/env.dart';
import 'package:zenn_trends/pages/notion_account/api/notion_oauth_api.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_account_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/uuid_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/webview_provider.dart';

class NotionLoginPageWidget extends ConsumerWidget {
  const NotionLoginPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final notionOauthNotifier = ref.read(notionAccountProvider.notifier);
    final notionOauthApi = ref.read(notionOauthApiProvider);
    InAppWebViewController? webViewController;
    final webViewNotifier = ref.read(webViewProvider.notifier);
    final uuid = ref.read(uuidProvider);
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(Env.notionOauthUrl)),
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
          try {
            if (url.toString().startsWith('zenntrends://oauth/callback?code')) {
              await notionOauthApi.login(url: url.toString());
              webViewNotifier.hide();
              ref.invalidate(notionAuthStorageProvider);
            }
          } catch (e) {
            throw Exception(e);
          }
        }
      },
      onLoadStop: (controller, url) async {
        //   if (url.toString().startsWith('https://qiita.com/login')) {
        //     await controller.evaluateJavascript(source: """
        //   document.querySelector('.sessions-Registration_oauthWrapper').style.display = 'none';
        //   // Use the appropriate selector for the elements you want to hide or remove
        // """);
        //   }
        webViewNotifier.loaded();
      },
      onLoadError: (controller, url, code, message) {
        // because onLoadError is also called when the user is redirected to the callback url
        // allow redirect to zenntrends://oauth/callback
        if (url.toString().startsWith('zenntrends') &&
            url.toString().contains('/oauth/callback')) {
          return;
        }
        webViewNotifier.error(message);
      },
    );
  }
}
