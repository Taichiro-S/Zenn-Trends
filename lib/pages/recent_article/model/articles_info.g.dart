// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'articles_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArticlesInfoImpl _$$ArticlesInfoImplFromJson(Map<String, dynamic> json) =>
    _$ArticlesInfoImpl(
      slug: json['slug'] as String,
      article: Article.fromJson(json['article'] as Map<String, dynamic>),
      user: ZennUser.fromJson(json['user'] as Map<String, dynamic>),
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ArticlesInfoImplToJson(_$ArticlesInfoImpl instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'article': instance.article,
      'user': instance.user,
      'topics': instance.topics,
    };
