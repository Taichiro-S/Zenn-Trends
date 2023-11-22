// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic.freezed.dart';
part 'topic.g.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    required int id,
    required String name,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'taggings_count') required int taggingsCount,
    @JsonKey(name: 'image_url') required String? imageUrl,
  }) = _Topic;
  factory Topic.fromJson(Map<String, dynamic> json) => _$TopicFromJson(json);

  factory Topic.fromDocument(DocumentSnapshot doc) {
    return Topic(
      id: doc['id'] as int,
      name: doc['name'] as String,
      displayName: doc['display_name'] as String,
      taggingsCount: doc['taggings_count'] as int,
      imageUrl: doc['image_url'] as String?,
    );
  }
}
