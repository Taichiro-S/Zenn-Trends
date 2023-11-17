import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zenn_trends/pages/recent_article/api/zenn_recent_articles.dart';
import 'package:zenn_trends/pages/recent_article/article_body_page.dart';
import 'package:zenn_trends/pages/recent_article/model/zenn_article.dart';

@RoutePage()
class RecentArticlePage extends ConsumerWidget {
  const RecentArticlePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentArticle = ZennRecentArticlesApi();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Article'),
      ),
      body: FutureBuilder<List<ZennArticle>>(
        future: recentArticle.getRecentArticles(duration: 7),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final articles = snapshot.data ?? [];
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                final publishedAt = DateTime.parse(article.publishedAt);
                return ListTile(
                  title: Text(article.title),
                  subtitle: Column(children: [
                    Text('いいね数: ${article.likedCount}'),
                    Text('$publishedAt'),
                    Text('文字数: ${article.bodyLettersCount}')
                  ]),
                  onTap: () {
                    // ここに記事をタップしたときの処理を追加する
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ArticleBodyPage(
                                  articleSlug: article.slug,
                                )));
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No articles found'));
          }
        },
      ),
    );
  }
}
