// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rss_feed_article.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RssFeedArticle {
  String get title => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  DateTime get publishedDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get creator => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  String? get enclosure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RssFeedArticleCopyWith<RssFeedArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RssFeedArticleCopyWith<$Res> {
  factory $RssFeedArticleCopyWith(
          RssFeedArticle value, $Res Function(RssFeedArticle) then) =
      _$RssFeedArticleCopyWithImpl<$Res, RssFeedArticle>;
  @useResult
  $Res call(
      {String title,
      String link,
      DateTime publishedDate,
      String description,
      String creator,
      String slug,
      String? enclosure});
}

/// @nodoc
class _$RssFeedArticleCopyWithImpl<$Res, $Val extends RssFeedArticle>
    implements $RssFeedArticleCopyWith<$Res> {
  _$RssFeedArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
    Object? publishedDate = null,
    Object? description = null,
    Object? creator = null,
    Object? slug = null,
    Object? enclosure = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      enclosure: freezed == enclosure
          ? _value.enclosure
          : enclosure // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RssFeedArticleImplCopyWith<$Res>
    implements $RssFeedArticleCopyWith<$Res> {
  factory _$$RssFeedArticleImplCopyWith(_$RssFeedArticleImpl value,
          $Res Function(_$RssFeedArticleImpl) then) =
      __$$RssFeedArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String link,
      DateTime publishedDate,
      String description,
      String creator,
      String slug,
      String? enclosure});
}

/// @nodoc
class __$$RssFeedArticleImplCopyWithImpl<$Res>
    extends _$RssFeedArticleCopyWithImpl<$Res, _$RssFeedArticleImpl>
    implements _$$RssFeedArticleImplCopyWith<$Res> {
  __$$RssFeedArticleImplCopyWithImpl(
      _$RssFeedArticleImpl _value, $Res Function(_$RssFeedArticleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? link = null,
    Object? publishedDate = null,
    Object? description = null,
    Object? creator = null,
    Object? slug = null,
    Object? enclosure = freezed,
  }) {
    return _then(_$RssFeedArticleImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      publishedDate: null == publishedDate
          ? _value.publishedDate
          : publishedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creator: null == creator
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      enclosure: freezed == enclosure
          ? _value.enclosure
          : enclosure // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$RssFeedArticleImpl implements _RssFeedArticle {
  const _$RssFeedArticleImpl(
      {required this.title,
      required this.link,
      required this.publishedDate,
      required this.description,
      required this.creator,
      required this.slug,
      this.enclosure});

  @override
  final String title;
  @override
  final String link;
  @override
  final DateTime publishedDate;
  @override
  final String description;
  @override
  final String creator;
  @override
  final String slug;
  @override
  final String? enclosure;

  @override
  String toString() {
    return 'RssFeedArticle(title: $title, link: $link, publishedDate: $publishedDate, description: $description, creator: $creator, slug: $slug, enclosure: $enclosure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RssFeedArticleImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.publishedDate, publishedDate) ||
                other.publishedDate == publishedDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.creator, creator) || other.creator == creator) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.enclosure, enclosure) ||
                other.enclosure == enclosure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, link, publishedDate,
      description, creator, slug, enclosure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RssFeedArticleImplCopyWith<_$RssFeedArticleImpl> get copyWith =>
      __$$RssFeedArticleImplCopyWithImpl<_$RssFeedArticleImpl>(
          this, _$identity);
}

abstract class _RssFeedArticle implements RssFeedArticle {
  const factory _RssFeedArticle(
      {required final String title,
      required final String link,
      required final DateTime publishedDate,
      required final String description,
      required final String creator,
      required final String slug,
      final String? enclosure}) = _$RssFeedArticleImpl;

  @override
  String get title;
  @override
  String get link;
  @override
  DateTime get publishedDate;
  @override
  String get description;
  @override
  String get creator;
  @override
  String get slug;
  @override
  String? get enclosure;
  @override
  @JsonKey(ignore: true)
  _$$RssFeedArticleImplCopyWith<_$RssFeedArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
