import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/env/env.dart';
import 'package:zenn_trends/pages/account/api/notion_oauth_api.dart';
import 'package:zenn_trends/pages/user_settings/provider/uuid_provider.dart';
import 'package:zenn_trends/pages/user_settings/provider/webview_provider.dart';

class NotionLoginPageWidget extends ConsumerWidget {
  const NotionLoginPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notionOauthApi = ref.read(notionOauthApiProvider);
    InAppWebViewController? webViewController;
    final webViewNotifier = ref.read(webViewProvider.notifier);
    final uuid = ref.read(uuidProvider);
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(Env.notionOauthUrl)),
      initialOptions: InAppWebViewGroupOptions(
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
            // await deleteCookies(url);
            if (url.toString().contains('/oauth/callback')) {
              print(url);
              await notionOauthApi.login(url, uuid);
              webViewNotifier.hide();
              ref.invalidate(notionOauthApiProvider);
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
        // allow redirect to qiitatrend://oauth/callback
        if (url.toString().startsWith('zenntrend') &&
            url.toString().contains('/oauth/callback')) {
          return;
        }
        webViewNotifier.error(message);
      },
    );
  }
}
