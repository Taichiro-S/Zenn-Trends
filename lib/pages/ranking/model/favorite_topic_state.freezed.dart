// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_topic_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteTopicState {
  bool get isFavorite => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteTopicStateCopyWith<FavoriteTopicState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteTopicStateCopyWith<$Res> {
  factory $FavoriteTopicStateCopyWith(
          FavoriteTopicState value, $Res Function(FavoriteTopicState) then) =
      _$FavoriteTopicStateCopyWithImpl<$Res, FavoriteTopicState>;
  @useResult
  $Res call({bool isFavorite, bool isLoading});
}

/// @nodoc
class _$FavoriteTopicStateCopyWithImpl<$Res, $Val extends FavoriteTopicState>
    implements $FavoriteTopicStateCopyWith<$Res> {
  _$FavoriteTopicStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteTopicStateImplCopyWith<$Res>
    implements $FavoriteTopicStateCopyWith<$Res> {
  factory _$$FavoriteTopicStateImplCopyWith(_$FavoriteTopicStateImpl value,
          $Res Function(_$FavoriteTopicStateImpl) then) =
      __$$FavoriteTopicStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isFavorite, bool isLoading});
}

/// @nodoc
class __$$FavoriteTopicStateImplCopyWithImpl<$Res>
    extends _$FavoriteTopicStateCopyWithImpl<$Res, _$FavoriteTopicStateImpl>
    implements _$$FavoriteTopicStateImplCopyWith<$Res> {
  __$$FavoriteTopicStateImplCopyWithImpl(_$FavoriteTopicStateImpl _value,
      $Res Function(_$FavoriteTopicStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isFavorite = null,
    Object? isLoading = null,
  }) {
    return _then(_$FavoriteTopicStateImpl(
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FavoriteTopicStateImpl implements _FavoriteTopicState {
  const _$FavoriteTopicStateImpl(
      {required this.isFavorite, required this.isLoading});

  @override
  final bool isFavorite;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'FavoriteTopicState(isFavorite: $isFavorite, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteTopicStateImpl &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isFavorite, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteTopicStateImplCopyWith<_$FavoriteTopicStateImpl> get copyWith =>
      __$$FavoriteTopicStateImplCopyWithImpl<_$FavoriteTopicStateImpl>(
          this, _$identity);
}

abstract class _FavoriteTopicState implements FavoriteTopicState {
  const factory _FavoriteTopicState(
      {required final bool isFavorite,
      required final bool isLoading}) = _$FavoriteTopicStateImpl;

  @override
  bool get isFavorite;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteTopicStateImplCopyWith<_$FavoriteTopicStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
