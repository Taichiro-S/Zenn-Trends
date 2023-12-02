import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/notion_account/model/notion_integrate_webview_state.dart';
part 'notion_integrate_webview_provider.g.dart';

@riverpod
class NotionIntegrateWebView extends _$NotionIntegrateWebView {
  @override
  NotionIntegrateWebViewState build() {
    return const NotionIntegrateWebViewState(
        isOpen: false, isLoading: false, isError: false, errorText: '');
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
}
