import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
import 'package:zenn_trends/pages/account/widget/google_login_button.dart';
import 'package:zenn_trends/routes/router.dart';
import 'package:zenn_trends/theme/app_theme.dart';

class GoogleAuthWidget extends ConsumerWidget {
  const GoogleAuthWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    final router = AutoRouter.of(context);
    return googleAuth.user.when(
      data: (user) {
        if (user != null) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            CircleAvatar(
              backgroundImage: user.photoURL != null
                  ? NetworkImage(user.photoURL!)
                  : const AssetImage('assets/images/no_image.png')
                      as ImageProvider<Object>,
              radius: 40,
            ),
            Text(user.displayName ?? 'No Name'),
            ElevatedButton(
              onPressed: () async {
                await googleAuthNotifier.signOut();
                Fluttertoast.showToast(
                    backgroundColor: AppTheme.light().appColors.primary,
                    msg: "ログアウトしました");
              },
              child: const Text('ログアウト'),
            ),
          ]);
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
    );
  }
}
