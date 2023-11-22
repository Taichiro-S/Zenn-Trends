import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/ranking/model/favorite_topic_state.dart';

part 'favorite_topic_provider.g.dart';

@riverpod
class FavoriteTopic extends _$FavoriteTopic {
  @override
  FavoriteTopicState build() {
    return const FavoriteTopicState(
      isFavorite: false,
      isLoading: false,
    );
  }

  void toggleIsFavorite() {
    state = state.copyWith(isFavorite: !state.isFavorite);
  }

  void toggleIsLoading() {
    state = state.copyWith(isLoading: !state.isLoading);
  }
}
