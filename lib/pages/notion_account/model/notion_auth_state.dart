// // ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/notion_account/model/notion_user.dart';

part 'notion_auth_state.freezed.dart';

@freezed
class NotionAuthState with _$NotionAuthState {
  const factory NotionAuthState({
    required bool isAuth,
    required String botId,
    required String? duplicatedTemplateId,
    // required NotionUser owner,
    required String? workspaceIcon,
    required String workspaceId,
    required String? workspaceName,
  }) = _NotionAuthState;
}
