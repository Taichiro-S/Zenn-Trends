// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_auth_storage_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotionAuthStorageState {
  AsyncValue<NotionAuthState> get notionAuthStorageState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotionAuthStorageStateCopyWith<NotionAuthStorageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionAuthStorageStateCopyWith<$Res> {
  factory $NotionAuthStorageStateCopyWith(NotionAuthStorageState value,
          $Res Function(NotionAuthStorageState) then) =
      _$NotionAuthStorageStateCopyWithImpl<$Res, NotionAuthStorageState>;
  @useResult
  $Res call({AsyncValue<NotionAuthState> notionAuthStorageState});
}

/// @nodoc
class _$NotionAuthStorageStateCopyWithImpl<$Res,
        $Val extends NotionAuthStorageState>
    implements $NotionAuthStorageStateCopyWith<$Res> {
  _$NotionAuthStorageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notionAuthStorageState = null,
  }) {
    return _then(_value.copyWith(
      notionAuthStorageState: null == notionAuthStorageState
          ? _value.notionAuthStorageState
          : notionAuthStorageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<NotionAuthState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotionAuthStorageStateImplCopyWith<$Res>
    implements $NotionAuthStorageStateCopyWith<$Res> {
  factory _$$NotionAuthStorageStateImplCopyWith(
          _$NotionAuthStorageStateImpl value,
          $Res Function(_$NotionAuthStorageStateImpl) then) =
      __$$NotionAuthStorageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<NotionAuthState> notionAuthStorageState});
}

/// @nodoc
class __$$NotionAuthStorageStateImplCopyWithImpl<$Res>
    extends _$NotionAuthStorageStateCopyWithImpl<$Res,
        _$NotionAuthStorageStateImpl>
    implements _$$NotionAuthStorageStateImplCopyWith<$Res> {
  __$$NotionAuthStorageStateImplCopyWithImpl(
      _$NotionAuthStorageStateImpl _value,
      $Res Function(_$NotionAuthStorageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notionAuthStorageState = null,
  }) {
    return _then(_$NotionAuthStorageStateImpl(
      notionAuthStorageState: null == notionAuthStorageState
          ? _value.notionAuthStorageState
          : notionAuthStorageState // ignore: cast_nullable_to_non_nullable
              as AsyncValue<NotionAuthState>,
    ));
  }
}

/// @nodoc

class _$NotionAuthStorageStateImpl implements _NotionAuthStorageState {
  const _$NotionAuthStorageStateImpl({required this.notionAuthStorageState});

  @override
  final AsyncValue<NotionAuthState> notionAuthStorageState;

  @override
  String toString() {
    return 'NotionAuthStorageState(notionAuthStorageState: $notionAuthStorageState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotionAuthStorageStateImpl &&
            (identical(other.notionAuthStorageState, notionAuthStorageState) ||
                other.notionAuthStorageState == notionAuthStorageState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notionAuthStorageState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionAuthStorageStateImplCopyWith<_$NotionAuthStorageStateImpl>
      get copyWith => __$$NotionAuthStorageStateImplCopyWithImpl<
          _$NotionAuthStorageStateImpl>(this, _$identity);
}

abstract class _NotionAuthStorageState implements NotionAuthStorageState {
  const factory _NotionAuthStorageState(
          {required final AsyncValue<NotionAuthState> notionAuthStorageState}) =
      _$NotionAuthStorageStateImpl;

  @override
  AsyncValue<NotionAuthState> get notionAuthStorageState;
  @override
  @JsonKey(ignore: true)
  _$$NotionAuthStorageStateImplCopyWith<_$NotionAuthStorageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
