// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'taggings_count_change_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaggingsCountChangeHistory {
  DateTime get date => throw _privateConstructorUsedError;
  int get change => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaggingsCountChangeHistoryCopyWith<TaggingsCountChangeHistory>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaggingsCountChangeHistoryCopyWith<$Res> {
  factory $TaggingsCountChangeHistoryCopyWith(TaggingsCountChangeHistory value,
          $Res Function(TaggingsCountChangeHistory) then) =
      _$TaggingsCountChangeHistoryCopyWithImpl<$Res,
          TaggingsCountChangeHistory>;
  @useResult
  $Res call({DateTime date, int change});
}

/// @nodoc
class _$TaggingsCountChangeHistoryCopyWithImpl<$Res,
        $Val extends TaggingsCountChangeHistory>
    implements $TaggingsCountChangeHistoryCopyWith<$Res> {
  _$TaggingsCountChangeHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? change = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaggingsCountChangeHistoryImplCopyWith<$Res>
    implements $TaggingsCountChangeHistoryCopyWith<$Res> {
  factory _$$TaggingsCountChangeHistoryImplCopyWith(
          _$TaggingsCountChangeHistoryImpl value,
          $Res Function(_$TaggingsCountChangeHistoryImpl) then) =
      __$$TaggingsCountChangeHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, int change});
}

/// @nodoc
class __$$TaggingsCountChangeHistoryImplCopyWithImpl<$Res>
    extends _$TaggingsCountChangeHistoryCopyWithImpl<$Res,
        _$TaggingsCountChangeHistoryImpl>
    implements _$$TaggingsCountChangeHistoryImplCopyWith<$Res> {
  __$$TaggingsCountChangeHistoryImplCopyWithImpl(
      _$TaggingsCountChangeHistoryImpl _value,
      $Res Function(_$TaggingsCountChangeHistoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? change = null,
  }) {
    return _then(_$TaggingsCountChangeHistoryImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TaggingsCountChangeHistoryImpl
    with DiagnosticableTreeMixin
    implements _TaggingsCountChangeHistory {
  const _$TaggingsCountChangeHistoryImpl(
      {required this.date, required this.change});

  @override
  final DateTime date;
  @override
  final int change;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TaggingsCountChangeHistory(date: $date, change: $change)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TaggingsCountChangeHistory'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('change', change));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaggingsCountChangeHistoryImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.change, change) || other.change == change));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, change);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaggingsCountChangeHistoryImplCopyWith<_$TaggingsCountChangeHistoryImpl>
      get copyWith => __$$TaggingsCountChangeHistoryImplCopyWithImpl<
          _$TaggingsCountChangeHistoryImpl>(this, _$identity);
}

abstract class _TaggingsCountChangeHistory
    implements TaggingsCountChangeHistory {
  const factory _TaggingsCountChangeHistory(
      {required final DateTime date,
      required final int change}) = _$TaggingsCountChangeHistoryImpl;

  @override
  DateTime get date;
  @override
  int get change;
  @override
  @JsonKey(ignore: true)
  _$$TaggingsCountChangeHistoryImplCopyWith<_$TaggingsCountChangeHistoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
