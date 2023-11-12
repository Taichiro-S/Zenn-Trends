import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_tag_count.freezed.dart';

@freezed
class TopicTagCount with _$TopicTagCount {
  const factory TopicTagCount({
    required String id,
    required Timestamp date,
    required String rank,
    required String taggingsCount,
  }) = _TopicTagCount;

  factory TopicTagCount.fromDocument(String id, DocumentSnapshot doc) {
    return TopicTagCount(
      id: id,
      date: doc['date'] as Timestamp,
      rank: doc['rank'].toString(),
      taggingsCount: doc['taggings_count'].toString(),
    );
  }
}
