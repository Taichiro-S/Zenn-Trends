// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loaded_topics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadedTopicsState {
  AsyncValue<List<RankedTopic>> get rankedTopics =>
      throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastDoc => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  String? get searchWord => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadedTopicsStateCopyWith<LoadedTopicsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadedTopicsStateCopyWith<$Res> {
  factory $LoadedTopicsStateCopyWith(
          LoadedTopicsState value, $Res Function(LoadedTopicsState) then) =
      _$LoadedTopicsStateCopyWithImpl<$Res, LoadedTopicsState>;
  @useResult
  $Res call(
      {AsyncValue<List<RankedTopic>> rankedTopics,
      DocumentSnapshot<Object?>? lastDoc,
      bool isLoadingMore,
      bool isSearching,
      String? searchWord});
}

/// @nodoc
class _$LoadedTopicsStateCopyWithImpl<$Res, $Val extends LoadedTopicsState>
    implements $LoadedTopicsStateCopyWith<$Res> {
  _$LoadedTopicsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankedTopics = null,
    Object? lastDoc = freezed,
    Object? isLoadingMore = null,
    Object? isSearching = null,
    Object? searchWord = freezed,
  }) {
    return _then(_value.copyWith(
      rankedTopics: null == rankedTopics
          ? _value.rankedTopics
          : rankedTopics // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RankedTopic>>,
      lastDoc: freezed == lastDoc
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadedTopicsStateeImplCopyWith<$Res>
    implements $LoadedTopicsStateCopyWith<$Res> {
  factory _$$LoadedTopicsStateeImplCopyWith(_$LoadedTopicsStateeImpl value,
          $Res Function(_$LoadedTopicsStateeImpl) then) =
      __$$LoadedTopicsStateeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<RankedTopic>> rankedTopics,
      DocumentSnapshot<Object?>? lastDoc,
      bool isLoadingMore,
      bool isSearching,
      String? searchWord});
}

/// @nodoc
class __$$LoadedTopicsStateeImplCopyWithImpl<$Res>
    extends _$LoadedTopicsStateCopyWithImpl<$Res, _$LoadedTopicsStateeImpl>
    implements _$$LoadedTopicsStateeImplCopyWith<$Res> {
  __$$LoadedTopicsStateeImplCopyWithImpl(_$LoadedTopicsStateeImpl _value,
      $Res Function(_$LoadedTopicsStateeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankedTopics = null,
    Object? lastDoc = freezed,
    Object? isLoadingMore = null,
    Object? isSearching = null,
    Object? searchWord = freezed,
  }) {
    return _then(_$LoadedTopicsStateeImpl(
      rankedTopics: null == rankedTopics
          ? _value.rankedTopics
          : rankedTopics // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RankedTopic>>,
      lastDoc: freezed == lastDoc
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadedTopicsStateeImpl implements _LoadedTopicsStatee {
  const _$LoadedTopicsStateeImpl(
      {required this.rankedTopics,
      required this.lastDoc,
      required this.isLoadingMore,
      required this.isSearching,
      this.searchWord});

  @override
  final AsyncValue<List<RankedTopic>> rankedTopics;
  @override
  final DocumentSnapshot<Object?>? lastDoc;
  @override
  final bool isLoadingMore;
  @override
  final bool isSearching;
  @override
  final String? searchWord;

  @override
  String toString() {
    return 'LoadedTopicsState(rankedTopics: $rankedTopics, lastDoc: $lastDoc, isLoadingMore: $isLoadingMore, isSearching: $isSearching, searchWord: $searchWord)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedTopicsStateeImpl &&
            (identical(other.rankedTopics, rankedTopics) ||
                other.rankedTopics == rankedTopics) &&
            (identical(other.lastDoc, lastDoc) || other.lastDoc == lastDoc) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.searchWord, searchWord) ||
                other.searchWord == searchWord));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rankedTopics, lastDoc,
      isLoadingMore, isSearching, searchWord);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedTopicsStateeImplCopyWith<_$LoadedTopicsStateeImpl> get copyWith =>
      __$$LoadedTopicsStateeImplCopyWithImpl<_$LoadedTopicsStateeImpl>(
          this, _$identity);
}

abstract class _LoadedTopicsStatee implements LoadedTopicsState {
  const factory _LoadedTopicsStatee(
      {required final AsyncValue<List<RankedTopic>> rankedTopics,
      required final DocumentSnapshot<Object?>? lastDoc,
      required final bool isLoadingMore,
      required final bool isSearching,
      final String? searchWord}) = _$LoadedTopicsStateeImpl;

  @override
  AsyncValue<List<RankedTopic>> get rankedTopics;
  @override
  DocumentSnapshot<Object?>? get lastDoc;
  @override
  bool get isLoadingMore;
  @override
  bool get isSearching;
  @override
  String? get searchWord;
  @override
  @JsonKey(ignore: true)
  _$$LoadedTopicsStateeImplCopyWith<_$LoadedTopicsStateeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
