import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/profile/api/google_auth_api.dart';
import 'package:zenn_trends/pages/profile/model/google_auth_state.dart';

part 'google_auth_provider.g.dart';

@riverpod
class GoogleAuth extends _$GoogleAuth {
  @override
  GoogleAuthState build() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getSignedInUser();
    });
    return const GoogleAuthState(user: AsyncValue.loading());
  }

  Future<void> _getSignedInUser() async {
    final googleAuthAPi = ref.watch(googleAuthApiProvider);
    state = state.copyWith(user: const AsyncValue.loading());
    try {
      final user = await googleAuthAPi.getSignedInUser();
      state = state.copyWith(user: AsyncValue.data(user));
    } catch (e, s) {
      state = state.copyWith(user: AsyncValue.error(e, s));
    }
  }

  Future<void> singIn() async {
    final googleAuthAPi = ref.watch(googleAuthApiProvider);
    state = state.copyWith(user: const AsyncValue.loading());
    try {
      final user = await googleAuthAPi.signIn();
      state = state.copyWith(user: AsyncValue.data(user));
    } catch (e, s) {
      state = state.copyWith(user: AsyncValue.error(e, s));
    }
  }

  Future<void> signOut() async {
    final googleAuthAPi = ref.watch(googleAuthApiProvider);
    state = state.copyWith(user: const AsyncValue.loading());
    try {
      await googleAuthAPi.signOut();
      state = state.copyWith(user: const AsyncValue.data(null));
    } catch (e, s) {
      state = state.copyWith(user: AsyncValue.error(e, s));
    }
  }
}
