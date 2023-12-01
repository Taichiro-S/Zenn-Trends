import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/service/secure_storage.dart';
import '/constant/storage_key.dart';

part 'notion_auth_storage_provider.g.dart';

@riverpod
class NotionAuthStorage extends _$NotionAuthStorage {
  final secureStorage = SecureStorage();
  @override
  Future<bool> build() async {
    try {
      if (await secureStorage.read(NOTION_API_ACCESS_TOKEN) != null) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception('Flutter Storage error: $e');
    }
  }
}
