import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'topics_ranking.freezed.dart';

@freezed
class TopicsRanking with _$TopicsRanking {
  const factory TopicsRanking({
    required String id,
    required String taggingsCount,
  }) = _TopicsRanking;

  factory TopicsRanking.fromDocument(DocumentSnapshot doc) {
    return TopicsRanking(
      id: doc['id'].toString(),
      taggingsCount: doc['taggings_count'].toString(),
    );
  }
}
