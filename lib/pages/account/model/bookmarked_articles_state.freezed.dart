// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmarked_articles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookmarkedArticlesState {
  AsyncValue<List<RssFeedArticle>> get articles =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookmarkedArticlesStateCopyWith<BookmarkedArticlesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkedArticlesStateCopyWith<$Res> {
  factory $BookmarkedArticlesStateCopyWith(BookmarkedArticlesState value,
          $Res Function(BookmarkedArticlesState) then) =
      _$BookmarkedArticlesStateCopyWithImpl<$Res, BookmarkedArticlesState>;
  @useResult
  $Res call({AsyncValue<List<RssFeedArticle>> articles});
}

/// @nodoc
class _$BookmarkedArticlesStateCopyWithImpl<$Res,
        $Val extends BookmarkedArticlesState>
    implements $BookmarkedArticlesStateCopyWith<$Res> {
  _$BookmarkedArticlesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RssFeedArticle>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookmarkedArticlesStateImplCopyWith<$Res>
    implements $BookmarkedArticlesStateCopyWith<$Res> {
  factory _$$BookmarkedArticlesStateImplCopyWith(
          _$BookmarkedArticlesStateImpl value,
          $Res Function(_$BookmarkedArticlesStateImpl) then) =
      __$$BookmarkedArticlesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<RssFeedArticle>> articles});
}

/// @nodoc
class __$$BookmarkedArticlesStateImplCopyWithImpl<$Res>
    extends _$BookmarkedArticlesStateCopyWithImpl<$Res,
        _$BookmarkedArticlesStateImpl>
    implements _$$BookmarkedArticlesStateImplCopyWith<$Res> {
  __$$BookmarkedArticlesStateImplCopyWithImpl(
      _$BookmarkedArticlesStateImpl _value,
      $Res Function(_$BookmarkedArticlesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? articles = null,
  }) {
    return _then(_$BookmarkedArticlesStateImpl(
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<RssFeedArticle>>,
    ));
  }
}

/// @nodoc

class _$BookmarkedArticlesStateImpl implements _BookmarkedArticlesState {
  const _$BookmarkedArticlesStateImpl({required this.articles});

  @override
  final AsyncValue<List<RssFeedArticle>> articles;

  @override
  String toString() {
    return 'BookmarkedArticlesState(articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkedArticlesStateImpl &&
            (identical(other.articles, articles) ||
                other.articles == articles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, articles);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkedArticlesStateImplCopyWith<_$BookmarkedArticlesStateImpl>
      get copyWith => __$$BookmarkedArticlesStateImplCopyWithImpl<
          _$BookmarkedArticlesStateImpl>(this, _$identity);
}

abstract class _BookmarkedArticlesState implements BookmarkedArticlesState {
  const factory _BookmarkedArticlesState(
          {required final AsyncValue<List<RssFeedArticle>> articles}) =
      _$BookmarkedArticlesStateImpl;

  @override
  AsyncValue<List<RssFeedArticle>> get articles;
  @override
  @JsonKey(ignore: true)
  _$$BookmarkedArticlesStateImplCopyWith<_$BookmarkedArticlesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
