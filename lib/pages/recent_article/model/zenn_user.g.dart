// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zenn_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZennUserImpl _$$ZennUserImplFromJson(Map<String, dynamic> json) =>
    _$ZennUserImpl(
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      totalLikedCount: json['totalLikedCount'] as int?,
    );

Map<String, dynamic> _$$ZennUserImplToJson(_$ZennUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'totalLikedCount': instance.totalLikedCount,
    };
