import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_user.freezed.dart';
part 'zenn_user.g.dart';

@freezed
class ZennUser with _$ZennUser {
  const factory ZennUser({
    required int id,
    required String username,
    required String? name,
    required String? avatarUrl,
    required int? totalLikedCount,
  }) = _ZennUser;

  factory ZennUser.fromJson(Map<String, dynamic> json) =>
      _$ZennUserFromJson(json);

  factory ZennUser.fromDocument(DocumentSnapshot doc) {
    return ZennUser(
      id: doc['id'] as int,
      username: doc['username'] as String,
      name: doc['name'] as String?,
      avatarUrl: doc['avatar_url'] as String?,
      totalLikedCount: doc['total_liked_count'] as int?,
    );
  }
}
