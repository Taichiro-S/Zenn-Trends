// ignore_for_file: invalid_annotation_target
// ref : https://pub.dev/packages/freezed#disabling-invalid_annotation_target-warning-and-warning-in-generates-files
import 'package:freezed_annotation/freezed_annotation.dart';

part 'zenn_article_body.freezed.dart';
part 'zenn_article_body.g.dart';

@freezed
class ZennArticleBody with _$ZennArticleBody {
  const factory ZennArticleBody({
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
    @JsonKey(name: 'published_at') required String? publishedAt,
    @JsonKey(name: 'body_updated_at') required String? bodyUpdatedAt,
    @JsonKey(name: 'source_repo_updated_at')
    required String? sourceRepoUpdatedAt,
    required bool pinned,
    required String? path,
    @JsonKey(name: 'body_html') required String bodyHtml,
    required Map<String, dynamic> user,
    required List<Map<String, dynamic>>? topics,
  }) = _ZennArticleBody;
  factory ZennArticleBody.fromJson(Map<String, dynamic> json) =>
      _$ZennArticleBodyFromJson(json);
}
