import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/bookmarked_articles_provider.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/account/widget/google_auth_widget.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/custom_circle_avator.dart';

@RoutePage()
class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final bookmarkedArticlesAsync =
        ref.watch(bookmarkedArticlesProvider.select((state) => state.articles));

    final router = AutoRouter.of(context);
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
                        const Divider(),
                        const DefaultTabController(
                            length: 2,
                            child: Column(children: [
                              TabBar(tabs: [
                                Tab(
                                  icon: Icon(LineAwesomeIcons.bookmark),
                                  text: 'ブックマーク',
                                ),
                                Tab(
                                  icon: Icon(LineAwesomeIcons.history),
                                  text: '閲覧履歴',
                                ),
                              ]),
                              Expanded(
                                  child: TabBarView(children: [
                                GoogleAuthWidget(),
                                GoogleAuthWidget(),
                              ]))
                            ])),
                      ]))
                  // : [
                  //   CircleAvatar(
                  //     backgroundImage: user.photoURL != null
                  //         ? NetworkImage(user.photoURL!)
                  //         : const AssetImage('assets/images/no_image.png')
                  //             as ImageProvider<Object>,
                  //     radius: 40,
                  //   ),
                  //   Text(user.displayName ?? 'No Name'),
                  //   ElevatedButton(
                  //     onPressed: () async {
                  //       await googleAuthNotifier.signOut();
                  //       Fluttertoast.showToast(
                  //           backgroundColor: AppTheme.light().appColors.primary,
                  //           msg: "ログアウトしました");
                  //     },
                  //     child: const Text('ログアウト'),
                  //   ),
                  // ]
                  );
            } else {
              router.navigate(const RankingRoute());
              return Container();
            }
          },
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) {
            Fluttertoast.showToast(
                backgroundColor: AppTheme.light().appColors.error,
                msg: "エラーが発生しました");
            return const Text('エラーが発生しました');
          },
        ));
  }
}
