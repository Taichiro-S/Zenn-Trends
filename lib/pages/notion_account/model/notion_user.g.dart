// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notion_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotionUserImpl _$$NotionUserImplFromJson(Map<String, dynamic> json) =>
    _$NotionUserImpl(
      object: json['object'] as String,
      id: json['id'] as String,
      type: json['type'] as String?,
      name: json['name'] as String?,
      avatorUrl: json['avator_url'] as String?,
    );

Map<String, dynamic> _$$NotionUserImplToJson(_$NotionUserImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'avator_url': instance.avatorUrl,
    };
