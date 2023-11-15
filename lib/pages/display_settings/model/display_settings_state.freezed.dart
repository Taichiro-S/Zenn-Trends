// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'display_settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DisplaySettingsState {
  Collection get timePeriod => throw _privateConstructorUsedError;
  RankedTagsSortOrder get sortOrder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DisplaySettingsStateCopyWith<DisplaySettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DisplaySettingsStateCopyWith<$Res> {
  factory $DisplaySettingsStateCopyWith(DisplaySettingsState value,
          $Res Function(DisplaySettingsState) then) =
      _$DisplaySettingsStateCopyWithImpl<$Res, DisplaySettingsState>;
  @useResult
  $Res call({Collection timePeriod, RankedTagsSortOrder sortOrder});
}

/// @nodoc
class _$DisplaySettingsStateCopyWithImpl<$Res,
        $Val extends DisplaySettingsState>
    implements $DisplaySettingsStateCopyWith<$Res> {
  _$DisplaySettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timePeriod = null,
    Object? sortOrder = null,
  }) {
    return _then(_value.copyWith(
      timePeriod: null == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as Collection,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as RankedTagsSortOrder,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DisplaySettingsStateImplCopyWith<$Res>
    implements $DisplaySettingsStateCopyWith<$Res> {
  factory _$$DisplaySettingsStateImplCopyWith(_$DisplaySettingsStateImpl value,
          $Res Function(_$DisplaySettingsStateImpl) then) =
      __$$DisplaySettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Collection timePeriod, RankedTagsSortOrder sortOrder});
}

/// @nodoc
class __$$DisplaySettingsStateImplCopyWithImpl<$Res>
    extends _$DisplaySettingsStateCopyWithImpl<$Res, _$DisplaySettingsStateImpl>
    implements _$$DisplaySettingsStateImplCopyWith<$Res> {
  __$$DisplaySettingsStateImplCopyWithImpl(_$DisplaySettingsStateImpl _value,
      $Res Function(_$DisplaySettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timePeriod = null,
    Object? sortOrder = null,
  }) {
    return _then(_$DisplaySettingsStateImpl(
      timePeriod: null == timePeriod
          ? _value.timePeriod
          : timePeriod // ignore: cast_nullable_to_non_nullable
              as Collection,
      sortOrder: null == sortOrder
          ? _value.sortOrder
          : sortOrder // ignore: cast_nullable_to_non_nullable
              as RankedTagsSortOrder,
    ));
  }
}

/// @nodoc

class _$DisplaySettingsStateImpl implements _DisplaySettingsState {
  const _$DisplaySettingsStateImpl(
      {required this.timePeriod, required this.sortOrder});

  @override
  final Collection timePeriod;
  @override
  final RankedTagsSortOrder sortOrder;

  @override
  String toString() {
    return 'DisplaySettingsState(timePeriod: $timePeriod, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DisplaySettingsStateImpl &&
            (identical(other.timePeriod, timePeriod) ||
                other.timePeriod == timePeriod) &&
            (identical(other.sortOrder, sortOrder) ||
                other.sortOrder == sortOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timePeriod, sortOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DisplaySettingsStateImplCopyWith<_$DisplaySettingsStateImpl>
      get copyWith =>
          __$$DisplaySettingsStateImplCopyWithImpl<_$DisplaySettingsStateImpl>(
              this, _$identity);
}

abstract class _DisplaySettingsState implements DisplaySettingsState {
  const factory _DisplaySettingsState(
          {required final Collection timePeriod,
          required final RankedTagsSortOrder sortOrder}) =
      _$DisplaySettingsStateImpl;

  @override
  Collection get timePeriod;
  @override
  RankedTagsSortOrder get sortOrder;
  @override
  @JsonKey(ignore: true)
  _$$DisplaySettingsStateImplCopyWith<_$DisplaySettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
