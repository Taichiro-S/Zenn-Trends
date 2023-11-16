// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zenn_article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZennArticleImpl _$$ZennArticleImplFromJson(Map<String, dynamic> json) =>
    _$ZennArticleImpl(
      id: json['id'] as int,
      postType: json['post_type'] as String?,
      title: json['title'] as String,
      slug: json['slug'] as String,
      commentsCount: json['comments_count'] as int,
      likedCount: json['liked_count'] as int,
      bodyLettersCount: json['body_letters_count'] as int,
      articleType: json['article_type'] as String?,
      emoji: json['emoji'] as String?,
      isSuspendingPrivate: json['is_suspending_private'] as bool,
      publishedAt: json['published_at'] as String,
      bodyUpdatedAt: json['body_updated_at'] as String,
      sourceRepoUpdatedAt: json['source_repo_updated_at'] as String?,
      pinned: json['pinned'] as bool,
      path: json['path'] as String,
      user: json['user'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$ZennArticleImplToJson(_$ZennArticleImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'post_type': instance.postType,
      'title': instance.title,
      'slug': instance.slug,
      'comments_count': instance.commentsCount,
      'liked_count': instance.likedCount,
      'body_letters_count': instance.bodyLettersCount,
      'article_type': instance.articleType,
      'emoji': instance.emoji,
      'is_suspending_private': instance.isSuspendingPrivate,
      'published_at': instance.publishedAt,
      'body_updated_at': instance.bodyUpdatedAt,
      'source_repo_updated_at': instance.sourceRepoUpdatedAt,
      'pinned': instance.pinned,
      'path': instance.path,
      'user': instance.user,
    };
