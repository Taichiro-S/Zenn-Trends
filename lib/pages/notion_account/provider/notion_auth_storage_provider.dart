import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/notion_account/model/notion_auth_state.dart';
import 'package:zenn_trends/pages/notion_account/model/notion_auth_storage_state.dart';
import 'package:zenn_trends/service/secure_storage.dart';
import '/constant/storage_key.dart';

part 'notion_auth_storage_provider.g.dart';

@riverpod
class NotionAuthStorage extends _$NotionAuthStorage {
  final secureStorage = SecureStorage();
  @override
  NotionAuthStorageState build() {
    return const NotionAuthStorageState(
      notionAuthStorageState: AsyncValue.loading(),
    );
  }

  Future<void> getNotionWorkspace() async {
    state = state.copyWith(
      notionAuthStorageState: const AsyncValue.loading(),
    );
    try {
      final isAuth = await secureStorage.read(NOTION_API_ACCESS_TOKEN) != null
          ? true
          : false;
      final workspaceId = await secureStorage.read(NOTION_WORKSPACE_ID);
      final workspaceName = await secureStorage.read(NOTION_WORKSPACE_NAME);
      final workspaceIcon = await secureStorage.read(NOTION_WORKSPACE_ICON);
      final botId = await secureStorage.read(NOTION_BOT_ID);
      final duplicatedTemplateId =
          await secureStorage.read(NOTION_DUPLICATED_TEMPLATE_ID);
      if (isAuth &&
          workspaceId != null &&
          botId != null &&
          workspaceId != '' &&
          botId != '') {
        state = state.copyWith(
          notionAuthStorageState: AsyncValue.data(
            NotionAuthState(
              isAuth: true,
              botId: botId,
              duplicatedTemplateId: duplicatedTemplateId,
              workspaceIcon: workspaceIcon,
              workspaceId: workspaceId,
              workspaceName: workspaceName,
            ),
          ),
        );
      } else {
        state = state.copyWith(
          notionAuthStorageState: const AsyncValue.data(
            NotionAuthState(
              isAuth: false,
              botId: '',
              duplicatedTemplateId: null,
              workspaceIcon: null,
              workspaceId: '',
              workspaceName: null,
            ),
          ),
        );
      }
    } catch (e) {
      throw Exception('Flutter Storage error: $e');
    }
  }

  Future<void> deleteWorkspace() async {
    state = state.copyWith(
      notionAuthStorageState: const AsyncValue.loading(),
    );
    try {
      secureStorage.delete(NOTION_API_ACCESS_TOKEN);
      secureStorage.delete(NOTION_WORKSPACE_ID);
      secureStorage.delete(NOTION_WORKSPACE_NAME);
      secureStorage.delete(NOTION_WORKSPACE_ICON);
      secureStorage.delete(NOTION_BOT_ID);
      secureStorage.delete(NOTION_DUPLICATED_TEMPLATE_ID);
      state = state.copyWith(
        notionAuthStorageState: const AsyncValue.data(
          NotionAuthState(
            isAuth: false,
            botId: '',
            duplicatedTemplateId: null,
            workspaceIcon: null,
            workspaceId: '',
            workspaceName: null,
          ),
        ),
      );
    } catch (e) {
      throw Exception('Flutter Storage error: $e');
    }
  }
}
