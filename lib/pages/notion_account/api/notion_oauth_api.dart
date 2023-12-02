import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/api_endpoint.dart';
import 'package:zenn_trends/constant/storage_key.dart';
import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/env/env.dart';
import 'package:zenn_trends/service/secure_storage.dart';

part 'notion_oauth_api.g.dart';

class NotionOauthApi {
  final _secureStorage = SecureStorage();

  Future<void> login({required String url}) async {
    final authorizationCode = Uri.parse(url).queryParameters['code'];
    // final callbackState = Uri.parse(uri.toString()).queryParameters['state'];
    // if (authorizationCode != null && callbackState == state) {
    if (authorizationCode != null) {
      final accessToken = await _getAccessToken(authorizationCode);
      await _secureStorage.write(NOTION_API_ACCESS_TOKEN, accessToken);
    } else {
      throw Exception('Authorization failed');
    }
  }

  Future<String> _getAccessToken(String authorizationCode) async {
    final String encoded = base64Encode(utf8
        .encode('${Env.notionOauthClientId}:${Env.notionOauthClientSecret}}'));
    final response = await http.post(
      Uri.parse(NOTION_API_V1_ACCESS_TOKEN),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Basic $encoded',
      },
      body: jsonEncode({
        'grant_type': 'authorization_code',
        'code': authorizationCode,
        'redirect_uri': NOTION_REDIRECT_URL,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      await _secureStorage.write(NOTION_WORKSPACE_ID,
          data['workspace_id'] != null ? data['workspace_id'].toString() : '');
      await _secureStorage.write(
          NOTION_WORKSPACE_NAME,
          data['workspace_name'] != null
              ? data['workspace_name'].toString()
              : '');
      await _secureStorage.write(
          NOTION_WORKSPACE_ICON,
          data['workspace_icon'] != null
              ? data['workspace_icon'].toString()
              : '');
      await _secureStorage.write(NOTION_BOT_ID,
          data['bot_id'] != null ? data['bot_id'].toString() : '');
      await _secureStorage.write(
          NOTION_DUPLICATED_TEMPLATE_ID,
          data['duplicated_template_id'] != null
              ? data['duplicated_template_id'].toString()
              : '');
      return data['access_token'].toString();
    } else {
      throw Exception('Failed to get access token: ${response.body}');
    }
  }
}

@riverpod
NotionOauthApi notionOauthApi(NotionOauthApiRef ref) {
  return NotionOauthApi();
}
