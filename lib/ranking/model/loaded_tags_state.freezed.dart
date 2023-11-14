// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loaded_tags_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadedTagsState {
  AsyncValue<List<RankedTag>> get rankedTags =>
      throw _privateConstructorUsedError;
  DocumentSnapshot<Object?>? get lastDoc => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadedTagsStateCopyWith<LoadedTagsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadedTagsStateCopyWith<$Res> {
  factory $LoadedTagsStateCopyWith(
          LoadedTagsState value, $Res Function(LoadedTagsState) then) =
      _$LoadedTagsStateCopyWithImpl<$Res, LoadedTagsState>;
  @useResult
  $Res call(
      {AsyncValue<List<RankedTag>> rankedTags,
      DocumentSnapshot<Object?>? lastDoc,
      bool isLoadingMore});
}

/// @nodoc
class _$LoadedTagsStateCopyWithImpl<$Res, $Val extends LoadedTagsState>
    implements $LoadedTagsStateCopyWith<$Res> {
  _$LoadedTagsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankedTags = null,
    Object? lastDoc = freezed,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      rankedTags: null == rankedTags
          ? _value.rankedTags
          : rankedTags // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RankedTag>>,
      lastDoc: freezed == lastDoc
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadedTagsStateImplCopyWith<$Res>
    implements $LoadedTagsStateCopyWith<$Res> {
  factory _$$LoadedTagsStateImplCopyWith(_$LoadedTagsStateImpl value,
          $Res Function(_$LoadedTagsStateImpl) then) =
      __$$LoadedTagsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<RankedTag>> rankedTags,
      DocumentSnapshot<Object?>? lastDoc,
      bool isLoadingMore});
}

/// @nodoc
class __$$LoadedTagsStateImplCopyWithImpl<$Res>
    extends _$LoadedTagsStateCopyWithImpl<$Res, _$LoadedTagsStateImpl>
    implements _$$LoadedTagsStateImplCopyWith<$Res> {
  __$$LoadedTagsStateImplCopyWithImpl(
      _$LoadedTagsStateImpl _value, $Res Function(_$LoadedTagsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rankedTags = null,
    Object? lastDoc = freezed,
    Object? isLoadingMore = null,
  }) {
    return _then(_$LoadedTagsStateImpl(
      rankedTags: null == rankedTags
          ? _value.rankedTags
          : rankedTags // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RankedTag>>,
      lastDoc: freezed == lastDoc
          ? _value.lastDoc
          : lastDoc // ignore: cast_nullable_to_non_nullable
              as DocumentSnapshot<Object?>?,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadedTagsStateImpl implements _LoadedTagsState {
  const _$LoadedTagsStateImpl(
      {required this.rankedTags,
      required this.lastDoc,
      required this.isLoadingMore});

  @override
  final AsyncValue<List<RankedTag>> rankedTags;
  @override
  final DocumentSnapshot<Object?>? lastDoc;
  @override
  final bool isLoadingMore;

  @override
  String toString() {
    return 'LoadedTagsState(rankedTags: $rankedTags, lastDoc: $lastDoc, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedTagsStateImpl &&
            (identical(other.rankedTags, rankedTags) ||
                other.rankedTags == rankedTags) &&
            (identical(other.lastDoc, lastDoc) || other.lastDoc == lastDoc) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, rankedTags, lastDoc, isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedTagsStateImplCopyWith<_$LoadedTagsStateImpl> get copyWith =>
      __$$LoadedTagsStateImplCopyWithImpl<_$LoadedTagsStateImpl>(
          this, _$identity);
}

abstract class _LoadedTagsState implements LoadedTagsState {
  const factory _LoadedTagsState(
      {required final AsyncValue<List<RankedTag>> rankedTags,
      required final DocumentSnapshot<Object?>? lastDoc,
      required final bool isLoadingMore}) = _$LoadedTagsStateImpl;

  @override
  AsyncValue<List<RankedTag>> get rankedTags;
  @override
  DocumentSnapshot<Object?>? get lastDoc;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$LoadedTagsStateImplCopyWith<_$LoadedTagsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
