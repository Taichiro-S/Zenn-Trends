import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_article_webview_state.freezed.dart';

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
