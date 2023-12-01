// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deep_link_sub_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeepLinkSubState {
  StreamSubscription<dynamic>? get subscription =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeepLinkSubStateCopyWith<DeepLinkSubState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeepLinkSubStateCopyWith<$Res> {
  factory $DeepLinkSubStateCopyWith(
          DeepLinkSubState value, $Res Function(DeepLinkSubState) then) =
      _$DeepLinkSubStateCopyWithImpl<$Res, DeepLinkSubState>;
  @useResult
  $Res call({StreamSubscription<dynamic>? subscription});
}

/// @nodoc
class _$DeepLinkSubStateCopyWithImpl<$Res, $Val extends DeepLinkSubState>
    implements $DeepLinkSubStateCopyWith<$Res> {
  _$DeepLinkSubStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = freezed,
  }) {
    return _then(_value.copyWith(
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeepLinkSubStateImplCopyWith<$Res>
    implements $DeepLinkSubStateCopyWith<$Res> {
  factory _$$DeepLinkSubStateImplCopyWith(_$DeepLinkSubStateImpl value,
          $Res Function(_$DeepLinkSubStateImpl) then) =
      __$$DeepLinkSubStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StreamSubscription<dynamic>? subscription});
}

/// @nodoc
class __$$DeepLinkSubStateImplCopyWithImpl<$Res>
    extends _$DeepLinkSubStateCopyWithImpl<$Res, _$DeepLinkSubStateImpl>
    implements _$$DeepLinkSubStateImplCopyWith<$Res> {
  __$$DeepLinkSubStateImplCopyWithImpl(_$DeepLinkSubStateImpl _value,
      $Res Function(_$DeepLinkSubStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = freezed,
  }) {
    return _then(_$DeepLinkSubStateImpl(
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>?,
    ));
  }
}

/// @nodoc

class _$DeepLinkSubStateImpl implements _DeepLinkSubState {
  const _$DeepLinkSubStateImpl({required this.subscription});

  @override
  final StreamSubscription<dynamic>? subscription;

  @override
  String toString() {
    return 'DeepLinkSubState(subscription: $subscription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeepLinkSubStateImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeepLinkSubStateImplCopyWith<_$DeepLinkSubStateImpl> get copyWith =>
      __$$DeepLinkSubStateImplCopyWithImpl<_$DeepLinkSubStateImpl>(
          this, _$identity);
}

abstract class _DeepLinkSubState implements DeepLinkSubState {
  const factory _DeepLinkSubState(
          {required final StreamSubscription<dynamic>? subscription}) =
      _$DeepLinkSubStateImpl;

  @override
  StreamSubscription<dynamic>? get subscription;
  @override
  @JsonKey(ignore: true)
  _$$DeepLinkSubStateImplCopyWith<_$DeepLinkSubStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
