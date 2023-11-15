import 'package:zenn_trends/service/secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '/constant/storage_key.dart';

part 'firebase_auth_storage_provider.g.dart';

@riverpod
class QiitaAuthStorage extends _$QiitaAuthStorage {
  final secureStorage = SecureStorage();
  @override
  Future<bool> build() async {
    try {
      if (await secureStorage.read(QIITA_API_ACCESS_TOKEN) != null) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('Flutter Storage error: $e');
    }
  }
}
