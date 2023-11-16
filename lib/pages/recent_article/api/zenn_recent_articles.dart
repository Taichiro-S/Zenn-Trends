import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zenn_trends/pages/recent_article/model/zenn_article.dart';

class ZennRecentArticlesApi {
  static const String baseUrl = 'https://zenn.dev';
  static const String recentArticlesPath = '/api/articles';

  Future<List<ZennArticle>> getRecentArticles() async {
    final response = await http.get(Uri.parse('$baseUrl$recentArticlesPath'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final articlesJson = json['articles'] as List;
      return articlesJson
          .map((articleJson) =>
              ZennArticle.fromJson(articleJson as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
