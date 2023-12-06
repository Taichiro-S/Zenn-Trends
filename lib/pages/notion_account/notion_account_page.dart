import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/notion_account/api/notion_oauth_api.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_integrate_webview_provider.dart';
import 'package:zenn_trends/pages/notion_account/widget/notion_login_page_widget_ver5.dart';
import 'package:zenn_trends/theme/app_colors.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';
import 'package:zenn_trends/widget/custom_circle_avator.dart';

@RoutePage()
class NotionAccountPage extends ConsumerWidget {
  const NotionAccountPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webView = ref.watch(notionIntegrateWebViewProvider);
    final webViewNotifier = ref.read(notionIntegrateWebViewProvider.notifier);
    final notionOauthApi = ref.read(notionOauthApiProvider);
    final notionAuthStorageAsync = ref.watch(notionAuthStorageProvider
        .select((state) => state.notionAuthStorageState));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (notionAuthStorageAsync is AsyncLoading) {
        ref.read(notionAuthStorageProvider.notifier).getNotionWorkspace();
      }
    });
    if (webView.isOpen) {
      return Scaffold(
          body: SafeArea(
              child: Stack(children: <Widget>[
        const Column(children: [
          NotionLoginPageWidget(),
        ]),
        webView.isError
            ? Container(
                color: Colors.white,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      Text(webView.errorText,
                          style: TextStyle(color: AppColors.light().onError))
                    ])))
            : webView.isLoading
                ? Container(
                    color: Colors.white,
                    child: const Center(child: Text('Loading...')))
                : Container()
      ])));
      // ]));
    } else {
      return Scaffold(
          appBar: AppBar(
              title:
                  Text("Notionアカウント連携", style: AppTheme.light().textTheme.h60)),
          body: notionAuthStorageAsync.when(
            data: (notionAuth) {
              if (notionAuth.isAuth) {
                return Column(children: [
                  const Center(child: Text('連携済みです')),
                  const SizedBox(height: 10),
                  CustomCircleAvator(
                    imageUrl: notionAuth.workspaceIcon,
                    radius: 40,
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    notionAuth.workspaceName ?? 'No Name',
                    style: AppTheme.light().textTheme.h40,
                  ),
                  ElevatedButton(
                      onPressed: () => ref
                          .read(notionAuthStorageProvider.notifier)
                          .deleteWorkspace(),
                      child: const Text('連携を解除する'))
                ]);
              } else {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Text('連携していません', style: AppTheme.light().textTheme.h50),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () => webViewNotifier.show(),
                          child: const Text('連携する'))
                    ]));
              }
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) {
              Fluttertoast.showToast(
                  backgroundColor: AppTheme.light().appColors.error,
                  msg: "エラーが発生しました");
              return const Text('エラーが発生しました');
            },
          ));
    }
  }
}
