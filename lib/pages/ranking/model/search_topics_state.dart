import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_topics_state.freezed.dart';

@freezed
class SearchTopicsState with _$SearchTopicsState {
  const factory SearchTopicsState({
    String? searchWord,
    required bool isSearching,
  }) = _SearchTopicsState;
}
