import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_theme.dart';

class GoogleLogInButton extends ConsumerWidget {
  const GoogleLogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
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

            router.pushAndPopUntil(
              const RankingRoute(),
              predicate: (route) => false,
            );
          }
        },
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: AssetImage("assets/images/google_logo.png"),
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'ログイン',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(192, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
