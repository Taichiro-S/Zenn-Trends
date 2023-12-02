import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/constant/api_endpoint.dart';
import 'package:zenn_trends/pages/rss_feed/model/rss_feed_article.dart';

part 'notion_page_api.g.dart';

class NotionPageApi {}

@riverpod
NotionPageApi notionDatabaseApi(NotionDatabaseApiRef ref) {
  return NotionPageApi();
}
