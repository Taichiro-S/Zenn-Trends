// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:zenn_trends/constant/url.dart';
// import 'package:zenn_trends/pages/recent_article/provider/articles_info_provider.dart';

// // @RoutePage()
// class ArticlesInfoPage extends ConsumerWidget {
//   const ArticlesInfoPage({super.key, required this.topicId});
//   final String topicId;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final dailyArticlesOfTopic =
//         ref.watch(articlesInfoProvider(topicId: topicId));
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recent Article'),
//       ),
//       body: dailyArticlesOfTopic.when(
//         loading: () => const Center(child: CircularProgressIndicator()),
//         error: (error, stack) => Center(child: Text('エラー: $error')),
//         data: (articlesInfo) {
//           if (articlesInfo.isEmpty) {
//             return const Center(child: Text('記事がありません'));
//           }
//           return ListView.builder(
//             itemCount: articlesInfo.length,
//             itemBuilder: (context, index) {
//               final info = articlesInfo[index];
//               final String slug = info.slug;
//               final String username = info.user.username;
//               final uri = Uri.parse('$ZENN_DEV_URL$username/articles/$slug');
//               return ListTile(
//                 title: Text(info.article.title),
//                 subtitle: Column(children: [
//                   Text(info.article.publishedAt),
//                   Text(info.user.username),
//                 ]),
//                 onTap: () async {
//                   if (await canLaunchUrl(uri)) {
//                     launchUrl(uri);
//                   }
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
