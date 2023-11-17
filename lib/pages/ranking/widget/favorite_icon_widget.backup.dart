// import 'package:auto_route/auto_route.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:zenn_trends/pages/profile/provider/favorite_topics_provider.dart';
// import 'package:zenn_trends/pages/profile/provider/google_auth_provider.dart';
// import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

// class FavoriteIconWidget extends ConsumerWidget {
//   const FavoriteIconWidget({super.key, required this.rankedTopic});
//   final RankedTopic rankedTopic;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final googleAuth = ref.watch(googleAuthProvider);
//     final favoriteTopics = ref.watch(favoriteTopicsProvider);
//     final favoriteTopicsNotifier = ref.read(favoriteTopicsProvider.notifier);
//     final individualLoadingState =
//         favoriteTopics.individualLoadingStates[rankedTopic.id];
//     final router = AutoRouter.of(context);
//     final isFavorite =
//         favoriteTopics.topicIds.value?.contains(rankedTopic.id) ?? false;
//     ref.listen<AsyncValue<List<String>>>(
//         favoriteTopicsProvider.select((state) => state.topicIds), (prev, next) {
//       print(prev);
//       print(next);
//       if (prev != next) {}
//     });
//     print(favoriteTopics.topicIds.toString());
//     return Container(
//         child: googleAuth.user.when(data: (user) {
//       return user == null
//           ? IconButton(
//               onPressed: () {
//                 /* 
//                   todo: モーダルを出してログイン画面に遷移できるようにする
//                   router.push(const ProfileRoute());
//                   */
//                 return;
//               },
//               icon: const Icon(Icons.favorite, color: Colors.grey))
//           : individualLoadingState?.when(data: (_) {
//                 return IconButton(
//                   icon: Icon(
//                     isFavorite ? Icons.favorite : Icons.favorite_border,
//                     color: isFavorite ? Colors.red : Colors.grey,
//                   ),
//                   onPressed: () {
//                     if (isFavorite) {
//                       favoriteTopicsNotifier.removeFavoriteTopic(
//                           user: user, topicId: rankedTopic.id);
//                     } else {
//                       favoriteTopicsNotifier.addFavoriteTopic(
//                           user: user, topic: rankedTopic);
//                     }
//                   },
//                 );
//               }, loading: () {
//                 print('loading favorite topic');
//                 return const CircularProgressIndicator();
//               }, error: (error, stackTrace) {
//                 print(error.toString());
//                 return Text(error.toString());
//               }) ??
//               IconButton(
//                   onPressed: () {
//                     favoriteTopicsNotifier.addFavoriteTopic(
//                         user: user, topic: rankedTopic);
//                   },
//                   icon: const Icon(Icons.favorite, color: Colors.grey));
//     }, loading: () {
//       print('loading user');
//       return const CircularProgressIndicator();
//     }, error: (error, stackTrace) {
//       print(error.toString());
//       // return Container();
//       return Text(error.toString());
//     }));
//   }
// }
