// // ignore_for_file: invalid_annotation_target

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:zenn_trends/pages/notion_account/model/notion_user.dart';

// part 'notion_account.freezed.dart';
// part 'notion_account.g.dart';

// @freezed
// class NotionAccount with _$NotionAccount {
//   const factory NotionAccount({
//     @JsonKey(name: 'bot_id') required String botId,
//     @JsonKey(name: 'duplicated_template_id')
//     required String? duplicatedTemplateId,
//     // required NotionUser owner,
//     @JsonKey(name: 'workspace_icon') required String? workspaceIcon,
//     @JsonKey(name: 'workspace_id') required String workspaceId,
//     @JsonKey(name: 'workspace_name') required String? workspaceName,
//   }) = _NotionAccount;

//   factory NotionAccount.fromJson(Map<String, dynamic> json) =>
//       _$NotionAccountFromJson(json);
// }
