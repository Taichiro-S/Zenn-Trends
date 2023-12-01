import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'deep_link_sub_state.freezed.dart';

@freezed
class DeepLinkSubState with _$DeepLinkSubState {
  const factory DeepLinkSubState({
    required StreamSubscription<dynamic>? subscription,
  }) = _DeepLinkSubState;
}
