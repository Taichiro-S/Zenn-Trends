import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/ranking/model/tag_history_state.dart';

part 'ranked_tag.freezed.dart';

@freezed
class RankedTag with _$RankedTag {
  const factory RankedTag({
    required String id,
    required Timestamp date,
    required String displayName,
    required int taggingsCount,
    required int taggingsCountChange,
    required DocumentSnapshot documentSnapshot,
    String? imageUrl,
    List<TagHistoryState>? taggingsCountHistory,
  }) = _RankedTag;

  factory RankedTag.fromDocument(DocumentSnapshot doc) {
    List<TagHistoryState> taggingsCountHistory = [];
    (doc['taggings_count_history'] as Map<String, dynamic>)
        .forEach((key, value) {
      DateTime dateTime = DateTime.parse(key);
      Timestamp timestamp = Timestamp.fromDate(dateTime);
      int change = value as int;
      taggingsCountHistory
          .add(TagHistoryState(date: timestamp, change: change));
    });
    taggingsCountHistory.sort((a, b) => a.date.compareTo(b.date));
    return RankedTag(
      id: doc['id'].toString(),
      date: doc['date'] as Timestamp,
      displayName: doc['display_name'] as String,
      taggingsCount: doc['taggings_count'] as int,
      taggingsCountChange: doc['taggings_count_change'] as int,
      documentSnapshot: doc,
      imageUrl: doc['image_url'] as String?,
      taggingsCountHistory: taggingsCountHistory,
    );
  }
}
