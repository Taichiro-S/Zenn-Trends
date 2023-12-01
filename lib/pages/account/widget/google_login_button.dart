import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/theme/app_theme.dart';

class GoogleLogInButton extends ConsumerWidget {
  const GoogleLogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
        ),
        onPressed: () async {
          final user = await googleAuthNotifier.singIn();
          if (user != null) {
            Fluttertoast.showToast(
                backgroundColor: AppTheme.light().appColors.primary,
                msg: "ログインしました");
          } else {
            Fluttertoast.showToast(
                backgroundColor: AppTheme.light().appColors.error,
                msg: "ログインに失敗しました");
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'ログイン',
                  style: AppTheme.light().textTheme.h30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
