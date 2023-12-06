import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notion_integrate_webview_provider.g.dart';
part 'notion_integrate_webview_provider.freezed.dart';

@freezed
class NotionIntegrateWebViewState with _$NotionIntegrateWebViewState {
  const factory NotionIntegrateWebViewState({
    required bool isOpen,
    required bool isLoading,
    required bool isError,
    required String errorText,
    required double progress,
  }) = _NotionIntegrateWebViewState;
}

@riverpod
class NotionIntegrateWebView extends _$NotionIntegrateWebView {
  @override
  NotionIntegrateWebViewState build() {
    return const NotionIntegrateWebViewState(
        isOpen: false,
        isLoading: false,
        isError: false,
        errorText: '',
        progress: 0.0);
  }

  void show() => state = state.copyWith(isOpen: true);
  void hide() => state = state.copyWith(isOpen: false);
  void loading() => state = state.copyWith(isLoading: true);
  void loaded() => state = state.copyWith(isLoading: false);
  void error(String msg) {
    state = state.copyWith(isError: true);
    state = state.copyWith(errorText: msg);
  }

  void clearError() {
    state = state.copyWith(isError: false);
    state = state.copyWith(errorText: '');
  }

  void setProgress(double progress) {
    state = state.copyWith(progress: progress);
  }
}
