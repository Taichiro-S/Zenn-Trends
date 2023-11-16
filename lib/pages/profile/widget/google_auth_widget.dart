import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/profile/provider/google_auth_provider.dart';

class GoogleAuthWidget extends ConsumerWidget {
  const GoogleAuthWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleAuth = ref.watch(googleAuthProvider);
    final googleAuthNotifier = ref.read(googleAuthProvider.notifier);
    return googleAuth.user.when(
      data: (user) {
        return user != null
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircleAvatar(
                  backgroundImage: user.photoURL != null
                      ? NetworkImage(user.photoURL!)
                      : const AssetImage('assets/images/no_image.png')
                          as ImageProvider<Object>,
                  radius: 40,
                ),
                Text(user.displayName ?? 'Google User'),
                ElevatedButton(
                  onPressed: () {
                    googleAuthNotifier.signOut();
                  },
                  child: const Text('Sign out'),
                ),
              ])
            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('ログインしていません'),
                ElevatedButton(
                  onPressed: () {
                    googleAuthNotifier.singIn();
                  },
                  child: const Text('Sign in'),
                ),
              ]);
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text(err.toString()),
    );
  }
}
