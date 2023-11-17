import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/ranking/model/topic_history_state.dart';

part 'ranked_topic.freezed.dart';

@freezed
class RankedTopic with _$RankedTopic {
  const factory RankedTopic({
    required String id,
    required Timestamp date,
    required String displayName,
    required String name,
    required int taggingsCount,
    required int taggingsCountChange,
    required DocumentSnapshot documentSnapshot,
    String? imageUrl,
    bool? isFavorite,
    List<TopicHistoryState>? taggingsCountHistory,
  }) = _RankedTopic;

  factory RankedTopic.fromDocument(DocumentSnapshot doc) {
    List<TopicHistoryState> taggingsCountHistory = [];
    (doc['taggings_count_history'] as Map<String, dynamic>)
        .forEach((key, value) {
      DateTime dateTime = DateTime.parse(key);
      Timestamp timestamp = Timestamp.fromDate(dateTime);
      int change = value as int;
      taggingsCountHistory
          .add(TopicHistoryState(date: timestamp, change: change));
    });
    taggingsCountHistory.sort((a, b) => a.date.compareTo(b.date));
    return RankedTopic(
      id: doc['id'].toString(),
      date: doc['date'] as Timestamp,
      displayName: doc['display_name'] as String,
      name: doc['name'] as String,
      taggingsCount: doc['taggings_count'] as int,
      taggingsCountChange: doc['taggings_count_change'] as int,
      documentSnapshot: doc,
      imageUrl: doc['image_url'] as String?,
      taggingsCountHistory: taggingsCountHistory,
    );
  }
}
