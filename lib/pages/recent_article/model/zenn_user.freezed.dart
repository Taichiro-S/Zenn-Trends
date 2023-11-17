// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zenn_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZennUser _$ZennUserFromJson(Map<String, dynamic> json) {
  return _ZennUser.fromJson(json);
}

/// @nodoc
mixin _$ZennUser {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  int? get totalLikedCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZennUserCopyWith<ZennUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZennUserCopyWith<$Res> {
  factory $ZennUserCopyWith(ZennUser value, $Res Function(ZennUser) then) =
      _$ZennUserCopyWithImpl<$Res, ZennUser>;
  @useResult
  $Res call(
      {int id,
      String username,
      String? name,
      String? avatarUrl,
      int? totalLikedCount});
}

/// @nodoc
class _$ZennUserCopyWithImpl<$Res, $Val extends ZennUser>
    implements $ZennUserCopyWith<$Res> {
  _$ZennUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? totalLikedCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLikedCount: freezed == totalLikedCount
          ? _value.totalLikedCount
          : totalLikedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZennUserImplCopyWith<$Res>
    implements $ZennUserCopyWith<$Res> {
  factory _$$ZennUserImplCopyWith(
          _$ZennUserImpl value, $Res Function(_$ZennUserImpl) then) =
      __$$ZennUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String? name,
      String? avatarUrl,
      int? totalLikedCount});
}

/// @nodoc
class __$$ZennUserImplCopyWithImpl<$Res>
    extends _$ZennUserCopyWithImpl<$Res, _$ZennUserImpl>
    implements _$$ZennUserImplCopyWith<$Res> {
  __$$ZennUserImplCopyWithImpl(
      _$ZennUserImpl _value, $Res Function(_$ZennUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? totalLikedCount = freezed,
  }) {
    return _then(_$ZennUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLikedCount: freezed == totalLikedCount
          ? _value.totalLikedCount
          : totalLikedCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZennUserImpl implements _ZennUser {
  const _$ZennUserImpl(
      {required this.id,
      required this.username,
      required this.name,
      required this.avatarUrl,
      required this.totalLikedCount});

  factory _$ZennUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZennUserImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String? name;
  @override
  final String? avatarUrl;
  @override
  final int? totalLikedCount;

  @override
  String toString() {
    return 'ZennUser(id: $id, username: $username, name: $name, avatarUrl: $avatarUrl, totalLikedCount: $totalLikedCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZennUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.totalLikedCount, totalLikedCount) ||
                other.totalLikedCount == totalLikedCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, name, avatarUrl, totalLikedCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZennUserImplCopyWith<_$ZennUserImpl> get copyWith =>
      __$$ZennUserImplCopyWithImpl<_$ZennUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZennUserImplToJson(
      this,
    );
  }
}

abstract class _ZennUser implements ZennUser {
  const factory _ZennUser(
      {required final int id,
      required final String username,
      required final String? name,
      required final String? avatarUrl,
      required final int? totalLikedCount}) = _$ZennUserImpl;

  factory _ZennUser.fromJson(Map<String, dynamic> json) =
      _$ZennUserImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String? get name;
  @override
  String? get avatarUrl;
  @override
  int? get totalLikedCount;
  @override
  @JsonKey(ignore: true)
  _$$ZennUserImplCopyWith<_$ZennUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
