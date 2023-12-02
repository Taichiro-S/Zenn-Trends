import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zenn_trends/constant/api_endpoint.dart';
import 'package:zenn_trends/pages/recent_article/model/zenn_article.dart';

class ZennRecentArticlesApi {
  static const String order = 'latest';
  static const int minLikedCount = 0;
  static const int maxPage = 10;
  static const String recentArticlesPath =
      'articles?order=$order&min_liked_count=$minLikedCount&page=';

  Future<List<ZennArticle>> getRecentArticles({required int duration}) async {
    List<dynamic> recentArticles = [];
    try {
      apiCall:
      for (var i = 1; i < maxPage; i++) {
        final response =
            await http.get(Uri.parse('$ZENN_API$recentArticlesPath$i'));
        if (response.statusCode == 200) {
          final now = DateTime.now();
          final cutoff = now.subtract(Duration(days: duration));
          final json = jsonDecode(response.body);
          List<dynamic> articles = json['articles'] as List;
          for (var article in articles) {
            if (DateTime.parse(article['published_at'] as String)
                .isAfter(cutoff)) {
              recentArticles.add(article);
            } else {
              break apiCall;
            }
          }
        } else {
          throw Exception('Failed to load articles');
        }
      }
      return recentArticles
          .map((articleJson) =>
              ZennArticle.fromJson(articleJson as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
