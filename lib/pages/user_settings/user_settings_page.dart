import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zenn_trends/env/env.dart';
import 'package:zenn_trends/pages/account/api/notion_oauth_api.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/account/widget/google_login_button.dart';
import 'package:zenn_trends/pages/user_settings/provider/webview_provider.dart';
import 'package:zenn_trends/pages/user_settings/widget/notion_login_page_widget.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_colors.dart';
import 'package:zenn_trends/theme/app_theme.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class UserSettingsPage extends ConsumerWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    final notionOauthApi = ref.read(notionOauthApiProvider);
    final uri = Uri.parse(Env.notionOauthUrl);
    final webView = ref.watch(webViewProvider);
    final webViewNotifier = ref.read(webViewProvider.notifier);
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
                child: Text("Login Qiita")),
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
                    if (await canLaunchUrl(uri)) {
                      launchUrl(uri);
                    } else {
                      Fluttertoast.showToast(msg: 'エラーが発生しました。再度お試しください。');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}
