// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:zenn_trends/constant/storage_key.dart';
// import 'package:zenn_trends/pages/notion_account/api/notion_oauth_api.dart';
// import 'package:zenn_trends/pages/notion_account/model/notion_account_state.dart';
// import 'package:zenn_trends/service/secure_storage.dart';

// part 'notion_account_provider.g.dart';

// @riverpod
// class NotionAccount extends _$NotionAccount {
//   final _secureStorage = SecureStorage();
//   @override
//   NotionAccountState build() {
//     return const NotionAccountState(
//       notionAccount: AsyncValue.loading(),
//     );
//   }

//   Future<void> login({required String url}) async {
//     try {
//       state = state.copyWith(
//         notionAccount: const AsyncValue.loading(),
//       );
//       final notionOauthApi = ref.read(notionOauthApiProvider);
//       final notionAccount = await notionOauthApi.login(url: url);
//       await _secureStorage.write(
//           NOTION_WORKSPACE_ID, notionAccount.workspaceId);
//       await _secureStorage.write(
//           NOTION_WORKSPACE_NAME, notionAccount.workspaceName ?? '');
//       await _secureStorage.write(
//           NOTION_WORKSPACE_ICON, notionAccount.workspaceIcon ?? '');
//       state = state.copyWith(
//         notionAccount: AsyncValue.data(notionAccount),
//       );
//     } catch (e, s) {
//       state = state.copyWith(
//         notionAccount: AsyncValue.error(e, s),
//       );
//     }
//   }

//   Future<void> logout() async {
//     try {
//       state = state.copyWith(
//         notionAccount: const AsyncValue.loading(),
//       );
//       final notionOauthApi = ref.read(notionOauthApiProvider);
//       await notionOauthApi.logout();
//       state = state.copyWith(
//         notionAccount: const AsyncValue.loading(),
//       );
//     } catch (e, s) {
//       state = state.copyWith(
//         notionAccount: AsyncValue.error(e, s),
//       );
//     }
//   }
// }
