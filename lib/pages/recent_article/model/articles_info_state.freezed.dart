// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticlesInfoState {
  AsyncValue<List<ArticlesInfo>> get articlesInfo =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticlesInfoStateCopyWith<ArticlesInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoStateCopyWith<$Res> {
  factory $ArticlesInfoStateCopyWith(
          ArticlesInfoState value, $Res Function(ArticlesInfoState) then) =
      _$ArticlesInfoStateCopyWithImpl<$Res, ArticlesInfoState>;
  @useResult
  $Res call({AsyncValue<List<ArticlesInfo>> articlesInfo});
}

/// @nodoc
class _$ArticlesInfoStateCopyWithImpl<$Res, $Val extends ArticlesInfoState>
    implements $ArticlesInfoStateCopyWith<$Res> {
  _$ArticlesInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articlesInfo = null,
  }) {
    return _then(_value.copyWith(
      articlesInfo: null == articlesInfo
          ? _value.articlesInfo
          : articlesInfo // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ArticlesInfo>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticlesInfoStateImplCopyWith<$Res>
    implements $ArticlesInfoStateCopyWith<$Res> {
  factory _$$ArticlesInfoStateImplCopyWith(_$ArticlesInfoStateImpl value,
          $Res Function(_$ArticlesInfoStateImpl) then) =
      __$$ArticlesInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<ArticlesInfo>> articlesInfo});
}

/// @nodoc
class __$$ArticlesInfoStateImplCopyWithImpl<$Res>
    extends _$ArticlesInfoStateCopyWithImpl<$Res, _$ArticlesInfoStateImpl>
    implements _$$ArticlesInfoStateImplCopyWith<$Res> {
  __$$ArticlesInfoStateImplCopyWithImpl(_$ArticlesInfoStateImpl _value,
      $Res Function(_$ArticlesInfoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articlesInfo = null,
  }) {
    return _then(_$ArticlesInfoStateImpl(
      articlesInfo: null == articlesInfo
          ? _value.articlesInfo
          : articlesInfo // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ArticlesInfo>>,
    ));
  }
}

/// @nodoc

class _$ArticlesInfoStateImpl
    with DiagnosticableTreeMixin
    implements _ArticlesInfoState {
  const _$ArticlesInfoStateImpl({required this.articlesInfo});

  @override
  final AsyncValue<List<ArticlesInfo>> articlesInfo;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArticlesInfoState(articlesInfo: $articlesInfo)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArticlesInfoState'))
      ..add(DiagnosticsProperty('articlesInfo', articlesInfo));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesInfoStateImpl &&
            (identical(other.articlesInfo, articlesInfo) ||
                other.articlesInfo == articlesInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articlesInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesInfoStateImplCopyWith<_$ArticlesInfoStateImpl> get copyWith =>
      __$$ArticlesInfoStateImplCopyWithImpl<_$ArticlesInfoStateImpl>(
          this, _$identity);
}

abstract class _ArticlesInfoState implements ArticlesInfoState {
  const factory _ArticlesInfoState(
          {required final AsyncValue<List<ArticlesInfo>> articlesInfo}) =
      _$ArticlesInfoStateImpl;

  @override
  AsyncValue<List<ArticlesInfo>> get articlesInfo;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesInfoStateImplCopyWith<_$ArticlesInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
