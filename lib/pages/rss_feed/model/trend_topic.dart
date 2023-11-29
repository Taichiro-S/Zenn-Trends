import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'trend_topic.freezed.dart';

@freezed
class TrendTopic with _$TrendTopic {
  const factory TrendTopic({
    required String name,
    required String id,
    required DateTime updatedAt,
    required int taggingsCount,
    required String displayName,
    String? imageUrl,
  }) = _TrendTopic;

  factory TrendTopic.fromDocument(DocumentSnapshot doc) {
    final data = doc.data()! as Map<String, dynamic>;
    return TrendTopic(
      name: data['name'] as String,
      id: data['id'] as String,
      updatedAt: (data['updated_at'] as Timestamp).toDate(),
      taggingsCount: data['taggings_count'] as int,
      displayName: data['display_name'] as String,
      imageUrl: data['image_url'] as String?,
    );
  }
}
