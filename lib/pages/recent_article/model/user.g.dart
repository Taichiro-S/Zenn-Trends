// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as int,
      username: json['username'] as String,
      name: json['name'] as String,
      avatarSmallUrl: json['avatarSmallUrl'] as String,
      avatarUrl: json['avatarUrl'] as String,
      bio: json['bio'] as String,
      autolinkedBio: json['autolinkedBio'] as String,
      githubUsername: json['githubUsername'] as String,
      twitterUsername: json['twitterUsername'] as String,
      isSupportOpen: json['isSupportOpen'] as bool,
      tokusyoContact: json['tokusyoContact'] as String?,
      tokusyoName: json['tokusyoName'] as String?,
      websiteUrl: json['websiteUrl'] as String?,
      websiteDomain: json['websiteDomain'] as String?,
      totalLikedCount: json['totalLikedCount'] as int,
      gaTrackingId: json['gaTrackingId'] as String?,
      hatenaId: json['hatenaId'] as String?,
      isInvoiceIssuer: json['isInvoiceIssuer'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'avatarSmallUrl': instance.avatarSmallUrl,
      'avatarUrl': instance.avatarUrl,
      'bio': instance.bio,
      'autolinkedBio': instance.autolinkedBio,
      'githubUsername': instance.githubUsername,
      'twitterUsername': instance.twitterUsername,
      'isSupportOpen': instance.isSupportOpen,
      'tokusyoContact': instance.tokusyoContact,
      'tokusyoName': instance.tokusyoName,
      'websiteUrl': instance.websiteUrl,
      'websiteDomain': instance.websiteDomain,
      'totalLikedCount': instance.totalLikedCount,
      'gaTrackingId': instance.gaTrackingId,
      'hatenaId': instance.hatenaId,
      'isInvoiceIssuer': instance.isInvoiceIssuer,
    };
