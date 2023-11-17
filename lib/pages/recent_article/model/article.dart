import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'article.freezed.dart';
part 'article.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    required String title,
    required String? emoji,
    @JsonKey(name: 'published_at') required String publishedAt,
    @JsonKey(name: 'path') required String path,
  }) = _Article;
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  factory Article.fromDocument(DocumentSnapshot doc) {
    return Article(
      title: doc['title'] as String,
      emoji: doc['emoji'] as String?,
      publishedAt: doc['published_at'] as String,
      path: doc['path'] as String,
    );
  }
}
