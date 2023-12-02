import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/api_endpoint.dart';
import 'package:zenn_trends/constant/notion.dart';
import 'package:zenn_trends/constant/storage_key.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/service/secure_storage.dart';

part 'notion_database_api.g.dart';

class NotionDatabaseApi {
  final _secureStorage = SecureStorage();
  Future<void> createDatabase(
      {required String apiKey,
      required String topicName,
      required RssFeedArticle article}) async {
    final response = await http.post(
      Uri.parse(NOTION_API_V1_DATABASES),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Notion-Version': '2021-08-16',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'parent': {'type': 'workspace', 'workspace': true},
        'icon': {
          'type': 'emoji',
          'emoji': null,
        },
        'title': [
          {
            'type': 'text',
            'text': {
              'content': 'Zenn Articles',
              'link': null,
            },
          },
        ],
        'properties': {
          'Title': {
            'title': {},
          },
          'Author': {
            'rich_text': {},
          },
          'Description': {
            'checkbox': {},
          },
          'Topic': {
            'select': {
              'options': [],
            },
          },
          'URL': {
            'url': {},
          },
          'Published': {
            'date': {},
          },
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Database Created: ${response.body}');
    } else {
      print('Failed to create database: ${response.body}');
    }
  }

  Future<String?> searchDatabase() async {
    final apiKey = await _secureStorage.read(NOTION_API_ACCESS_TOKEN);
    const databaseName = '勉強';
    final response = await http.post(
      Uri.parse(NOTION_API_V1_SEARCH),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Notion-Version': NOTION_VERSION,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'query': databaseName,
        'filter': {
          'property': 'object',
          'value': 'database',
        },
        'sort': {
          'direction': 'ascending',
          'timestamp': 'last_edited_time',
        },
      }),
    );

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body)['results'] as List<dynamic>;
      if (results.isNotEmpty) {
        for (var result in results) {
          final titles = result['title'] as List<dynamic>;
          for (var title in titles) {
            final name = title['text']['content'] as String;
            if (name == databaseName) {
              return result['id'].toString();
            }
          }
        }
      }
      print('results is empty');
      return null;
    } else {
      throw Exception('Failed to find database: ${response.body}');
    }
  }

  Future<String> insertArticle(
      {required String databaseId, required RssFeedArticle article}) async {
    final apiKey = await _secureStorage.read(NOTION_API_ACCESS_TOKEN);
    final response = await http.post(
      Uri.parse(NOTION_API_V1_PAGES),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Notion-Version': NOTION_VERSION,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'parent': {
          "type": "database_id",
          "database_id": databaseId,
        },
        'properties': {
          'タイトル': {
            'title': [
              {
                'text': {
                  'content': article.title,
                },
              },
            ],
          },
        },
      }),
    );

    if (response.statusCode == 200) {
      print('Article Inserted: ${response.body}');
      return response.body;
    } else {
      print('Failed to insert article: ${response.body}');
      return '';
    }
  }
}

@riverpod
NotionDatabaseApi notionDatabaseApi(NotionDatabaseApiRef ref) {
  return NotionDatabaseApi();
}
