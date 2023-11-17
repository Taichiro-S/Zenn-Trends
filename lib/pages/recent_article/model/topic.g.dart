// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicImpl _$$TopicImplFromJson(Map<String, dynamic> json) => _$TopicImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      displayName: json['display_name'] as String,
      taggingsCount: json['taggings_count'] as int,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$$TopicImplToJson(_$TopicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'taggings_count': instance.taggingsCount,
      'image_url': instance.imageUrl,
    };
