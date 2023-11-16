// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticleDetailImpl _$$ArticleDetailImplFromJson(Map<String, dynamic> json) =>
    _$ArticleDetailImpl(
      id: json['id'] as int,
      postType: json['postType'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      commentsCount: json['commentsCount'] as int,
      likedCount: json['likedCount'] as int,
      bodyLettersCount: json['bodyLettersCount'] as int,
      articleType: json['articleType'] as String,
      emoji: json['emoji'] as String,
      isSuspendingPrivate: json['isSuspendingPrivate'] as bool,
      publishedAt: json['publishedAt'] as String,
      bodyUpdatedAt: json['bodyUpdatedAt'] as String,
      sourceRepoUpdatedAt: json['sourceRepoUpdatedAt'] as String,
      pinned: json['pinned'] as bool,
      path: json['path'] as String,
      bodyHtml: json['bodyHtml'] as String,
      user: json['user'] as Map<String, dynamic>,
      topics: (json['topics'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$ArticleDetailImplToJson(_$ArticleDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postType': instance.postType,
      'title': instance.title,
      'slug': instance.slug,
      'commentsCount': instance.commentsCount,
      'likedCount': instance.likedCount,
      'bodyLettersCount': instance.bodyLettersCount,
      'articleType': instance.articleType,
      'emoji': instance.emoji,
      'isSuspendingPrivate': instance.isSuspendingPrivate,
      'publishedAt': instance.publishedAt,
      'bodyUpdatedAt': instance.bodyUpdatedAt,
      'sourceRepoUpdatedAt': instance.sourceRepoUpdatedAt,
      'pinned': instance.pinned,
      'path': instance.path,
      'bodyHtml': instance.bodyHtml,
      'user': instance.user,
      'topics': instance.topics,
    };
