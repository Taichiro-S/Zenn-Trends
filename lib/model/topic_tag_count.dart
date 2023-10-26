import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'topic_tag_count.freezed.dart';

@freezed
class TopicTagCount with _$TopicTagCount {
  const factory TopicTagCount({
    required String id,
    required DateTime date,
    required String rank,
    required int taggingsCount,
  }) = _TopicTagCount;

  factory TopicTagCount.fromDocument(String id, DocumentSnapshot doc) {
    return TopicTagCount(
      id: id,
      date: doc['date'],
      rank: doc['rank'],
      taggingsCount: doc['taggings_count'],
    );
  }
}
