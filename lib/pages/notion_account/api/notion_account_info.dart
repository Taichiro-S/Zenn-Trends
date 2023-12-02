import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/api_endpoint.dart';
import 'package:zenn_trends/constant/storage_key.dart';
import 'package:zenn_trends/service/secure_storage.dart';

part 'notion_account_info.g.dart';

class NotionAccountInfoApi {
  final _secureStorage = SecureStorage();
  Future<void> findPermittedPages() async {
    final apiKey = await _secureStorage.read(NOTION_API_ACCESS_TOKEN);
    final response = await http.post(
      Uri.parse(NOTION_API_V1_SEARCH),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Notion-Version': '2021-08-16',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'filter': {
          'property': 'object',
          'value': 'page',
        },
        'sorts': [
          {
            'direction': 'ascending',
            'timestamp': 'last_edited_time',
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['results'] as List<dynamic>;
      for (var result in results) {
        if (result['object'] == 'page') {
          print('Page ID: ${result['id']}');
        }
      }
    } else {
      print('Failed to find pages: ${response.body}');
    }
  }
}

@riverpod
NotionAccountInfoApi notionAccountInfoApi(NotionAccountInfoApiRef ref) {
  return NotionAccountInfoApi();
}
