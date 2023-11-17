import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zenn_trends/pages/recent_article/model/articles_info.dart';

part 'articles_info_state.freezed.dart';

@freezed
class ArticlesInfoState with _$ArticlesInfoState {
  const factory ArticlesInfoState({
    required AsyncValue<List<ArticlesInfo>> articlesInfo,
  }) = _ArticlesInfoState;
}
