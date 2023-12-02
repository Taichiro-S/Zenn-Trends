import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/notion_account/model/notion_user.dart';

part 'notion_auth_state.freezed.dart';

@freezed
class NotionAuthState with _$NotionAuthState {
  const factory NotionAuthState({
    required bool isAuth,
    required String botId,
    required String? duplicatedTemplateId,
    required NotionUser? owner,
    required String? workspaceIcon,
    required String workspaceId,
    required String? workspaceName,
  }) = _NotionAuthState;

  factory NotionAuthState.fromJson(Map<String, dynamic> json) {
    final owner = json['owner'] as Map<String, dynamic>;
    final user = owner['user'] as Map<String, dynamic>;
    return NotionAuthState(
      isAuth: json['isAuth'] as bool,
      botId: json['botId'] as String,
      duplicatedTemplateId: json['duplicatedTemplateId'] as String?,
      owner: NotionUser.fromJson(user),
      workspaceIcon: json['workspaceIcon'] as String?,
      workspaceId: json['workspaceId'] as String,
      workspaceName: json['workspaceName'] as String?,
    );
  }
}
