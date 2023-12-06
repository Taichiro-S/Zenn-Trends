// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// class NotionLoginBrowser extends InAppBrowser {
//   @override
//   Future<void> onBrowserCreated() async {
//     print("Browser Created!");
//   }

//   @override
//   Future<void> onLoadStart(url) async {
//     if (url != null) {
//       try {
//         if (url.toString().startsWith('zenntrends://oauth/callback?code')) {
//           // await notionOauthApi.login(url: url.toString());
//           // webViewController.hide();
//           // ref.invalidate(notionAuthStorageProvider);
//         }
//       } catch (e) {
//         throw Exception(e);
//       }
//     }
//     print("Started $url");
//   }

//   @override
//   Future<void> onLoadStop(url) async {
//     print("Stopped $url");
//   }

//   @override
//   void onExit() {
//     print("Browser closed!");
//   }
// }
