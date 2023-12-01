import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zenn_trends/pages/account/provider/bookmarked_articles_provider.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/account/provider/read_articles_provider.dart';
import 'package:zenn_trends/pages/account/widget/bookmarked_articles_widget.dart';
import 'package:zenn_trends/pages/account/widget/google_login_button.dart';
import 'package:zenn_trends/pages/account/widget/google_logout_button.dart';
import 'package:zenn_trends/pages/account/widget/read_articles_widget.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/custom_circle_avator.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final readArticlesAsync =
        ref.watch(readArticlesProvider.select((state) => state.articles));
    final bookmarkedArticlesAsync =
        ref.watch(bookmarkedArticlesProvider.select((state) => state.articles));
    return Scaffold(
        appBar:
            AppBar(title: Text("アカウント", style: AppTheme.light().textTheme.h60)),
        body: googleAuth.user.when(
          data: (user) {
            if (user != null) {
              return SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(children: [
                        CustomCircleAvator(
                          imageUrl: user.photoURL,
                          radius: 40,
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          user.displayName ?? 'No Name',
                          style: AppTheme.light().textTheme.h40,
                        ),
                        Text(
                          user.email!,
                          style: AppTheme.light().textTheme.h20,
                        ),
                        const GoogleLogOutButton(),
                        const Divider(),
                        DefaultTabController(
                            length: 2,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TabBar(tabs: [
                                    Tab(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          const Icon(LineAwesomeIcons.bookmark),
                                          const SizedBox(width: 4),
                                          Text('ブックマーク',
                                              style: AppTheme.light()
                                                  .textTheme
                                                  .h30),
                                        ])),
                                    Tab(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          const Icon(LineAwesomeIcons.history),
                                          const SizedBox(width: 4),
                                          Text('閲覧履歴',
                                              style: AppTheme.light()
                                                  .textTheme
                                                  .h30),
                                        ])),
                                  ]),
                                  const SizedBox(
                                      height: 200,
                                      child: TabBarView(children: [
                                        BookmarkedArtilcesWidget(),
                                        ReadArtilcesWidget()
                                      ]))
                                ])),
                      ])));
            } else {
              return Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text('ログインしていません', style: AppTheme.light().textTheme.h50),
                    const SizedBox(height: 10),
                    const GoogleLogInButton()
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
