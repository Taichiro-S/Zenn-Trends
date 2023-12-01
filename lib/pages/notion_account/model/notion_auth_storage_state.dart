import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/notion_account/model/notion_auth_state.dart';

part 'notion_auth_storage_state.freezed.dart';

@freezed
class NotionAuthStorageState with _$NotionAuthStorageState {
  const factory NotionAuthStorageState({
    required AsyncValue<NotionAuthState> notionAuthStorageState,
  }) = _NotionAuthStorageState;
}
