import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'topic_history_state.freezed.dart';

@freezed
class TopicHistoryState with _$TopicHistoryState {
  const factory TopicHistoryState(
      {required Timestamp date, required int change}) = _TopicHistoryState;
}
