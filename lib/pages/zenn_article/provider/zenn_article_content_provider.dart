import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'zenn_article_content_provider.g.dart';
part 'zenn_article_content_provider.freezed.dart';

@freezed
class ZennArticleContentState with _$ZennArticleContentState {
  const factory ZennArticleContentState({
    required String emoji,
    required String authorLink,
    required List<String> topics,
  }) = _ZennArticleContentState;
}

@riverpod
class ZennArticleContent extends _$ZennArticleContent {
  @override
  ZennArticleContentState build() {
    return const ZennArticleContentState(emoji: '', authorLink: '', topics: []);
  }

  void setProperties({
    required String emoji,
    required String authorLink,
    required List<String> topics,
  }) {
    state = state.copyWith(
      emoji: emoji,
      authorLink: authorLink,
      topics: topics,
    );
  }
}
