// import 'dart:async';
// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:uni_links/uni_links.dart';
// import 'package:zenn_trends/env/env.dart';
// import 'package:zenn_trends/pages/notion_account/api/notion_oauth_api.dart';
// import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
// import 'package:zenn_trends/pages/notion_account/provider/notion_integrate_webview_provider.dart';
// import 'package:zenn_trends/pages/notion_account/service/notion_login_browser.dart';
// import 'package:zenn_trends/pages/notion_account/widget/notion_login_page_widget.dart';
// import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_webview_provider.dart';
// import 'package:zenn_trends/theme/app_colors.dart';
// import 'package:zenn_trends/theme/app_theme.dart';
// import 'package:zenn_trends/widget/circle_loading_widget.dart';
// import 'package:zenn_trends/widget/custom_circle_avator.dart';

// @RoutePage()
// class NotionAccountPage extends ConsumerStatefulWidget {
//   const NotionAccountPage({super.key});
//   @override
//   ConsumerState<NotionAccountPage> createState() => _NotionAccountPage();
// }

// class _NotionAccountPage extends ConsumerState<NotionAccountPage> {
//   final browser = NotionLoginBrowser();
//   InAppWebViewController? webViewController;
//   final settings = InAppBrowserClassSettings(
//       browserSettings: InAppBrowserSettings(
//           hideUrlBar: true,
//           toolbarTopBackgroundColor: Colors.white,
//           presentationStyle: ModalPresentationStyle.POPOVER),
//       webViewSettings: InAppWebViewSettings(
//         isInspectable: kDebugMode,
//         clearCache: true,
//         userAgent: Platform.isIOS
//             ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.1 Mobile/15E148 Safari/604.1'
//             : 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36',
//       ));

//   StreamSubscription? _sub;
//   @override
//   void initState() {
//     super.initState();
//     initUniLinks();
//   }

//   Future<void> initUniLinks() async {
//     _sub = linkStream.listen((link) async {
//       if (link != null &&
//           link.startsWith('notionsample://oauth/callback?code')) {
//         await ref.read(notionOauthApiProvider).login(url: link);
//         ref.invalidate(notionAuthStorageProvider);
//       }
//     }, onError: (e) {
//       ref.read(zennArticleWebViewProvider.notifier).error(e.toString());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final webView = ref.watch(notionIntegrateWebViewProvider);
//     // final webViewNotifier = ref.read(notionIntegrateWebViewProvider.notifier);
//     // final notionOauthApi = ref.read(notionOauthApiProvider);
//     final notionAuthStorageAsync = ref.watch(notionAuthStorageProvider
//         .select((state) => state.notionAuthStorageState));
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (notionAuthStorageAsync is AsyncLoading) {
//         ref.read(notionAuthStorageProvider.notifier).getNotionWorkspace();
//       }
//     });

//     return Scaffold(
//         appBar: AppBar(
//             title:
//                 Text("Notionアカウント連携", style: AppTheme.light().textTheme.h60)),
//         body: notionAuthStorageAsync.when(
//           data: (notionAuth) {
//             if (notionAuth.isAuth) {
//               return Column(children: [
//                 const Center(child: Text('連携済みです')),
//                 const SizedBox(height: 10),
//                 CustomCircleAvator(
//                   imageUrl: notionAuth.workspaceIcon,
//                   radius: 40,
//                   width: 80,
//                   height: 80,
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   notionAuth.workspaceName ?? 'No Name',
//                   style: AppTheme.light().textTheme.h40,
//                 ),
//                 ElevatedButton(
//                     onPressed: () => ref
//                         .read(notionAuthStorageProvider.notifier)
//                         .deleteWorkspace(),
//                     child: const Text('連携を解除する'))
//               ]);
//             } else {
//               return Center(
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                     Text('連携していません', style: AppTheme.light().textTheme.h50),
//                     const SizedBox(height: 10),
//                     ElevatedButton(
//                         onPressed: () {
//                           browser.openUrlRequest(
//                               urlRequest:
//                                   URLRequest(url: WebUri(Env.notionOauthUrl)),
//                               settings: settings);
//                         },
//                         child: const Text('連携する'))
//                   ]));
//             }
//           },
//           loading: () => const Center(child: CircularProgressIndicator()),
//           error: (err, stack) {
//             Fluttertoast.showToast(
//                 backgroundColor: AppTheme.light().appColors.error,
//                 msg: "エラーが発生しました");
//             return const Text('エラーが発生しました');
//           },
//         ));
//   }
// }
