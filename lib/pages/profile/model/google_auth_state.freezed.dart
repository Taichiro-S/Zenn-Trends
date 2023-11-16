// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleAuthState {
  AsyncValue<User?> get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoogleAuthStateCopyWith<GoogleAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleAuthStateCopyWith<$Res> {
  factory $GoogleAuthStateCopyWith(
          GoogleAuthState value, $Res Function(GoogleAuthState) then) =
      _$GoogleAuthStateCopyWithImpl<$Res, GoogleAuthState>;
  @useResult
  $Res call({AsyncValue<User?> user});
}

/// @nodoc
class _$GoogleAuthStateCopyWithImpl<$Res, $Val extends GoogleAuthState>
    implements $GoogleAuthStateCopyWith<$Res> {
  _$GoogleAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AsyncValue<User?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoogleAuthStateImplCopyWith<$Res>
    implements $GoogleAuthStateCopyWith<$Res> {
  factory _$$GoogleAuthStateImplCopyWith(_$GoogleAuthStateImpl value,
          $Res Function(_$GoogleAuthStateImpl) then) =
      __$$GoogleAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<User?> user});
}

/// @nodoc
class __$$GoogleAuthStateImplCopyWithImpl<$Res>
    extends _$GoogleAuthStateCopyWithImpl<$Res, _$GoogleAuthStateImpl>
    implements _$$GoogleAuthStateImplCopyWith<$Res> {
  __$$GoogleAuthStateImplCopyWithImpl(
      _$GoogleAuthStateImpl _value, $Res Function(_$GoogleAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$GoogleAuthStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as AsyncValue<User?>,
    ));
  }
}

/// @nodoc

class _$GoogleAuthStateImpl implements _GoogleAuthState {
  const _$GoogleAuthStateImpl({required this.user});

  @override
  final AsyncValue<User?> user;

  @override
  String toString() {
    return 'GoogleAuthState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleAuthStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleAuthStateImplCopyWith<_$GoogleAuthStateImpl> get copyWith =>
      __$$GoogleAuthStateImplCopyWithImpl<_$GoogleAuthStateImpl>(
          this, _$identity);
}

abstract class _GoogleAuthState implements GoogleAuthState {
  const factory _GoogleAuthState({required final AsyncValue<User?> user}) =
      _$GoogleAuthStateImpl;

  @override
  AsyncValue<User?> get user;
  @override
  @JsonKey(ignore: true)
  _$$GoogleAuthStateImplCopyWith<_$GoogleAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
