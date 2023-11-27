// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trend_topics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrendTopicsState {
  AsyncValue<List<TrendTopic>> get trendTopics =>
      throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  Timestamp get lastUpdatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendTopicsStateCopyWith<TrendTopicsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendTopicsStateCopyWith<$Res> {
  factory $TrendTopicsStateCopyWith(
          TrendTopicsState value, $Res Function(TrendTopicsState) then) =
      _$TrendTopicsStateCopyWithImpl<$Res, TrendTopicsState>;
  @useResult
  $Res call(
      {AsyncValue<List<TrendTopic>> trendTopics,
      int index,
      Timestamp lastUpdatedAt});
}

/// @nodoc
class _$TrendTopicsStateCopyWithImpl<$Res, $Val extends TrendTopicsState>
    implements $TrendTopicsStateCopyWith<$Res> {
  _$TrendTopicsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendTopics = null,
    Object? index = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_value.copyWith(
      trendTopics: null == trendTopics
          ? _value.trendTopics
          : trendTopics // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TrendTopic>>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TrendTopicsStateImplCopyWith<$Res>
    implements $TrendTopicsStateCopyWith<$Res> {
  factory _$$TrendTopicsStateImplCopyWith(_$TrendTopicsStateImpl value,
          $Res Function(_$TrendTopicsStateImpl) then) =
      __$$TrendTopicsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<TrendTopic>> trendTopics,
      int index,
      Timestamp lastUpdatedAt});
}

/// @nodoc
class __$$TrendTopicsStateImplCopyWithImpl<$Res>
    extends _$TrendTopicsStateCopyWithImpl<$Res, _$TrendTopicsStateImpl>
    implements _$$TrendTopicsStateImplCopyWith<$Res> {
  __$$TrendTopicsStateImplCopyWithImpl(_$TrendTopicsStateImpl _value,
      $Res Function(_$TrendTopicsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trendTopics = null,
    Object? index = null,
    Object? lastUpdatedAt = null,
  }) {
    return _then(_$TrendTopicsStateImpl(
      trendTopics: null == trendTopics
          ? _value.trendTopics
          : trendTopics // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<TrendTopic>>,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedAt: null == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
    ));
  }
}

/// @nodoc

class _$TrendTopicsStateImpl implements _TrendTopicsState {
  const _$TrendTopicsStateImpl(
      {required this.trendTopics,
      required this.index,
      required this.lastUpdatedAt});

  @override
  final AsyncValue<List<TrendTopic>> trendTopics;
  @override
  final int index;
  @override
  final Timestamp lastUpdatedAt;

  @override
  String toString() {
    return 'TrendTopicsState(trendTopics: $trendTopics, index: $index, lastUpdatedAt: $lastUpdatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendTopicsStateImpl &&
            (identical(other.trendTopics, trendTopics) ||
                other.trendTopics == trendTopics) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, trendTopics, index, lastUpdatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendTopicsStateImplCopyWith<_$TrendTopicsStateImpl> get copyWith =>
      __$$TrendTopicsStateImplCopyWithImpl<_$TrendTopicsStateImpl>(
          this, _$identity);
}

abstract class _TrendTopicsState implements TrendTopicsState {
  const factory _TrendTopicsState(
      {required final AsyncValue<List<TrendTopic>> trendTopics,
      required final int index,
      required final Timestamp lastUpdatedAt}) = _$TrendTopicsStateImpl;

  @override
  AsyncValue<List<TrendTopic>> get trendTopics;
  @override
  int get index;
  @override
  Timestamp get lastUpdatedAt;
  @override
  @JsonKey(ignore: true)
  _$$TrendTopicsStateImplCopyWith<_$TrendTopicsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
