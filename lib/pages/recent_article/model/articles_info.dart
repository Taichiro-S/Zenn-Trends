import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/recent_article/model/article.dart';
import 'package:zenn_trends/pages/recent_article/model/topic.dart';
import 'package:zenn_trends/pages/recent_article/model/zenn_user.dart';

part 'articles_info.freezed.dart';
part 'articles_info.g.dart';

@freezed
class ArticlesInfo with _$ArticlesInfo {
  const factory ArticlesInfo({
    required String slug,
    required Article article,
    required ZennUser user,
    required List<Topic> topics,
  }) = _ArticlesInfo;

  factory ArticlesInfo.fromDocument(DocumentSnapshot doc) {
    return ArticlesInfo(
      slug: doc['slug'] as String,
      article: Article.fromJson(doc['article'] as Map<String, dynamic>),
      user: ZennUser.fromJson(doc['user'] as Map<String, dynamic>),
      topics: (doc['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
  factory ArticlesInfo.fromJson(Map<String, dynamic> json) =>
      _$ArticlesInfoFromJson(json);
}
