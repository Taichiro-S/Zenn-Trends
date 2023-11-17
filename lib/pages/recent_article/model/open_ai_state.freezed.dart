// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OpenAiState {
  AsyncValue<String> get summary => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OpenAiStateCopyWith<OpenAiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAiStateCopyWith<$Res> {
  factory $OpenAiStateCopyWith(
          OpenAiState value, $Res Function(OpenAiState) then) =
      _$OpenAiStateCopyWithImpl<$Res, OpenAiState>;
  @useResult
  $Res call({AsyncValue<String> summary});
}

/// @nodoc
class _$OpenAiStateCopyWithImpl<$Res, $Val extends OpenAiState>
    implements $OpenAiStateCopyWith<$Res> {
  _$OpenAiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenAiStateImplCopyWith<$Res>
    implements $OpenAiStateCopyWith<$Res> {
  factory _$$OpenAiStateImplCopyWith(
          _$OpenAiStateImpl value, $Res Function(_$OpenAiStateImpl) then) =
      __$$OpenAiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<String> summary});
}

/// @nodoc
class __$$OpenAiStateImplCopyWithImpl<$Res>
    extends _$OpenAiStateCopyWithImpl<$Res, _$OpenAiStateImpl>
    implements _$$OpenAiStateImplCopyWith<$Res> {
  __$$OpenAiStateImplCopyWithImpl(
      _$OpenAiStateImpl _value, $Res Function(_$OpenAiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? summary = null,
  }) {
    return _then(_$OpenAiStateImpl(
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as AsyncValue<String>,
    ));
  }
}

/// @nodoc

class _$OpenAiStateImpl implements _OpenAiState {
  const _$OpenAiStateImpl({required this.summary});

  @override
  final AsyncValue<String> summary;

  @override
  String toString() {
    return 'OpenAiState(summary: $summary)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAiStateImpl &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @override
  int get hashCode => Object.hash(runtimeType, summary);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAiStateImplCopyWith<_$OpenAiStateImpl> get copyWith =>
      __$$OpenAiStateImplCopyWithImpl<_$OpenAiStateImpl>(this, _$identity);
}

abstract class _OpenAiState implements OpenAiState {
  const factory _OpenAiState({required final AsyncValue<String> summary}) =
      _$OpenAiStateImpl;

  @override
  AsyncValue<String> get summary;
  @override
  @JsonKey(ignore: true)
  _$$OpenAiStateImplCopyWith<_$OpenAiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
