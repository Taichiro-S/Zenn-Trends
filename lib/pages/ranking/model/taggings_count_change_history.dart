import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'taggings_count_change_history.freezed.dart';

@freezed
class TaggingsCountChangeHistory with _$TaggingsCountChangeHistory {
  const factory TaggingsCountChangeHistory(
      {required DateTime date,
      required int change}) = _TaggingsCountChangeHistory;

  factory TaggingsCountChangeHistory.fromValue(int change, DateTime date) {
    return TaggingsCountChangeHistory(
      date: date,
      change: change,
    );
  }
}
