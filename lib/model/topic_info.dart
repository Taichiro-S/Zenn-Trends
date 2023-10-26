import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'topic_info.freezed.dart';

@freezed
class TopicInfo with _$TopicInfo {
  const factory TopicInfo({
    required String id,
    required String name,
    required String displayName,
    String? imageUrl,
  }) = _TopicInfo;

  factory TopicInfo.fromDocument(DocumentSnapshot doc) {
    return TopicInfo(
      id: doc.id,
      name: doc['name'],
      displayName: doc['display_name'],
      imageUrl: doc['image_url'],
    );
  }
}
