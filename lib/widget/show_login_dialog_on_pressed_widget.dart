import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_theme.dart';

class ShowLoginDialogOnPressedWidget extends ConsumerWidget {
  const ShowLoginDialogOnPressedWidget({super.key, required this.icon});
  final Widget icon;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    return IconButton(
        onPressed: () {
          if (Theme.of(context).platform == TargetPlatform.android) {
            showDialog<Widget>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Googleアカウントでログインしてください"),
                    content: const Text("ログインページに移動しますか？"),
                    actions: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Text('キャンセル'),
                      ),
                      GestureDetector(
                          child: const Text('ログイン'),
                          onTap: () async {
                            Navigator.pop(context);
                            final user = await googleAuthNotifier.singIn();
                            if (user != null) {
                              Fluttertoast.showToast(
                                  backgroundColor:
                                      AppTheme.light().appColors.primary,
                                  msg: "ログインしました");

                              router.pushAndPopUntil(
                                const RankingRoute(),
                                predicate: (route) => false,
                              );
                            }
                          })
                    ],
                  );
                });
          } else if (Theme.of(context).platform == TargetPlatform.iOS) {
            showDialog<Widget>(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text("Googleアカウントでログインしてください"),
                    content: const Text("ログインページに移動しますか？"),
                    actions: [
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.pop(context),
                        child: const Text('キャンセル'),
                      ),
                      CupertinoDialogAction(
                          child: const Text('ログイン'),
                          onPressed: () async {
                            Navigator.pop(context);
                            final user = await googleAuthNotifier.singIn();
                            if (user != null) {
                              Fluttertoast.showToast(
                                  backgroundColor:
                                      AppTheme.light().appColors.primary,
                                  msg: "ログインしました");

                              router.pushAndPopUntil(
                                const RankingRoute(),
                                predicate: (route) => false,
                              );
                            }
                          })
                    ],
                  );
                });
          }
        },
        icon: icon);
  }
}
