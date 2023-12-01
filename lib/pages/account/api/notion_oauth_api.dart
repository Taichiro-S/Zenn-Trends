import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/storage_key.dart';
import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/env/env.dart';
import 'package:zenn_trends/service/secure_storage.dart';

part 'notion_oauth_api.g.dart';

class NotionOauthApi {
  final String clientId = Env.notionOauthClientId;
  final String clientSecret = Env.notionOauthClientSecret;
  final _secureStorage = SecureStorage();

  Future<void> login(Uri uri, String state) async {
    final authorizationCode = Uri.parse(uri.toString()).queryParameters['code'];
    final callbackState = Uri.parse(uri.toString()).queryParameters['state'];
    if (authorizationCode != null && callbackState == state) {
      final accessToken = await _getAccessToken(authorizationCode);
      await _secureStorage.write(NOTION_API_ACCESS_TOKEN, accessToken);
    } else {
      throw Exception('Authorization failed');
    }
  }

  Future<String> _getAccessToken(String authorizationCode) async {
    final url = Uri.https(
      NOTION_DOMAIN,
    ).toString();
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'client_id': clientId,
        'client_secret': clientSecret,
        'code': authorizationCode,
      }),
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> data =
          jsonDecode(response.body) as Map<String, dynamic>;
      return data['token'].toString();
    } else {
      throw Exception('Failed to get access token: ${response.body}');
    }
  }

  Future<void> logout() async {
    final accessToken = await _secureStorage.read(NOTION_API_ACCESS_TOKEN);
    final url = Uri.https(
      NOTION_DOMAIN,
    ).toString();
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $accessToken',
      },
    );
    await _secureStorage.delete(NOTION_API_ACCESS_TOKEN);
    if (response.statusCode != 204) {
      throw Exception('Failed to invalidate access token: ${response.body}');
    }
  }
}

@riverpod
NotionOauthApi notionOauthApi(NotionOauthApiRef ref) {
  return NotionOauthApi();
}
