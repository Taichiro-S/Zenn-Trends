// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trend_topic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TrendTopic {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Timestamp get updatedAt => throw _privateConstructorUsedError;
  int get taggingsCount => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendTopicCopyWith<TrendTopic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendTopicCopyWith<$Res> {
  factory $TrendTopicCopyWith(
          TrendTopic value, $Res Function(TrendTopic) then) =
      _$TrendTopicCopyWithImpl<$Res, TrendTopic>;
  @useResult
  $Res call(
      {String name,
      String id,
      Timestamp updatedAt,
      int taggingsCount,
      String displayName,
      String? imageUrl});
}

/// @nodoc
class _$TrendTopicCopyWithImpl<$Res, $Val extends TrendTopic>
    implements $TrendTopicCopyWith<$Res> {
  _$TrendTopicCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? updatedAt = null,
    Object? taggingsCount = null,
    Object? displayName = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      taggingsCount: null == taggingsCount
          ? _value.taggingsCount
          : taggingsCount // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$TrendTopicImplCopyWith<$Res>
    implements $TrendTopicCopyWith<$Res> {
  factory _$$TrendTopicImplCopyWith(
          _$TrendTopicImpl value, $Res Function(_$TrendTopicImpl) then) =
      __$$TrendTopicImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String id,
      Timestamp updatedAt,
      int taggingsCount,
      String displayName,
      String? imageUrl});
}

/// @nodoc
class __$$TrendTopicImplCopyWithImpl<$Res>
    extends _$TrendTopicCopyWithImpl<$Res, _$TrendTopicImpl>
    implements _$$TrendTopicImplCopyWith<$Res> {
  __$$TrendTopicImplCopyWithImpl(
      _$TrendTopicImpl _value, $Res Function(_$TrendTopicImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? updatedAt = null,
    Object? taggingsCount = null,
    Object? displayName = null,
    Object? imageUrl = freezed,
  }) {
    return _then(_$TrendTopicImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      taggingsCount: null == taggingsCount
          ? _value.taggingsCount
          : taggingsCount // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$TrendTopicImpl implements _TrendTopic {
  const _$TrendTopicImpl(
      {required this.name,
      required this.id,
      required this.updatedAt,
      required this.taggingsCount,
      required this.displayName,
      this.imageUrl});

  @override
  final String name;
  @override
  final String id;
  @override
  final Timestamp updatedAt;
  @override
  final int taggingsCount;
  @override
  final String displayName;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'TrendTopic(name: $name, id: $id, updatedAt: $updatedAt, taggingsCount: $taggingsCount, displayName: $displayName, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendTopicImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.taggingsCount, taggingsCount) ||
                other.taggingsCount == taggingsCount) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, id, updatedAt, taggingsCount, displayName, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendTopicImplCopyWith<_$TrendTopicImpl> get copyWith =>
      __$$TrendTopicImplCopyWithImpl<_$TrendTopicImpl>(this, _$identity);
}

abstract class _TrendTopic implements TrendTopic {
  const factory _TrendTopic(
      {required final String name,
      required final String id,
      required final Timestamp updatedAt,
      required final int taggingsCount,
      required final String displayName,
      final String? imageUrl}) = _$TrendTopicImpl;

  @override
  String get name;
  @override
  String get id;
  @override
  Timestamp get updatedAt;
  @override
  int get taggingsCount;
  @override
  String get displayName;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$TrendTopicImplCopyWith<_$TrendTopicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
