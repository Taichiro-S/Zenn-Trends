import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_auth_state.freezed.dart';

@freezed
class GoogleAuthState with _$GoogleAuthState {
  const factory GoogleAuthState({
    required AsyncValue<User?> user,
  }) = _GoogleAuthState;
}
