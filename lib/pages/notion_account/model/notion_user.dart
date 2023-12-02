// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notion_user.freezed.dart';
part 'notion_user.g.dart';

@freezed
class NotionUser with _$NotionUser {
  const factory NotionUser({
    required String id,
    required String? type,
    required String? name,
    @JsonKey(name: 'avator_url') required String? avatorUrl,
  }) = _NotionUser;

  factory NotionUser.fromJson(Map<String, dynamic> json) =>
      _$NotionUserFromJson(json);
}
