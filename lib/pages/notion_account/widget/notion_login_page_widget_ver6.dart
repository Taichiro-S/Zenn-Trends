// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:zenn_trends/env/env.dart';
// import 'package:zenn_trends/pages/notion_account/api/notion_oauth_api.dart';
// import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
// import 'package:zenn_trends/pages/notion_account/provider/notion_integrate_webview_provider.dart';
// import 'package:zenn_trends/pages/notion_account/provider/uuid_provider.dart';
// import 'package:zenn_trends/theme/app_colors.dart';
// import 'package:zenn_trends/widget/circle_loading_widget.dart';

// class NotionLoginPageWidget extends ConsumerWidget {
//   const NotionLoginPageWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final GlobalKey webViewKey = GlobalKey();
//     final notionOauthApi = ref.read(notionOauthApiProvider);
//     InAppWebViewController? webViewController;
//     final webView = ref.watch(notionIntegrateWebViewProvider);
//     final webViewNotifier = ref.read(notionIntegrateWebViewProvider.notifier);
//     final uuid = ref.read(uuidProvider);

//     return
//         // SafeArea(
//         //     child: Column(children: <Widget>[
//         // Expanded(
//         //     child: Stack(children: [
//         InAppWebView(
//       key: webViewKey,
//       initialUrlRequest: URLRequest(url: WebUri(Env.notionOauthUrl)),
//       initialSettings: InAppWebViewSettings(
//         // resourceCustomSchemes: const ['zenntrends'],
//         clearCache: true,
//         userAgent: Platform.isIOS
//             ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1'
//             : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko)',
//       ),
//       onWebViewCreated: (controller) {
//         webViewController = controller;
//       },
//       onLoadStart: (controller, url) async {
//         print('onLoadStart');
//         if (url != null) {
//           webViewNotifier.loading();
//           webViewNotifier.clearError();
//           try {
//             if (url.toString().startsWith('zenntrends://oauth/callback?code')) {
//               await notionOauthApi.login(url: url.toString());
//               webViewNotifier.hide();
//               ref.invalidate(notionAuthStorageProvider);
//             }
//           } catch (e) {
//             throw Exception(e);
//           }
//         }
//       },
//       onLoadStop: (controller, url) async {
//         print('onLoadStop');
//         webViewNotifier.loaded();
//       },
//       onReceivedError: (controller, request, error) {
//         // because onLoadError is also called when the user is redirected to the callback url
//         // allow redirect to zenntrends://oauth/callback
//         // if (request.url
//         //     .toString()
//         //     .startsWith('zenntrends://oauth/callback?code')) {
//         //   return;
//         // }
//         webViewNotifier.error(error.description);
//       },
//       // onProgressChanged: (controller, progress) {
//       //   webViewNotifier.setProgress(progress / 100);
//       // },
//     );
//     // webView.progress < 1.0
//     //     ? LinearProgressIndicator(value: webView.progress)
//     //     : Container(),
//     // ]));
//     // ButtonBar(
//     //   alignment: MainAxisAlignment.center,
//     //   children: <Widget>[
//     //     ElevatedButton(
//     //       child: const Icon(Icons.close),
//     //       onPressed: () {
//     //         webViewNotifier.hide();
//     //         // webViewController?.dispose();
//     //       },
//     //     ),
//     //     ElevatedButton(
//     //       child: const Icon(Icons.arrow_back),
//     //       onPressed: () {
//     //         webViewController?.goBack();
//     //       },
//     //     ),
//     //     ElevatedButton(
//     //       child: const Icon(Icons.arrow_forward),
//     //       onPressed: () {
//     //         webViewController?.goForward();
//     //       },
//     //     ),
//     //     ElevatedButton(
//     //       child: const Icon(Icons.refresh),
//     //       onPressed: () {
//     //         webViewController?.reload();
//     //       },
//     //     ),
//     //   ],
//     // ),
//     // webView.isError
//     //     ? Container(
//     //         color: Colors.white,
//     //         child: Center(
//     //             child: Column(
//     //                 mainAxisAlignment: MainAxisAlignment.center,
//     //                 mainAxisSize: MainAxisSize.min,
//     //                 children: [
//     //               Text(webView.errorText,
//     //                   style: TextStyle(color: AppColors.light().onError))
//     //             ])))
//     //     // : webView.isLoading
//     //     //     ? Container(
//     //     //         color: Colors.white,
//     //     //         child: const Center(
//     //     //             child: CircleLoadingWidget(
//     //     //                 color: Colors.green, fontSize: 20)),
//     //     //       )
//     //     : Container()
//     // ]));
//   }
// }
