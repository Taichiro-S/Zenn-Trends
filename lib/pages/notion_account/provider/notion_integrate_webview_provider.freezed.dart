// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notion_integrate_webview_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotionIntegrateWebViewState {
  bool get isOpen => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorText => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotionIntegrateWebViewStateCopyWith<NotionIntegrateWebViewState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotionIntegrateWebViewStateCopyWith<$Res> {
  factory $NotionIntegrateWebViewStateCopyWith(
          NotionIntegrateWebViewState value,
          $Res Function(NotionIntegrateWebViewState) then) =
      _$NotionIntegrateWebViewStateCopyWithImpl<$Res,
          NotionIntegrateWebViewState>;
  @useResult
  $Res call(
      {bool isOpen,
      bool isLoading,
      bool isError,
      String errorText,
      double progress});
}

/// @nodoc
class _$NotionIntegrateWebViewStateCopyWithImpl<$Res,
        $Val extends NotionIntegrateWebViewState>
    implements $NotionIntegrateWebViewStateCopyWith<$Res> {
  _$NotionIntegrateWebViewStateCopyWithImpl(this._value, this._then);

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
    Object? progress = null,
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
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotionIntegrateWebViewStateImplCopyWith<$Res>
    implements $NotionIntegrateWebViewStateCopyWith<$Res> {
  factory _$$NotionIntegrateWebViewStateImplCopyWith(
          _$NotionIntegrateWebViewStateImpl value,
          $Res Function(_$NotionIntegrateWebViewStateImpl) then) =
      __$$NotionIntegrateWebViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isOpen,
      bool isLoading,
      bool isError,
      String errorText,
      double progress});
}

/// @nodoc
class __$$NotionIntegrateWebViewStateImplCopyWithImpl<$Res>
    extends _$NotionIntegrateWebViewStateCopyWithImpl<$Res,
        _$NotionIntegrateWebViewStateImpl>
    implements _$$NotionIntegrateWebViewStateImplCopyWith<$Res> {
  __$$NotionIntegrateWebViewStateImplCopyWithImpl(
      _$NotionIntegrateWebViewStateImpl _value,
      $Res Function(_$NotionIntegrateWebViewStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOpen = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? errorText = null,
    Object? progress = null,
  }) {
    return _then(_$NotionIntegrateWebViewStateImpl(
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
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$NotionIntegrateWebViewStateImpl
    implements _NotionIntegrateWebViewState {
  const _$NotionIntegrateWebViewStateImpl(
      {required this.isOpen,
      required this.isLoading,
      required this.isError,
      required this.errorText,
      required this.progress});

  @override
  final bool isOpen;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String errorText;
  @override
  final double progress;

  @override
  String toString() {
    return 'NotionIntegrateWebViewState(isOpen: $isOpen, isLoading: $isLoading, isError: $isError, errorText: $errorText, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotionIntegrateWebViewStateImpl &&
            (identical(other.isOpen, isOpen) || other.isOpen == isOpen) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isOpen, isLoading, isError, errorText, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotionIntegrateWebViewStateImplCopyWith<_$NotionIntegrateWebViewStateImpl>
      get copyWith => __$$NotionIntegrateWebViewStateImplCopyWithImpl<
          _$NotionIntegrateWebViewStateImpl>(this, _$identity);
}

abstract class _NotionIntegrateWebViewState
    implements NotionIntegrateWebViewState {
  const factory _NotionIntegrateWebViewState(
      {required final bool isOpen,
      required final bool isLoading,
      required final bool isError,
      required final String errorText,
      required final double progress}) = _$NotionIntegrateWebViewStateImpl;

  @override
  bool get isOpen;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get errorText;
  @override
  double get progress;
  @override
  @JsonKey(ignore: true)
  _$$NotionIntegrateWebViewStateImplCopyWith<_$NotionIntegrateWebViewStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
