// import 'package:flutter/material.dart';
// import 'package:flutter_markdown/flutter_markdown.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:html2md/html2md.dart' as html2md;
// import 'package:zenn_trends/pages/recent_article/api/zenn_article_body.dart';
// import 'package:zenn_trends/pages/recent_article/model/zenn_article_body.dart';
// import 'package:zenn_trends/pages/recent_article/provider/open_ai_provider.dart';

// // @RoutePage()
// class ArticleBodyPage extends ConsumerWidget {
//   const ArticleBodyPage({Key? key, required this.articleSlug})
//       : super(key: key);
//   final String articleSlug;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final articleBody = ZennArticleBodyApi();
//     // final openAi = ref.watch(openAiProvider);
//     // final openAiNotifier = ref.read(openAiProvider.notifier);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recent Article'),
//       ),
//       body: FutureBuilder<ZennArticleBody>(
//         future: articleBody.getArticleBody(articleSlug: articleSlug),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             final ZennArticleBody article = snapshot.data as ZennArticleBody;
//             /* TODO
//             マークダウンの不要な部分を取り除く（code, image, etc...）
//             */
//             String markdownContent = html2md.convert(article.bodyHtml);
//             return Column(children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   await openAiNotifier.summarizeText(
//                       article: article, markdown: markdownContent);
//                 },
//                 child: const Text('要約'),
//               ),
//               openAi.summary.when(
//                 loading: () => const Center(
//                     child: CircularProgressIndicator(color: Colors.blue)),
//                 error: (error, stack) => Center(child: Text('エラー: $error')),
//                 data: (summary) {
//                   return Expanded(
//                     child: Markdown(
//                       data: summary == '' ? markdownContent : summary,
//                       selectable: true,
//                       onTapLink: (text, href, title) {
//                         // ここにリンクをタップしたときの処理を追加する
//                       },
//                     ),
//                   );
//                 },
//               ),
//             ]);
//           } else {
//             return const Center(child: Text('No articles found'));
//           }
//         },
//       ),
//     );
//   }
// }
