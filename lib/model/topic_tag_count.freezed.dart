// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_tag_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopicTagCount {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get rank => throw _privateConstructorUsedError;
  int get taggingsCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopicTagCountCopyWith<TopicTagCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicTagCountCopyWith<$Res> {
  factory $TopicTagCountCopyWith(
          TopicTagCount value, $Res Function(TopicTagCount) then) =
      _$TopicTagCountCopyWithImpl<$Res, TopicTagCount>;
  @useResult
  $Res call({String id, DateTime date, String rank, int taggingsCount});
}

/// @nodoc
class _$TopicTagCountCopyWithImpl<$Res, $Val extends TopicTagCount>
    implements $TopicTagCountCopyWith<$Res> {
  _$TopicTagCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? rank = null,
    Object? taggingsCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      taggingsCount: null == taggingsCount
          ? _value.taggingsCount
          : taggingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicTagCountImplCopyWith<$Res>
    implements $TopicTagCountCopyWith<$Res> {
  factory _$$TopicTagCountImplCopyWith(
          _$TopicTagCountImpl value, $Res Function(_$TopicTagCountImpl) then) =
      __$$TopicTagCountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime date, String rank, int taggingsCount});
}

/// @nodoc
class __$$TopicTagCountImplCopyWithImpl<$Res>
    extends _$TopicTagCountCopyWithImpl<$Res, _$TopicTagCountImpl>
    implements _$$TopicTagCountImplCopyWith<$Res> {
  __$$TopicTagCountImplCopyWithImpl(
      _$TopicTagCountImpl _value, $Res Function(_$TopicTagCountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? rank = null,
    Object? taggingsCount = null,
  }) {
    return _then(_$TopicTagCountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as String,
      taggingsCount: null == taggingsCount
          ? _value.taggingsCount
          : taggingsCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TopicTagCountImpl
    with DiagnosticableTreeMixin
    implements _TopicTagCount {
  const _$TopicTagCountImpl(
      {required this.id,
      required this.date,
      required this.rank,
      required this.taggingsCount});

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String rank;
  @override
  final int taggingsCount;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopicTagCount(id: $id, date: $date, rank: $rank, taggingsCount: $taggingsCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopicTagCount'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('rank', rank))
      ..add(DiagnosticsProperty('taggingsCount', taggingsCount));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicTagCountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.taggingsCount, taggingsCount) ||
                other.taggingsCount == taggingsCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, date, rank, taggingsCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicTagCountImplCopyWith<_$TopicTagCountImpl> get copyWith =>
      __$$TopicTagCountImplCopyWithImpl<_$TopicTagCountImpl>(this, _$identity);
}

abstract class _TopicTagCount implements TopicTagCount {
  const factory _TopicTagCount(
      {required final String id,
      required final DateTime date,
      required final String rank,
      required final int taggingsCount}) = _$TopicTagCountImpl;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get rank;
  @override
  int get taggingsCount;
  @override
  @JsonKey(ignore: true)
  _$$TopicTagCountImplCopyWith<_$TopicTagCountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
