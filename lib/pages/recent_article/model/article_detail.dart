import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/recent_article/model/topic.dart';

part 'article_detail.freezed.dart';
part 'article_detail.g.dart';

@freezed
class ArticleDetail with _$ArticleDetail {
  const factory ArticleDetail({
    required int id,
    required String postType,
    required String title,
    required String slug,
    required int commentsCount,
    required int likedCount,
    required int bodyLettersCount,
    required String articleType,
    required String emoji,
    required bool isSuspendingPrivate,
    required String publishedAt,
    required String bodyUpdatedAt,
    required String sourceRepoUpdatedAt,
    required bool pinned,
    required String path,
    required String bodyHtml,
    required Map<String, dynamic> user,
    required List<Map<String, dynamic>> topics,
  }) = _ArticleDetail;
  factory ArticleDetail.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailFromJson(json);
}
