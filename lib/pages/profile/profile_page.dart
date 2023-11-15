import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/api/qiita_auth_api.dart';
import 'package:zenn_trends/pages/profile/provider/qiita_profile_provider.dart';
import 'package:zenn_trends/provider/firebase_auth_storage_provider.dart';
import 'package:zenn_trends/theme/app_colors.dart';
import 'package:zenn_trends/widget/circle_loading_widget.dart';

@RoutePage()
class QiitaProfilePage extends ConsumerWidget {
  const QiitaProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isQiitaAuthAsync = ref.watch(qiitaAuthStorageProvider);
    final firebaseAuthRepository = QiitaAuthApi();

    ref.listen<AsyncValue<bool>>(qiitaAuthStorageProvider,
        (_, isQiitaAuthAsync) {
      if (isQiitaAuthAsync.value == true) {
        ref.invalidate(qiitaProfileProvider);
      }
    });

      return Scaffold(
          appBar: AppBar(
            title: const Text("Proflie"),
          ),
          body: isQiitaAuthAsync.when(
            error: (e, s) => Text(e.toString()),
            loading: () => const Center(
                child: CircleLoadingWidget(color: Colors.green, fontSize: 20)),
            data: (isAuth) {
              if (isAuth) {
                final qiitaProfileAsync = ref.watch(qiitaProfileProvider);
                return qiitaProfileAsync.when(
                  error: (e, s) => Text(e.toString()),
                  loading: () => const Center(
                      child: CircleLoadingWidget(
                          color: Colors.green, fontSize: 20)),
                  data: (qiitaProfile) {
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                          Text('userame: ${qiitaProfile.name ?? '名無し'} さん'),
                          ElevatedButton(
                              onPressed: () async {
                                await qiitaAuth.logout();
                                ref.invalidate(qiitaAuthStorageProvider);
                              },
                              child: const Text('ログアウト'))
                        ]));
                  },
                );
              } else {
                return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                      const Text('ログインしていません'),
                      ElevatedButton(
                          onPressed: () => webViewNotifier.show(),
                          child: const Text('ログイン'))
                    ]));
              }
            },
          ));
    }
  }
}
