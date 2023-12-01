import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/routes/router.dart';

@RoutePage()
class UserSettingsPage extends ConsumerWidget {
  const UserSettingsPage({super.key});
//   @override
//   ConsumerState<UserSettingsPage> createState() => _UserSettingsPage();
// }

// class _UserSettingsPage extends ConsumerState<UserSettingsPage> {
  // StreamSubscription? _sub;
  // String? catchLink;
  // String? parameter;

  // String? getQueryParameter(String? link) {
  //   if (link == null) return null;
  //   final uri = Uri.parse(link);
  //   String? code = uri.queryParameters['code'];
  //   return code;
  // }

  // Future<void> initUniLinks() async {
  //   _sub = linkStream.listen((String? link) async {
  //     //さっき設定したスキームをキャッチしてここが走る。
  //     catchLink = link;
  //     parameter = getQueryParameter(link);
  //     print(parameter);
  //     setState(() {});
  //     try {
  //       // await deleteCookies(url);
  //       if (catchLink != null &&
  //           catchLink
  //               .toString()
  //               .startsWith('zenntrends://oauth/callback?code')) {
  //         print(catchLink);
  //         await ref.read(notionOauthApiProvider).login(catchLink!);
  //       }
  //     } catch (e) {
  //       throw Exception(e);
  //     }
  //   }, onError: (err) {
  //     print(err);
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   initUniLinks();
  // }

  // @override
  // void dispose() {
  //   _sub?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    // final notionOauthApi = ref.read(notionOauthApiProvider);
    // final uri = Uri.parse(Env.notionOauthUrl);
    // final webView = ref.watch(webViewProvider);
    // final webViewNotifier = ref.read(webViewProvider.notifier);

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
                  router.push(const PrivacyPolicyRoute());
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
                        router.push(const AccountRoute());
                      }
                    }, loading: () {
                      EasyLoading.show();
                    }, error: (error, stack) {
                      Fluttertoast.showToast(msg: 'エラーが発生しました。再度お試しください。');
                    });
                  }),
              SettingsTile.navigation(
                  leading: const Icon(Icons.note_alt_outlined),
                  title: const Text('Notionアカウント連携'),
                  onPressed: (context) async {
                    router.push(const NotionAccountRoute());
                    // webViewNotifier.show();

                    // if (await canLaunchUrl(uri)) {
                    //   launchUrl(uri);
                    // } else {
                    //   Fluttertoast.showToast(msg: 'エラーが発生しました。再度お試しください。');
                    // }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
