// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'webview_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WebViewState {
  bool get isOpen => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WebViewStateCopyWith<WebViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WebViewStateCopyWith<$Res> {
  factory $WebViewStateCopyWith(
          WebViewState value, $Res Function(WebViewState) then) =
      _$WebViewStateCopyWithImpl<$Res, WebViewState>;
  @useResult
  $Res call({bool isOpen, bool isLoading, bool isError, String errorText});
}

/// @nodoc
class _$WebViewStateCopyWithImpl<$Res, $Val extends WebViewState>
    implements $WebViewStateCopyWith<$Res> {
  _$WebViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? errorText = null,
  }) {
    return _then(_value.copyWith(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WebViewStateImplCopyWith<$Res>
    implements $WebViewStateCopyWith<$Res> {
  factory _$$WebViewStateImplCopyWith(
          _$WebViewStateImpl value, $Res Function(_$WebViewStateImpl) then) =
      __$$WebViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOpen, bool isLoading, bool isError, String errorText});
}

/// @nodoc
class __$$WebViewStateImplCopyWithImpl<$Res>
    extends _$WebViewStateCopyWithImpl<$Res, _$WebViewStateImpl>
    implements _$$WebViewStateImplCopyWith<$Res> {
  __$$WebViewStateImplCopyWithImpl(
      _$WebViewStateImpl _value, $Res Function(_$WebViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? errorText = null,
  }) {
    return _then(_$WebViewStateImpl(
      isOpen: null == isOpen
          ? _value.isOpen
          : isOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: null == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$WebViewStateImpl implements _WebViewState {
  const _$WebViewStateImpl(
      {required this.isOpen,
      required this.isLoading,
      required this.isError,
      required this.errorText});

  @override
  final bool isOpen;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String errorText;

  @override
  String toString() {
    return 'WebViewState(isOpen: $isOpen, isLoading: $isLoading, isError: $isError, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WebViewStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isOpen, isLoading, isError, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WebViewStateImplCopyWith<_$WebViewStateImpl> get copyWith =>
      __$$WebViewStateImplCopyWithImpl<_$WebViewStateImpl>(this, _$identity);
}

abstract class _WebViewState implements WebViewState {
  const factory _WebViewState(
      {required final bool isOpen,
      required final bool isLoading,
      required final bool isError,
      required final String errorText}) = _$WebViewStateImpl;

  @override
  bool get isOpen;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get errorText;
  @override
  @JsonKey(ignore: true)
  _$$WebViewStateImplCopyWith<_$WebViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
