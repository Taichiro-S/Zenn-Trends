import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/api_endpoint.dart';
import 'package:zenn_trends/constant/notion.dart';
import 'package:zenn_trends/constant/storage_key.dart';
import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';
import 'package:zenn_trends/pages/zenn_article/provider/zenn_article_content_provider.dart';
import 'package:zenn_trends/service/secure_storage.dart';

part 'notion_database_api.g.dart';

class NotionDatabaseApi {
  final _secureStorage = SecureStorage();

  Future<String?> searchDatabase() async {
    final apiKey = await _secureStorage.read(NOTION_API_ACCESS_TOKEN);
    final response = await http.post(
      Uri.parse(NOTION_API_V1_SEARCH),
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Notion-Version': NOTION_VERSION,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'query': DATABASE_NAME,
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
            if (name == DATABASE_NAME) {
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

  Future<void> insertArticle(
      {required String databaseId,
      required RssFeedArticle article,
      required ZennArticleContentState content}) async {
    final apiKey = await _secureStorage.read(NOTION_API_ACCESS_TOKEN);
    final now = DateTime.now().toUtc();
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
        'icon': {'type': 'emoji', 'emoji': content.emoji},
        'properties': {
          'title': {
            'title': [
              {
                'text': {
                  'content': article.title,
                },
              },
            ],
          },
          'author': {
            'rich_text': [
              {
                'type': 'text',
                'text': {
                  'content': article.creator,
                  'link': {'url': content.authorLink},
                }
              }
            ]
          },
          // 'author': {
          //   'rich_text': [
          //     {
          //       'text': {
          //         'content': article.creator,
          //       },
          //     },
          //   ],
          // },
          'topic': {
            'multi_select': content.topics
                .map((e) => {
                      'name': e,
                    })
                .toList(),
            // {
            //   'name': topicName,
            // },
          },
          'created_at': {
            'date': {
              'start': now.toIso8601String(),
            },
          },
          'published_at': {
            'date': {
              'start': article.publishedDate.toIso8601String(),
            },
          },
          'link': {
            'url': article.link,
          },
        },
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to insert article: ${response.body}');
    }
  }
}

@riverpod
NotionDatabaseApi notionDatabaseApi(NotionDatabaseApiRef ref) {
  return NotionDatabaseApi();
}
