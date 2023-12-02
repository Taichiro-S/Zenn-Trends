import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/notion_account/api/notion_oauth_api.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_auth_storage_provider.dart';
import 'package:zenn_trends/pages/notion_account/provider/notion_integrate_webview_provider.dart';
import 'package:zenn_trends/pages/notion_account/widget/notion_login_page_widget.dart';
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
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   if (notionAuthStorageAsync is AsyncLoading) {
    //     ref.read(notionAuthStorageProvider.notifier).deleteWorkspace();
    //   }
    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (notionAuthStorageAsync is AsyncLoading) {
        ref.read(notionAuthStorageProvider.notifier).getNotionWorkspace();
      }
      // if (notionAuthStorageAsync is AsyncData &&
      //     notionAuthStorageAsync.value != null &&
      //     notionAuthStorageAsync.value!.isAuth) {
      //   ref.read(notionAuthStorageProvider.notifier).getNotionWorkspace();
      // }
    });
    if (webView.isOpen) {
      return Scaffold(
          appBar: AppBar(
              title: Row(children: [
            IconButton(
              icon: const Icon(Icons.close_outlined, color: Colors.black54),
              onPressed: () => webViewNotifier.hide(),
            ),
            const Padding(
                padding: EdgeInsetsDirectional.only(start: 20),
                child: Text("Login Notion")),
          ])),
          body: Column(children: [
            Expanded(
                child: Stack(children: <Widget>[
              const NotionLoginPageWidget(),
              webView.isError
                  ? Container(
                      color: Colors.white,
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                            Text(webView.errorText,
                                style:
                                    TextStyle(color: AppColors.light().onError))
                          ])))
                  : webView.isLoading
                      ? Container(
                          color: Colors.white,
                          child: const Center(
                              child: CircleLoadingWidget(
                                  color: Colors.green, fontSize: 20)),
                        )
                      : Container()
            ]))
          ]));
    } else {
      return Scaffold(
          appBar: AppBar(
              title:
                  Text("Notionアカウント連携", style: AppTheme.light().textTheme.h60)),
          body: notionAuthStorageAsync.when(
            data: (notionAuth) {
              if (notionAuth.isAuth) {
                print(notionAuth.isAuth);
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
                // return notionAccountAsync.when(
                //     data: (account) {
                //       return Column(children: [
                //         const Center(child: Text('連携済みです')),
                //         const SizedBox(height: 10),
                //         CustomCircleAvator(
                //           imageUrl: account.workspaceIcon,
                //           radius: 40,
                //           width: 80,
                //           height: 80,
                //         ),
                //         const SizedBox(height: 10),
                //         Text(
                //           account.workspaceName ?? 'No Name',
                //           style: AppTheme.light().textTheme.h40,
                //         ),
                //         ElevatedButton(
                //             onPressed: () => notionOauthApi.logout(),
                //             child: const Text('連携を解除する'))
                //       ]);
                //     },
                //     loading: () =>
                //         const Center(child: CircularProgressIndicator()),
                //     error: (err, stack) {
                //       print(err);
                //       Fluttertoast.showToast(
                //           backgroundColor: AppTheme.light().appColors.error,
                //           msg: "アカウントの読み込み中にエラーが発生しました");
                //       return const Text('エラーが発生しました');
                //     });

                //   return SingleChildScrollView(
                //       child: Container(
                //           padding: const EdgeInsets.all(16),
                //           child: Column(children: [
                //             CustomCircleAvator(
                //               imageUrl: user.photoURL,
                //               radius: 40,
                //               width: 80,
                //               height: 80,
                //             ),
                //             const SizedBox(height: 10),
                //             Text(
                //               user.displayName ?? 'No Name',
                //               style: AppTheme.light().textTheme.h40,
                //             ),
                //             Text(
                //               user.email!,
                //               style: AppTheme.light().textTheme.h20,
                //             ),
                //             const GoogleLogOutButton(),
                //             const Divider(),
                //             DefaultTabController(
                //                 length: 2,
                //                 child: Column(
                //                     mainAxisSize: MainAxisSize.min,
                //                     children: [
                //                       TabBar(tabs: [
                //                         Tab(
                //                             child: Row(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                               const Icon(
                //                                   LineAwesomeIcons.bookmark),
                //                               const SizedBox(width: 4),
                //                               Text('ブックマーク',
                //                                   style: AppTheme.light()
                //                                       .textTheme
                //                                       .h30),
                //                             ])),
                //                         Tab(
                //                             child: Row(
                //                                 mainAxisAlignment:
                //                                     MainAxisAlignment.center,
                //                                 children: [
                //                               const Icon(
                //                                   LineAwesomeIcons.history),
                //                               const SizedBox(width: 4),
                //                               Text('閲覧履歴',
                //                                   style: AppTheme.light()
                //                                       .textTheme
                //                                       .h30),
                //                             ])),
                //                       ]),
                //                       const SizedBox(
                //                           height: 200,
                //                           child: TabBarView(children: [
                //                             BookmarkedArtilcesWidget(),
                //                             ReadArtilcesWidget()
                //                           ]))
                //                     ])),
                //           ])));
                // } else {
                //   return Center(
                //       child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //         Text('ログインしていません', style: AppTheme.light().textTheme.h50),
                //         const SizedBox(height: 10),
                //         const GoogleLogInButton()
                //       ]));
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
