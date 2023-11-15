// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_topics_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchTopicsState {
  String? get searchWord => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchTopicsStateCopyWith<SearchTopicsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTopicsStateCopyWith<$Res> {
  factory $SearchTopicsStateCopyWith(
          SearchTopicsState value, $Res Function(SearchTopicsState) then) =
      _$SearchTopicsStateCopyWithImpl<$Res, SearchTopicsState>;
  @useResult
  $Res call({String? searchWord, bool isSearching});
}

/// @nodoc
class _$SearchTopicsStateCopyWithImpl<$Res, $Val extends SearchTopicsState>
    implements $SearchTopicsStateCopyWith<$Res> {
  _$SearchTopicsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchWord = freezed,
    Object? isSearching = null,
  }) {
    return _then(_value.copyWith(
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchTopicsStateImplCopyWith<$Res>
    implements $SearchTopicsStateCopyWith<$Res> {
  factory _$$SearchTopicsStateImplCopyWith(_$SearchTopicsStateImpl value,
          $Res Function(_$SearchTopicsStateImpl) then) =
      __$$SearchTopicsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? searchWord, bool isSearching});
}

/// @nodoc
class __$$SearchTopicsStateImplCopyWithImpl<$Res>
    extends _$SearchTopicsStateCopyWithImpl<$Res, _$SearchTopicsStateImpl>
    implements _$$SearchTopicsStateImplCopyWith<$Res> {
  __$$SearchTopicsStateImplCopyWithImpl(_$SearchTopicsStateImpl _value,
      $Res Function(_$SearchTopicsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchWord = freezed,
    Object? isSearching = null,
  }) {
    return _then(_$SearchTopicsStateImpl(
      searchWord: freezed == searchWord
          ? _value.searchWord
          : searchWord // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchTopicsStateImpl implements _SearchTopicsState {
  const _$SearchTopicsStateImpl({this.searchWord, required this.isSearching});

  @override
  final String? searchWord;
  @override
  final bool isSearching;

  @override
  String toString() {
    return 'SearchTopicsState(searchWord: $searchWord, isSearching: $isSearching)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchTopicsStateImpl &&
            (identical(other.searchWord, searchWord) ||
                other.searchWord == searchWord) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchWord, isSearching);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchTopicsStateImplCopyWith<_$SearchTopicsStateImpl> get copyWith =>
      __$$SearchTopicsStateImplCopyWithImpl<_$SearchTopicsStateImpl>(
          this, _$identity);
}

abstract class _SearchTopicsState implements SearchTopicsState {
  const factory _SearchTopicsState(
      {final String? searchWord,
      required final bool isSearching}) = _$SearchTopicsStateImpl;

  @override
  String? get searchWord;
  @override
  bool get isSearching;
  @override
  @JsonKey(ignore: true)
  _$$SearchTopicsStateImplCopyWith<_$SearchTopicsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
