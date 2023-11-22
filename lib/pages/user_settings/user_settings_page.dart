import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/account/widget/google_login_button.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_theme.dart';

@RoutePage()
class UserSettingsPage extends ConsumerWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('プライバシーポリシー'),
                onPressed: (context) {
                  AutoRouter.of(context).pushNamed('/privacy_policy');
                },
              ),
              SettingsTile.navigation(
                  leading: const Icon(Icons.person_outline),
                  title: const Text('アカウント'),
                  onPressed: (context) {
                    googleAuth.user.when(data: (user) {
                      if (user != null) {
                        AutoRouter.of(context).pushNamed('/account');
                      } else {
                        if (Theme.of(context).platform == TargetPlatform.iOS) {
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
                                          final user =
                                              await googleAuthNotifier.singIn();
                                          if (user != null) {
                                            router.push(const AccountRoute());
                                            Fluttertoast.showToast(
                                                backgroundColor:
                                                    AppTheme.light()
                                                        .appColors
                                                        .primary,
                                                msg: "ログインしました");
                                          }
                                        })
                                  ],
                                );
                              });
                        } else if (Theme.of(context).platform ==
                            TargetPlatform.android) {
                          showDialog<Widget>(
                              context: context,
                              builder: (context) {
                                return const CupertinoAlertDialog(
                                  title: Text("Googleアカウントでログインしてください"),
                                  actions: [GoogleLogInButton()],
                                );
                              });
                        }
                      }
                    }, loading: () {
                      EasyLoading.show();
                    }, error: (error, stack) {
                      Fluttertoast.showToast(msg: 'エラーが発生しました。再度お試しください。');
                    });
                  })
            ],
          ),
        ],
      ),
    );
  }
}
