// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TagHistoryState {
  Timestamp get date => throw _privateConstructorUsedError;
  int get change => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TagHistoryStateCopyWith<TagHistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TagHistoryStateCopyWith<$Res> {
  factory $TagHistoryStateCopyWith(
          TagHistoryState value, $Res Function(TagHistoryState) then) =
      _$TagHistoryStateCopyWithImpl<$Res, TagHistoryState>;
  @useResult
  $Res call({Timestamp date, int change});
}

/// @nodoc
class _$TagHistoryStateCopyWithImpl<$Res, $Val extends TagHistoryState>
    implements $TagHistoryStateCopyWith<$Res> {
  _$TagHistoryStateCopyWithImpl(this._value, this._then);

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
              as Timestamp,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TagHistoryStateImplCopyWith<$Res>
    implements $TagHistoryStateCopyWith<$Res> {
  factory _$$TagHistoryStateImplCopyWith(_$TagHistoryStateImpl value,
          $Res Function(_$TagHistoryStateImpl) then) =
      __$$TagHistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Timestamp date, int change});
}

/// @nodoc
class __$$TagHistoryStateImplCopyWithImpl<$Res>
    extends _$TagHistoryStateCopyWithImpl<$Res, _$TagHistoryStateImpl>
    implements _$$TagHistoryStateImplCopyWith<$Res> {
  __$$TagHistoryStateImplCopyWithImpl(
      _$TagHistoryStateImpl _value, $Res Function(_$TagHistoryStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? change = null,
  }) {
    return _then(_$TagHistoryStateImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      change: null == change
          ? _value.change
          : change // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TagHistoryStateImpl
    with DiagnosticableTreeMixin
    implements _TagHistoryState {
  const _$TagHistoryStateImpl({required this.date, required this.change});

  @override
  final Timestamp date;
  @override
  final int change;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TagHistoryState(date: $date, change: $change)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TagHistoryState'))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('change', change));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TagHistoryStateImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.change, change) || other.change == change));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date, change);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TagHistoryStateImplCopyWith<_$TagHistoryStateImpl> get copyWith =>
      __$$TagHistoryStateImplCopyWithImpl<_$TagHistoryStateImpl>(
          this, _$identity);
}

abstract class _TagHistoryState implements TagHistoryState {
  const factory _TagHistoryState(
      {required final Timestamp date,
      required final int change}) = _$TagHistoryStateImpl;

  @override
  Timestamp get date;
  @override
  int get change;
  @override
  @JsonKey(ignore: true)
  _$$TagHistoryStateImplCopyWith<_$TagHistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
