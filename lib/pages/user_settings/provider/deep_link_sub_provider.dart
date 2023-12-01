import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uni_links/uni_links.dart';
import 'package:zenn_trends/pages/user_settings/model/deep_link_sub_state.dart';
part 'deep_link_sub_provider.g.dart';

@riverpod
class DeepLinkSub extends _$DeepLinkSub {
  @override
  DeepLinkSubState build() {
    return const DeepLinkSubState(
      subscription: null,
    );
  }

  Future<void> initUniLinks() async {
    final sub = linkStream.listen((String? link) {
      // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }
}
