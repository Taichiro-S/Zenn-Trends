// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopicInfo {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopicInfoCopyWith<TopicInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicInfoCopyWith<$Res> {
  factory $TopicInfoCopyWith(TopicInfo value, $Res Function(TopicInfo) then) =
      _$TopicInfoCopyWithImpl<$Res, TopicInfo>;
  @useResult
  $Res call({String id, String name, String displayName, String? imageUrl});
}

/// @nodoc
class _$TopicInfoCopyWithImpl<$Res, $Val extends TopicInfo>
    implements $TopicInfoCopyWith<$Res> {
  _$TopicInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicInfoImplCopyWith<$Res>
    implements $TopicInfoCopyWith<$Res> {
  factory _$$TopicInfoImplCopyWith(
          _$TopicInfoImpl value, $Res Function(_$TopicInfoImpl) then) =
      __$$TopicInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String displayName, String? imageUrl});
}

/// @nodoc
class __$$TopicInfoImplCopyWithImpl<$Res>
    extends _$TopicInfoCopyWithImpl<$Res, _$TopicInfoImpl>
    implements _$$TopicInfoImplCopyWith<$Res> {
  __$$TopicInfoImplCopyWithImpl(
      _$TopicInfoImpl _value, $Res Function(_$TopicInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$TopicInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TopicInfoImpl with DiagnosticableTreeMixin implements _TopicInfo {
  const _$TopicInfoImpl(
      {required this.id,
      required this.name,
      required this.displayName,
      this.imageUrl});

  @override
  final String id;
  @override
  final String name;
  @override
  final String displayName;
  @override
  final String? imageUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopicInfo(id: $id, name: $name, displayName: $displayName, imageUrl: $imageUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopicInfo'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('imageUrl', imageUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, displayName, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicInfoImplCopyWith<_$TopicInfoImpl> get copyWith =>
      __$$TopicInfoImplCopyWithImpl<_$TopicInfoImpl>(this, _$identity);
}

abstract class _TopicInfo implements TopicInfo {
  const factory _TopicInfo(
      {required final String id,
      required final String name,
      required final String displayName,
      final String? imageUrl}) = _$TopicInfoImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get displayName;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$TopicInfoImplCopyWith<_$TopicInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
