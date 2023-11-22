import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/account/model/favorite_topics_state.dart';
import 'package:zenn_trends/pages/account/repository/favorite_topics_repository.dart';
import 'package:zenn_trends/pages/ranking/model/ranked_topic.dart';

part 'favorite_topics_provider.g.dart';

@riverpod
class FavoriteTopics extends _$FavoriteTopics {
  @override
  FavoriteTopicsState build() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   getFavoriteTopics(user: user);
    // });
    return const FavoriteTopicsState(
      topicIds: AsyncValue.data([]),
      // individualLoadingStates: {}
    );
  }

  // void initialize() {
  //   state = state.copyWith(topicIds: const AsyncValue.data([]));
  // }

  Future<void> getFavoriteTopics({required User user}) async {
    print('getFavoriteTopics');
    final favoriteTopicsRepository =
        ref.watch(favoriteTopicsRepositoryProvider);
    state = state.copyWith(topicIds: const AsyncValue.loading());
    try {
      final topicIds =
          await favoriteTopicsRepository.getFavoriteTopics(user: user);
      state = state.copyWith(topicIds: AsyncValue.data(topicIds));
    } catch (e, s) {
      state = state.copyWith(topicIds: AsyncValue.error(e, s));
    }
  }

  Future<void> addFavoriteTopic(
      {required User user, required RankedTopic topic}) async {
    final favoriteTopicsRepository =
        ref.watch(favoriteTopicsRepositoryProvider);
    // final topicId = topic.id;
    // state = state.copyWith(
    //   individualLoadingStates: Map.from(state.individualLoadingStates)
    //     ..update(topicId, (_) => const AsyncValue.loading(),
    //         ifAbsent: () => const AsyncValue.loading()),
    // );
    try {
      final updatedTopicIds = await favoriteTopicsRepository.addFavoriteTopic(
          user: user, topic: topic);
      state = state.copyWith(
        topicIds: AsyncValue.data(updatedTopicIds),
        // individualLoadingStates: Map.from(state.individualLoadingStates)
        //   ..remove(topicId)
      );
    } catch (e, s) {
      state = state.copyWith(
        topicIds: AsyncValue.error(e, s),
        // individualLoadingStates: Map.from(state.individualLoadingStates)
        //   ..remove(topicId),
      );
    }
  }

  Future<void> removeFavoriteTopic(
      {required User user, required String topicId}) async {
    final favoriteTopicsRepository =
        ref.watch(favoriteTopicsRepositoryProvider);
    // state = state.copyWith(
    //   individualLoadingStates: Map.from(state.individualLoadingStates)
    //     ..update(topicId, (_) => const AsyncValue.loading(),
    //         ifAbsent: () => const AsyncValue.loading()),
    // );
    try {
      final updatedTopicIds = await favoriteTopicsRepository
          .removeFavoriteTopic(user: user, topicId: topicId);
      state = state.copyWith(
        topicIds: AsyncValue.data(updatedTopicIds),
        // individualLoadingStates: Map.from(state.individualLoadingStates)
        //   ..remove(topicId)
      );
    } catch (e, s) {
      state = state.copyWith(
        topicIds: AsyncValue.error(e, s),
        // individualLoadingStates: Map.from(state.individualLoadingStates)
        //   ..remove(topicId),
      );
    }
  }
}
