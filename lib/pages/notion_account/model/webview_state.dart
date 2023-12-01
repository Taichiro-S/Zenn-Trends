import 'package:freezed_annotation/freezed_annotation.dart';
part 'webview_state.freezed.dart';

@freezed
class WebViewState with _$WebViewState {
  const factory WebViewState({
    required bool isOpen,
    required bool isLoading,
    required bool isError,
    required String errorText,
  }) = _WebViewState;
}
