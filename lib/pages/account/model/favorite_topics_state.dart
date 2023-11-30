import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_topics_state.freezed.dart';

@freezed
class FavoriteTopicsState with _$FavoriteTopicsState {
  const factory FavoriteTopicsState({
    required AsyncValue<List<String>> topicIds,
  }) = _FavoriteTopicsState;
}
