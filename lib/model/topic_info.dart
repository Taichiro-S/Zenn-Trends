import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_info.freezed.dart';

@freezed
class TopicInfo with _$TopicInfo {
  const factory TopicInfo({
    required String id,
    required String name,
    required String displayName,
    required String taggingsCount,
    String? imageUrl,
  }) = _TopicInfo;

  factory TopicInfo.fromDocument(DocumentSnapshot doc) {
    return TopicInfo(
      id: doc['id'].toString(),
      name: doc['name'].toString(),
      displayName: doc['display_name'].toString(),
      taggingsCount: doc['taggings_count'].toString(),
      imageUrl: doc['image_url'].toString(),
    );
  }
}
