// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'read_articles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReadArticlesState {
  AsyncValue<List<RssFeedArticle>> get articles =>
      throw _privateConstructorUsedError;
  AsyncValue<List<String>> get articleIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReadArticlesStateCopyWith<ReadArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadArticlesStateCopyWith<$Res> {
  factory $ReadArticlesStateCopyWith(
          ReadArticlesState value, $Res Function(ReadArticlesState) then) =
      _$ReadArticlesStateCopyWithImpl<$Res, ReadArticlesState>;
  @useResult
  $Res call(
      {AsyncValue<List<RssFeedArticle>> articles,
      AsyncValue<List<String>> articleIds});
}

/// @nodoc
class _$ReadArticlesStateCopyWithImpl<$Res, $Val extends ReadArticlesState>
    implements $ReadArticlesStateCopyWith<$Res> {
  _$ReadArticlesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? articleIds = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RssFeedArticle>>,
      articleIds: null == articleIds
          ? _value.articleIds
          : articleIds // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<String>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReadArticlesStateImplCopyWith<$Res>
    implements $ReadArticlesStateCopyWith<$Res> {
  factory _$$ReadArticlesStateImplCopyWith(_$ReadArticlesStateImpl value,
          $Res Function(_$ReadArticlesStateImpl) then) =
      __$$ReadArticlesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<RssFeedArticle>> articles,
      AsyncValue<List<String>> articleIds});
}

/// @nodoc
class __$$ReadArticlesStateImplCopyWithImpl<$Res>
    extends _$ReadArticlesStateCopyWithImpl<$Res, _$ReadArticlesStateImpl>
    implements _$$ReadArticlesStateImplCopyWith<$Res> {
  __$$ReadArticlesStateImplCopyWithImpl(_$ReadArticlesStateImpl _value,
      $Res Function(_$ReadArticlesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
    Object? articleIds = null,
  }) {
    return _then(_$ReadArticlesStateImpl(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RssFeedArticle>>,
      articleIds: null == articleIds
          ? _value.articleIds
          : articleIds // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<String>>,
    ));
  }
}

/// @nodoc

class _$ReadArticlesStateImpl implements _ReadArticlesState {
  const _$ReadArticlesStateImpl(
      {required this.articles, required this.articleIds});

  @override
  final AsyncValue<List<RssFeedArticle>> articles;
  @override
  final AsyncValue<List<String>> articleIds;

  @override
  String toString() {
    return 'ReadArticlesState(articles: $articles, articleIds: $articleIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReadArticlesStateImpl &&
            (identical(other.articles, articles) ||
                other.articles == articles) &&
            (identical(other.articleIds, articleIds) ||
                other.articleIds == articleIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articles, articleIds);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReadArticlesStateImplCopyWith<_$ReadArticlesStateImpl> get copyWith =>
      __$$ReadArticlesStateImplCopyWithImpl<_$ReadArticlesStateImpl>(
          this, _$identity);
}

abstract class _ReadArticlesState implements ReadArticlesState {
  const factory _ReadArticlesState(
          {required final AsyncValue<List<RssFeedArticle>> articles,
          required final AsyncValue<List<String>> articleIds}) =
      _$ReadArticlesStateImpl;

  @override
  AsyncValue<List<RssFeedArticle>> get articles;
  @override
  AsyncValue<List<String>> get articleIds;
  @override
  @JsonKey(ignore: true)
  _$$ReadArticlesStateImplCopyWith<_$ReadArticlesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
