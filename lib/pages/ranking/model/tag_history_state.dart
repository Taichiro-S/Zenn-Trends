import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tag_history_state.freezed.dart';

@freezed
class TagHistoryState with _$TagHistoryState {
  const factory TagHistoryState(
      {required Timestamp date, required int change}) = _TagHistoryState;
}
