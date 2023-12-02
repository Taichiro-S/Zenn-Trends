import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zenn_trends/pages/zenn_article/model/zenn_article_webview_state.dart';
part 'zenn_article_webview_provider.g.dart';

@riverpod
class ZennArticleWebView extends _$ZennArticleWebView {
  @override
  ZennArticleWebViewState build() {
    return const ZennArticleWebViewState(
        isOpen: false,
        isLoading: false,
        isError: false,
        errorText: '',
        currentUrl: '');
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

  void setUrl({required String url}) {
    state = state.copyWith(currentUrl: url);
  }

  void clearUrl() {
    state = state.copyWith(currentUrl: '');
  }
}
