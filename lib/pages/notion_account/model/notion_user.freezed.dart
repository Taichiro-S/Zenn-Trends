// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotionUser _$NotionUserFromJson(Map<String, dynamic> json) {
  return _NotionUser.fromJson(json);
}

/// @nodoc
mixin _$NotionUser {
  String get object => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'avator_url')
  String? get avatorUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotionUserCopyWith<NotionUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionUserCopyWith<$Res> {
  factory $NotionUserCopyWith(
          NotionUser value, $Res Function(NotionUser) then) =
      _$NotionUserCopyWithImpl<$Res, NotionUser>;
  @useResult
  $Res call(
      {String object,
      String id,
      String? type,
      String? name,
      @JsonKey(name: 'avator_url') String? avatorUrl});
}

/// @nodoc
class _$NotionUserCopyWithImpl<$Res, $Val extends NotionUser>
    implements $NotionUserCopyWith<$Res> {
  _$NotionUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? id = null,
    Object? type = freezed,
    Object? name = freezed,
    Object? avatorUrl = freezed,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatorUrl: freezed == avatorUrl
          ? _value.avatorUrl
          : avatorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotionUserImplCopyWith<$Res>
    implements $NotionUserCopyWith<$Res> {
  factory _$$NotionUserImplCopyWith(
          _$NotionUserImpl value, $Res Function(_$NotionUserImpl) then) =
      __$$NotionUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String object,
      String id,
      String? type,
      String? name,
      @JsonKey(name: 'avator_url') String? avatorUrl});
}

/// @nodoc
class __$$NotionUserImplCopyWithImpl<$Res>
    extends _$NotionUserCopyWithImpl<$Res, _$NotionUserImpl>
    implements _$$NotionUserImplCopyWith<$Res> {
  __$$NotionUserImplCopyWithImpl(
      _$NotionUserImpl _value, $Res Function(_$NotionUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? id = null,
    Object? type = freezed,
    Object? name = freezed,
    Object? avatorUrl = freezed,
  }) {
    return _then(_$NotionUserImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      avatorUrl: freezed == avatorUrl
          ? _value.avatorUrl
          : avatorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotionUserImpl implements _NotionUser {
  const _$NotionUserImpl(
      {required this.object,
      required this.id,
      required this.type,
      required this.name,
      @JsonKey(name: 'avator_url') required this.avatorUrl});

  factory _$NotionUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotionUserImplFromJson(json);

  @override
  final String object;
  @override
  final String id;
  @override
  final String? type;
  @override
  final String? name;
  @override
  @JsonKey(name: 'avator_url')
  final String? avatorUrl;

  @override
  String toString() {
    return 'NotionUser(object: $object, id: $id, type: $type, name: $name, avatorUrl: $avatorUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotionUserImpl &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatorUrl, avatorUrl) ||
                other.avatorUrl == avatorUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, object, id, type, name, avatorUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionUserImplCopyWith<_$NotionUserImpl> get copyWith =>
      __$$NotionUserImplCopyWithImpl<_$NotionUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotionUserImplToJson(
      this,
    );
  }
}

abstract class _NotionUser implements NotionUser {
  const factory _NotionUser(
          {required final String object,
          required final String id,
          required final String? type,
          required final String? name,
          @JsonKey(name: 'avator_url') required final String? avatorUrl}) =
      _$NotionUserImpl;

  factory _NotionUser.fromJson(Map<String, dynamic> json) =
      _$NotionUserImpl.fromJson;

  @override
  String get object;
  @override
  String get id;
  @override
  String? get type;
  @override
  String? get name;
  @override
  @JsonKey(name: 'avator_url')
  String? get avatorUrl;
  @override
  @JsonKey(ignore: true)
  _$$NotionUserImplCopyWith<_$NotionUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
