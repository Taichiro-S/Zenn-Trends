// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:zenn_trends/constant/firestore.dart';
// import 'package:zenn_trends/pages/rss_feed/model/rss_feed_articles_state.dart';
// import 'package:zenn_trends/pages/rss_feed/repository/rss_feed_articles_repository.dart';
// import 'package:zenn_trends/pages/rss_feed/service/should_fetch_data.dart';

// part 'rss_feed_articles_provider.g.dart';

// @riverpod
// class RssFeedArticles extends _$RssFeedArticles {
//   @override
//   RssFeedArticlesState build() {
//     return RssFeedArticlesState(
//       rssFeedArticles: const AsyncValue.loading(),
//       selectedTopicName: '',
//       lastDocument: null,
//       lastUpdatedAt: Timestamp(0, 0),
//     );
//   }

//   /*
//   rss feed articlesの取得
//   */
//   Future<bool> getRssFeedArticles({required String topicName}) async {
//     print('get func called');
//     // 現在の日時と最終更新日時を取得
//     final now = DateTime.now();
//     final lastUpdate = state.lastUpdatedAt.toDate();
//     if (shouldFetchData(
//         lastUpdatedAt: lastUpdate,
//         now: now,
//         updateTimes: TIME_TO_FETCH_RSS_FEED)) {
//       print('fetching rss feed articles');
//       try {
//         state = state.copyWith(rssFeedArticles: const AsyncValue.loading());
//         final rssFeedArticlesRepository =
//             ref.read(rssFeedArticlesRepositoryProvider);

//         final newTopics = await rssFeedArticlesRepository.fetchRssFeedArticles(
//             topicName: topicName);

//         state = state.copyWith(
//           rssFeedArticles: AsyncValue.data(newTopics),
//           selectedTopicName: topicName,
//           lastUpdatedAt: Timestamp.now(),
//         );
//       } catch (e, s) {
//         state = state.copyWith(rssFeedArticles: AsyncValue.error(e, s));
//       }
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
