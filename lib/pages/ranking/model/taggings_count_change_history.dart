import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'taggings_count_change_history.freezed.dart';

@freezed
class TaggingsCountChangeHistory with _$TaggingsCountChangeHistory {
  const factory TaggingsCountChangeHistory(
      {required Timestamp date,
      required int change}) = _TaggingsCountChangeHistory;

  factory TaggingsCountChangeHistory.fromValue(int change, Timestamp date) {
    return TaggingsCountChangeHistory(
      date: date,
      change: change,
    );
  }
}
