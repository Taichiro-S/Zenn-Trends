import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/env/env.dart';
import 'package:zenn_trends/pages/notion_account/api/notion_oauth_api.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_integrate_webview_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/uuid_provider.dart';

class NotionLoginPageWidget extends ConsumerWidget {
  const NotionLoginPageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final GlobalKey webViewKey = GlobalKey();
    final notionOauthApi = ref.read(notionOauthApiProvider);
    InAppWebViewController? webViewController;
    final webView = ref.watch(notionIntegrateWebViewProvider);
    final webViewNotifier = ref.read(notionIntegrateWebViewProvider.notifier);
    // final uuid = ref.read(uuidProvider);

    return Expanded(
        child: Column(children: [
      Expanded(
          child: Stack(children: [
        InAppWebView(
          // key: webViewKey,
          initialUrlRequest: URLRequest(url: Uri.parse(Env.notionOauthUrl)),
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                mediaPlaybackRequiresUserGesture: false,
                javaScriptEnabled: true,
                useShouldOverrideUrlLoading: true,
                useOnLoadResource: true,
                clearCache: true,
                userAgent: Platform.isIOS
                    ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1'
                    : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko)',
              ),
              android: AndroidInAppWebViewOptions(
                disableDefaultErrorPage: true,
                useHybridComposition: true,
              ),
              ios: IOSInAppWebViewOptions(
                allowsInlineMediaPlayback: true,
              )),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStart: (controller, url) async {
            print('onLoadStart');
            if (url != null) {
              webViewNotifier.loading();
              webViewNotifier.clearError();
              try {
                if (url
                    .toString()
                    .startsWith('zenntrends://oauth/callback?code')) {
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
            webViewNotifier.loaded();
          },
          onLoadError: (controller, url, i, s) async {
            webViewNotifier.error(s);
          },
          onProgressChanged: (controller, progress) {
            webViewNotifier.setProgress(progress / 100);
          },
        ),
        webView.progress < 1.0
            ? LinearProgressIndicator(value: webView.progress)
            : Container(),
      ])),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            child: const Icon(Icons.close),
            onPressed: () {
              webViewNotifier.hide();
            },
          ),
          ElevatedButton(
            child: const Icon(Icons.arrow_back),
            onPressed: () {
              webViewController?.goBack();
            },
          ),
          ElevatedButton(
            child: const Icon(Icons.arrow_forward),
            onPressed: () {
              webViewController?.goForward();
            },
          ),
          ElevatedButton(
            child: const Icon(Icons.refresh),
            onPressed: () {
              webViewController?.reload();
            },
          ),
        ],
      ),
    ]));
  }
}
