import 'package:freezed_annotation/freezed_annotation.dart';
part 'notion_integrate_webview_state.freezed.dart';

@freezed
class NotionIntegrateWebViewState with _$NotionIntegrateWebViewState {
  const factory NotionIntegrateWebViewState({
    required bool isOpen,
    required bool isLoading,
    required bool isError,
    required String errorText,
  }) = _NotionIntegrateWebViewState;
}
