import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_auth_api.g.dart';

class GoogleAuthApi {
  final _firebaseAuth = FirebaseAuth.instance;
  Future<User?> getSignedInUser() async {
    User? user = _firebaseAuth.currentUser;
    return user;
  }

  Future<User?> signIn() async {
    User? user;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final googleAuth = await googleUser?.authentication;
      if (googleAuth == null) {
        return null;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      user = userCredential.user;
    } on FirebaseException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
    return user;
  }

  Future<void> signOut() async {
    try {
      if (!kIsWeb) {
        await GoogleSignIn().signOut();
      }
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }
}

@riverpod
GoogleAuthApi googleAuthApi(GoogleAuthApiRef ref) {
  return GoogleAuthApi();
}
