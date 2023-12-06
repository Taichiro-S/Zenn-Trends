import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zenn_article_webview_provider.g.dart';
part 'zenn_article_webview_provider.freezed.dart';

@freezed
class ZennArticleWebViewState with _$ZennArticleWebViewState {
  const factory ZennArticleWebViewState({
    required bool isOpen,
    required bool isLoading,
    required bool isError,
    required String errorText,
    required String currentUrl,
  }) = _ZennArticleWebViewState;
}

@riverpod
class ZennArticleWebView extends _$ZennArticleWebView {
  @override
  ZennArticleWebViewState build() {
    return const ZennArticleWebViewState(
      isOpen: false,
      isLoading: false,
      isError: false,
      errorText: '',
      currentUrl: '',
    );
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

  void setUrl(String url) {
    state = state.copyWith(currentUrl: url);
  }

  void clearUrl() {
    state = state.copyWith(currentUrl: '');
  }
}
