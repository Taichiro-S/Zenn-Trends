import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'open_ai_state.freezed.dart';

@freezed
class OpenAiState with _$OpenAiState {
  const factory OpenAiState({
    required AsyncValue<String> summary,
  }) = _OpenAiState;
}
