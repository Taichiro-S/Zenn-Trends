// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TopicImpl _$$TopicImplFromJson(Map<String, dynamic> json) => _$TopicImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      displayName: json['displayName'] as String,
      taggingsCount: json['taggingsCount'] as int,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$TopicImplToJson(_$TopicImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'displayName': instance.displayName,
      'taggingsCount': instance.taggingsCount,
      'imageUrl': instance.imageUrl,
    };
