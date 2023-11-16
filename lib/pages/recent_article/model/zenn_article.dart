import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_article.freezed.dart';
part 'zenn_article.g.dart';

@freezed
class ZennArticle with _$ZennArticle {
  const factory ZennArticle({
    required int id,
    @JsonKey(name: 'post_type') required String? postType,
    required String title,
    required String slug,
    @JsonKey(name: 'comments_count') required int commentsCount,
    @JsonKey(name: 'liked_count') required int likedCount,
    @JsonKey(name: 'body_letters_count') required int bodyLettersCount,
    @JsonKey(name: 'article_type') required String? articleType,
    required String? emoji,
    @JsonKey(name: 'is_suspending_private') required bool isSuspendingPrivate,
    @JsonKey(name: 'published_at') required String publishedAt,
    @JsonKey(name: 'body_updated_at') required String bodyUpdatedAt,
    @JsonKey(name: 'source_repo_updated_at')
    required String? sourceRepoUpdatedAt,
    required bool pinned,
    required String path,
    required Map<String, dynamic> user,
  }) = _ZennArticle;
  factory ZennArticle.fromJson(Map<String, dynamic> json) =>
      _$ZennArticleFromJson(json);
}
