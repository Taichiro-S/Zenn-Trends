// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotionAuthState {
  bool get isAuth => throw _privateConstructorUsedError;
  String get botId => throw _privateConstructorUsedError;
  String? get duplicatedTemplateId =>
      throw _privateConstructorUsedError; // required NotionUser owner,
  String? get workspaceIcon => throw _privateConstructorUsedError;
  String get workspaceId => throw _privateConstructorUsedError;
  String? get workspaceName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotionAuthStateCopyWith<NotionAuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionAuthStateCopyWith<$Res> {
  factory $NotionAuthStateCopyWith(
          NotionAuthState value, $Res Function(NotionAuthState) then) =
      _$NotionAuthStateCopyWithImpl<$Res, NotionAuthState>;
  @useResult
  $Res call(
      {bool isAuth,
      String botId,
      String? duplicatedTemplateId,
      String? workspaceIcon,
      String workspaceId,
      String? workspaceName});
}

/// @nodoc
class _$NotionAuthStateCopyWithImpl<$Res, $Val extends NotionAuthState>
    implements $NotionAuthStateCopyWith<$Res> {
  _$NotionAuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuth = null,
    Object? botId = null,
    Object? duplicatedTemplateId = freezed,
    Object? workspaceIcon = freezed,
    Object? workspaceId = null,
    Object? workspaceName = freezed,
  }) {
    return _then(_value.copyWith(
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      botId: null == botId
          ? _value.botId
          : botId // ignore: cast_nullable_to_non_nullable
              as String,
      duplicatedTemplateId: freezed == duplicatedTemplateId
          ? _value.duplicatedTemplateId
          : duplicatedTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      workspaceIcon: freezed == workspaceIcon
          ? _value.workspaceIcon
          : workspaceIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceName: freezed == workspaceName
          ? _value.workspaceName
          : workspaceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotionAuthStateImplCopyWith<$Res>
    implements $NotionAuthStateCopyWith<$Res> {
  factory _$$NotionAuthStateImplCopyWith(_$NotionAuthStateImpl value,
          $Res Function(_$NotionAuthStateImpl) then) =
      __$$NotionAuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isAuth,
      String botId,
      String? duplicatedTemplateId,
      String? workspaceIcon,
      String workspaceId,
      String? workspaceName});
}

/// @nodoc
class __$$NotionAuthStateImplCopyWithImpl<$Res>
    extends _$NotionAuthStateCopyWithImpl<$Res, _$NotionAuthStateImpl>
    implements _$$NotionAuthStateImplCopyWith<$Res> {
  __$$NotionAuthStateImplCopyWithImpl(
      _$NotionAuthStateImpl _value, $Res Function(_$NotionAuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuth = null,
    Object? botId = null,
    Object? duplicatedTemplateId = freezed,
    Object? workspaceIcon = freezed,
    Object? workspaceId = null,
    Object? workspaceName = freezed,
  }) {
    return _then(_$NotionAuthStateImpl(
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      botId: null == botId
          ? _value.botId
          : botId // ignore: cast_nullable_to_non_nullable
              as String,
      duplicatedTemplateId: freezed == duplicatedTemplateId
          ? _value.duplicatedTemplateId
          : duplicatedTemplateId // ignore: cast_nullable_to_non_nullable
              as String?,
      workspaceIcon: freezed == workspaceIcon
          ? _value.workspaceIcon
          : workspaceIcon // ignore: cast_nullable_to_non_nullable
              as String?,
      workspaceId: null == workspaceId
          ? _value.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      workspaceName: freezed == workspaceName
          ? _value.workspaceName
          : workspaceName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotionAuthStateImpl implements _NotionAuthState {
  const _$NotionAuthStateImpl(
      {required this.isAuth,
      required this.botId,
      required this.duplicatedTemplateId,
      required this.workspaceIcon,
      required this.workspaceId,
      required this.workspaceName});

  @override
  final bool isAuth;
  @override
  final String botId;
  @override
  final String? duplicatedTemplateId;
// required NotionUser owner,
  @override
  final String? workspaceIcon;
  @override
  final String workspaceId;
  @override
  final String? workspaceName;

  @override
  String toString() {
    return 'NotionAuthState(isAuth: $isAuth, botId: $botId, duplicatedTemplateId: $duplicatedTemplateId, workspaceIcon: $workspaceIcon, workspaceId: $workspaceId, workspaceName: $workspaceName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotionAuthStateImpl &&
            (identical(other.isAuth, isAuth) || other.isAuth == isAuth) &&
            (identical(other.botId, botId) || other.botId == botId) &&
            (identical(other.duplicatedTemplateId, duplicatedTemplateId) ||
                other.duplicatedTemplateId == duplicatedTemplateId) &&
            (identical(other.workspaceIcon, workspaceIcon) ||
                other.workspaceIcon == workspaceIcon) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.workspaceName, workspaceName) ||
                other.workspaceName == workspaceName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuth, botId,
      duplicatedTemplateId, workspaceIcon, workspaceId, workspaceName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionAuthStateImplCopyWith<_$NotionAuthStateImpl> get copyWith =>
      __$$NotionAuthStateImplCopyWithImpl<_$NotionAuthStateImpl>(
          this, _$identity);
}

abstract class _NotionAuthState implements NotionAuthState {
  const factory _NotionAuthState(
      {required final bool isAuth,
      required final String botId,
      required final String? duplicatedTemplateId,
      required final String? workspaceIcon,
      required final String workspaceId,
      required final String? workspaceName}) = _$NotionAuthStateImpl;

  @override
  bool get isAuth;
  @override
  String get botId;
  @override
  String? get duplicatedTemplateId;
  @override // required NotionUser owner,
  String? get workspaceIcon;
  @override
  String get workspaceId;
  @override
  String? get workspaceName;
  @override
  @JsonKey(ignore: true)
  _$$NotionAuthStateImplCopyWith<_$NotionAuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
