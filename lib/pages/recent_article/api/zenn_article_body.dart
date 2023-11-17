import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zenn_trends/constant/url.dart';
import 'package:zenn_trends/pages/recent_article/model/zenn_article_body.dart';

class ZennArticleBodyApi {
  static const String recentArticlesPath = 'articles/';

  Future<ZennArticleBody> getArticleBody({required String articleSlug}) async {
    final response = await http
        .get(Uri.parse('$ZENN_API_URL$recentArticlesPath$articleSlug'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final articleJson = json['article'] as Map<String, dynamic>;

      return ZennArticleBody.fromJson(articleJson);
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
