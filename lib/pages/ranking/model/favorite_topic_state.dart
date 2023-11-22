import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_topic_state.freezed.dart';

@freezed
class FavoriteTopicState with _$FavoriteTopicState {
  const factory FavoriteTopicState({
    required bool isFavorite,
    required bool isLoading,
  }) = _FavoriteTopicState;
}
