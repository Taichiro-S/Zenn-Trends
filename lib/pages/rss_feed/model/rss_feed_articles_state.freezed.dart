// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_articles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RssFeedArticlesState {
  AsyncValue<List<RssFeedArticle>> get rssFeedArticles =>
      throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastDocument =>
      throw _privateConstructorUsedError;
  String get selectedTopicName => throw _privateConstructorUsedError;
  DateTime get lastUpdatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RssFeedArticlesStateCopyWith<RssFeedArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RssFeedArticlesStateCopyWith<$Res> {
  factory $RssFeedArticlesStateCopyWith(RssFeedArticlesState value,
          $Res Function(RssFeedArticlesState) then) =
      _$RssFeedArticlesStateCopyWithImpl<$Res, RssFeedArticlesState>;
  @useResult
  $Res call(
      {AsyncValue<List<RssFeedArticle>> rssFeedArticles,
      DocumentSnapshot<Object?>? lastDocument,
      String selectedTopicName,
      DateTime lastUpdatedAt});
}

/// @nodoc
class _$RssFeedArticlesStateCopyWithImpl<$Res,
        $Val extends RssFeedArticlesState>
    implements $RssFeedArticlesStateCopyWith<$Res> {
  _$RssFeedArticlesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rssFeedArticles = null,
    Object? lastDocument = freezed,
    Object? selectedTopicName = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_value.copyWith(
      rssFeedArticles: null == rssFeedArticles
          ? _value.rssFeedArticles
          : rssFeedArticles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RssFeedArticle>>,
      lastDocument: freezed == lastDocument
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      selectedTopicName: null == selectedTopicName
          ? _value.selectedTopicName
          : selectedTopicName // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RssFeedArticlesStateImplCopyWith<$Res>
    implements $RssFeedArticlesStateCopyWith<$Res> {
  factory _$$RssFeedArticlesStateImplCopyWith(_$RssFeedArticlesStateImpl value,
          $Res Function(_$RssFeedArticlesStateImpl) then) =
      __$$RssFeedArticlesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<RssFeedArticle>> rssFeedArticles,
      DocumentSnapshot<Object?>? lastDocument,
      String selectedTopicName,
      DateTime lastUpdatedAt});
}

/// @nodoc
class __$$RssFeedArticlesStateImplCopyWithImpl<$Res>
    extends _$RssFeedArticlesStateCopyWithImpl<$Res, _$RssFeedArticlesStateImpl>
    implements _$$RssFeedArticlesStateImplCopyWith<$Res> {
  __$$RssFeedArticlesStateImplCopyWithImpl(_$RssFeedArticlesStateImpl _value,
      $Res Function(_$RssFeedArticlesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rssFeedArticles = null,
    Object? lastDocument = freezed,
    Object? selectedTopicName = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_$RssFeedArticlesStateImpl(
      rssFeedArticles: null == rssFeedArticles
          ? _value.rssFeedArticles
          : rssFeedArticles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RssFeedArticle>>,
      lastDocument: freezed == lastDocument
          ? _value.lastDocument
          : lastDocument // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      selectedTopicName: null == selectedTopicName
          ? _value.selectedTopicName
          : selectedTopicName // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$RssFeedArticlesStateImpl implements _RssFeedArticlesState {
  const _$RssFeedArticlesStateImpl(
      {required this.rssFeedArticles,
      required this.lastDocument,
      required this.selectedTopicName,
      required this.lastUpdatedAt});

  @override
  final AsyncValue<List<RssFeedArticle>> rssFeedArticles;
  @override
  final DocumentSnapshot<Object?>? lastDocument;
  @override
  final String selectedTopicName;
  @override
  final DateTime lastUpdatedAt;

  @override
  String toString() {
    return 'RssFeedArticlesState(rssFeedArticles: $rssFeedArticles, lastDocument: $lastDocument, selectedTopicName: $selectedTopicName, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RssFeedArticlesStateImpl &&
            (identical(other.rssFeedArticles, rssFeedArticles) ||
                other.rssFeedArticles == rssFeedArticles) &&
            (identical(other.lastDocument, lastDocument) ||
                other.lastDocument == lastDocument) &&
            (identical(other.selectedTopicName, selectedTopicName) ||
                other.selectedTopicName == selectedTopicName) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rssFeedArticles, lastDocument,
      selectedTopicName, lastUpdatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RssFeedArticlesStateImplCopyWith<_$RssFeedArticlesStateImpl>
      get copyWith =>
          __$$RssFeedArticlesStateImplCopyWithImpl<_$RssFeedArticlesStateImpl>(
              this, _$identity);
}

abstract class _RssFeedArticlesState implements RssFeedArticlesState {
  const factory _RssFeedArticlesState(
      {required final AsyncValue<List<RssFeedArticle>> rssFeedArticles,
      required final DocumentSnapshot<Object?>? lastDocument,
      required final String selectedTopicName,
      required final DateTime lastUpdatedAt}) = _$RssFeedArticlesStateImpl;

  @override
  AsyncValue<List<RssFeedArticle>> get rssFeedArticles;
  @override
  DocumentSnapshot<Object?>? get lastDocument;
  @override
  String get selectedTopicName;
  @override
  DateTime get lastUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$RssFeedArticlesStateImplCopyWith<_$RssFeedArticlesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
