// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_topics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteTopicsState {
  AsyncValue<List<String>> get topicIds => throw _privateConstructorUsedError;
  Map<String, AsyncValue<void>> get individualLoadingStates =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteTopicsStateCopyWith<FavoriteTopicsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteTopicsStateCopyWith<$Res> {
  factory $FavoriteTopicsStateCopyWith(
          FavoriteTopicsState value, $Res Function(FavoriteTopicsState) then) =
      _$FavoriteTopicsStateCopyWithImpl<$Res, FavoriteTopicsState>;
  @useResult
  $Res call(
      {AsyncValue<List<String>> topicIds,
      Map<String, AsyncValue<void>> individualLoadingStates});
}

/// @nodoc
class _$FavoriteTopicsStateCopyWithImpl<$Res, $Val extends FavoriteTopicsState>
    implements $FavoriteTopicsStateCopyWith<$Res> {
  _$FavoriteTopicsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicIds = null,
    Object? individualLoadingStates = null,
  }) {
    return _then(_value.copyWith(
      topicIds: null == topicIds
          ? _value.topicIds
          : topicIds // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<String>>,
      individualLoadingStates: null == individualLoadingStates
          ? _value.individualLoadingStates
          : individualLoadingStates // ignore: cast_nullable_to_non_nullable
              as Map<String, AsyncValue<void>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteTopicsStateImplCopyWith<$Res>
    implements $FavoriteTopicsStateCopyWith<$Res> {
  factory _$$FavoriteTopicsStateImplCopyWith(_$FavoriteTopicsStateImpl value,
          $Res Function(_$FavoriteTopicsStateImpl) then) =
      __$$FavoriteTopicsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<String>> topicIds,
      Map<String, AsyncValue<void>> individualLoadingStates});
}

/// @nodoc
class __$$FavoriteTopicsStateImplCopyWithImpl<$Res>
    extends _$FavoriteTopicsStateCopyWithImpl<$Res, _$FavoriteTopicsStateImpl>
    implements _$$FavoriteTopicsStateImplCopyWith<$Res> {
  __$$FavoriteTopicsStateImplCopyWithImpl(_$FavoriteTopicsStateImpl _value,
      $Res Function(_$FavoriteTopicsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicIds = null,
    Object? individualLoadingStates = null,
  }) {
    return _then(_$FavoriteTopicsStateImpl(
      topicIds: null == topicIds
          ? _value.topicIds
          : topicIds // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<String>>,
      individualLoadingStates: null == individualLoadingStates
          ? _value._individualLoadingStates
          : individualLoadingStates // ignore: cast_nullable_to_non_nullable
              as Map<String, AsyncValue<void>>,
    ));
  }
}

/// @nodoc

class _$FavoriteTopicsStateImpl implements _FavoriteTopicsState {
  const _$FavoriteTopicsStateImpl(
      {required this.topicIds,
      required final Map<String, AsyncValue<void>> individualLoadingStates})
      : _individualLoadingStates = individualLoadingStates;

  @override
  final AsyncValue<List<String>> topicIds;
  final Map<String, AsyncValue<void>> _individualLoadingStates;
  @override
  Map<String, AsyncValue<void>> get individualLoadingStates {
    if (_individualLoadingStates is EqualUnmodifiableMapView)
      return _individualLoadingStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_individualLoadingStates);
  }

  @override
  String toString() {
    return 'FavoriteTopicsState(topicIds: $topicIds, individualLoadingStates: $individualLoadingStates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteTopicsStateImpl &&
            (identical(other.topicIds, topicIds) ||
                other.topicIds == topicIds) &&
            const DeepCollectionEquality().equals(
                other._individualLoadingStates, _individualLoadingStates));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topicIds,
      const DeepCollectionEquality().hash(_individualLoadingStates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteTopicsStateImplCopyWith<_$FavoriteTopicsStateImpl> get copyWith =>
      __$$FavoriteTopicsStateImplCopyWithImpl<_$FavoriteTopicsStateImpl>(
          this, _$identity);
}

abstract class _FavoriteTopicsState implements FavoriteTopicsState {
  const factory _FavoriteTopicsState(
      {required final AsyncValue<List<String>> topicIds,
      required final Map<String, AsyncValue<void>>
          individualLoadingStates}) = _$FavoriteTopicsStateImpl;

  @override
  AsyncValue<List<String>> get topicIds;
  @override
  Map<String, AsyncValue<void>> get individualLoadingStates;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteTopicsStateImplCopyWith<_$FavoriteTopicsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
