import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/account/api/google_auth_api.dart';
import 'package:zenn_trends/pages/account/model/google_auth_state.dart';

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

  Future<User?> _getSignedInUser() async {
    final googleAuthAPi = ref.read(googleAuthApiProvider);
    state = state.copyWith(user: const AsyncValue.loading());
    User? user;
    try {
      user = await googleAuthAPi.getSignedInUser();
      state = state.copyWith(user: AsyncValue.data(user));
    } catch (e, s) {
      state = state.copyWith(user: AsyncValue.error(e, s));
    }
    return user;
  }

  Future<User?> singIn() async {
    final googleAuthAPi = ref.read(googleAuthApiProvider);
    User? user;
    state = state.copyWith(user: const AsyncValue.loading());
    try {
      user = await googleAuthAPi.signIn();
      state = state.copyWith(user: AsyncValue.data(user));
    } catch (e, s) {
      state = state.copyWith(user: AsyncValue.error(e, s));
    }
    return user;
  }

  Future<void> signOut() async {
    final googleAuthAPi = ref.read(googleAuthApiProvider);
    state = state.copyWith(user: const AsyncValue.loading());
    try {
      await googleAuthAPi.signOut();
      state = state.copyWith(user: const AsyncValue.data(null));
    } catch (e, s) {
      state = state.copyWith(user: AsyncValue.error(e, s));
    }
  }
}
