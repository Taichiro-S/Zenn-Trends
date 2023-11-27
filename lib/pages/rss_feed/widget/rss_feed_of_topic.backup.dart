// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:zenn_trends/pages/account/provider/google_auth_provider.dart';
// import 'package:zenn_trends/pages/rss_feed/model/rss_feed_articles_state.dart';
// import 'package:zenn_trends/pages/rss_feed/model/trend_topic.dart';
// import 'package:zenn_trends/pages/rss_feed/provider/rss_feed_articles_provider.dart';
// import 'package:zenn_trends/pages/rss_feed/provider/trend_topics_provider.dart';
// import 'package:zenn_trends/pages/rss_feed/widget/article_container_widget.dart';
// import 'package:zenn_trends/theme/app_theme.dart';
// import 'package:zenn_trends/widget/circle_loading_widget.dart';

// class RssFeedOfTopicWidget extends ConsumerWidget {
//   const RssFeedOfTopicWidget({Key? key, required this.topic}) : super(key: key);
//   // final List<TrendTopic> topics;
//   final TrendTopic? topic;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final loadedArticlesAsync = ref.watch(
//         rssFeedArticlesProvider.select((state) => state.rssFeedArticles));
//     final loadedArticlesNotifier = ref.read(rssFeedArticlesProvider.notifier);
//     final scrollController = ScrollController();
//     final googleAuth = ref.watch(googleAuthProvider);
//     ref.listen<AsyncValue<User?>>(
//         googleAuthProvider.select((state) => state.user), (_, user) {
//       if (user.value != null) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {});
//       }
//     });
//     ref.listen<RssFeedArticlesState>(rssFeedArticlesProvider, (previous, next) {
//       if (topic != null) {
//         ref
//             .read(rssFeedArticlesProvider.notifier)
//             .getRssFeedArticles(topicName: topic!.name);
//       } else {}
//     });
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       if (topic != null) {
//         print(topic!.name);
//         ref
//             .read(rssFeedArticlesProvider.notifier)
//             .getRssFeedArticles(topicName: topic!.name);
//       } else {
//         // final loadedArticlesNotifier = ref.read(rssFeedArticlesProvider.notifier);
//         loadedArticlesNotifier.getRssFeedArticles(topicName: 'ai');
//       }
//     });
//     return loadedArticlesAsync.when(
//       loading: () => const Center(
//           child: CircleLoadingWidget(color: Colors.blue, fontSize: 20)),
//       error: (error, stack) {
//         print(error);
//         return Center(child: Text('エラー: $error'));
//       },
//       data: (articles) {
//         if (articles.isEmpty) {
//           return const Center(
//               child: Text('記事がありません😢',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)));
//         } else {
//           return RefreshIndicator(
//               child: ListView.builder(
//                 controller: scrollController,
//                 itemCount: articles.length,
//                 itemBuilder: (context, index) {
//                   final article = articles[index];

//                   return ArticleContainerWidget(article: article, index: index);
//                 },
//               ),
//               onRefresh: () async {
//                 if (await loadedArticlesNotifier.getRssFeedArticles(
//                     topicName: topic!.name)) {
//                   Fluttertoast.showToast(
//                       msg: 'データを更新しました',
//                       backgroundColor: AppTheme.light().appColors.primary);
//                 } else {
//                   Fluttertoast.showToast(
//                       msg: 'データは最新です',
//                       backgroundColor: AppTheme.light().appColors.primary);
//                 }
//               });
//         }
//       },
//     );
//   }
// }
