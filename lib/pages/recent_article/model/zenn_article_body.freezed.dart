// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zenn_article_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ZennArticleBody _$ZennArticleBodyFromJson(Map<String, dynamic> json) {
  return _ZennArticleBody.fromJson(json);
}

/// @nodoc
mixin _$ZennArticleBody {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_type')
  String? get postType => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments_count')
  int get commentsCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'liked_count')
  int get likedCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_letters_count')
  int get bodyLettersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'article_type')
  String? get articleType => throw _privateConstructorUsedError;
  String? get emoji => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_suspending_private')
  bool get isSuspendingPrivate => throw _privateConstructorUsedError;
  @JsonKey(name: 'published_at')
  String? get publishedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_updated_at')
  String? get bodyUpdatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'source_repo_updated_at')
  String? get sourceRepoUpdatedAt => throw _privateConstructorUsedError;
  bool get pinned => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'body_html')
  String get bodyHtml => throw _privateConstructorUsedError;
  Map<String, dynamic> get user => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get topics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ZennArticleBodyCopyWith<ZennArticleBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZennArticleBodyCopyWith<$Res> {
  factory $ZennArticleBodyCopyWith(
          ZennArticleBody value, $Res Function(ZennArticleBody) then) =
      _$ZennArticleBodyCopyWithImpl<$Res, ZennArticleBody>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'post_type') String? postType,
      String title,
      String slug,
      @JsonKey(name: 'comments_count') int commentsCount,
      @JsonKey(name: 'liked_count') int likedCount,
      @JsonKey(name: 'body_letters_count') int bodyLettersCount,
      @JsonKey(name: 'article_type') String? articleType,
      String? emoji,
      @JsonKey(name: 'is_suspending_private') bool isSuspendingPrivate,
      @JsonKey(name: 'published_at') String? publishedAt,
      @JsonKey(name: 'body_updated_at') String? bodyUpdatedAt,
      @JsonKey(name: 'source_repo_updated_at') String? sourceRepoUpdatedAt,
      bool pinned,
      String? path,
      @JsonKey(name: 'body_html') String bodyHtml,
      Map<String, dynamic> user,
      List<Map<String, dynamic>>? topics});
}

/// @nodoc
class _$ZennArticleBodyCopyWithImpl<$Res, $Val extends ZennArticleBody>
    implements $ZennArticleBodyCopyWith<$Res> {
  _$ZennArticleBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postType = freezed,
    Object? title = null,
    Object? slug = null,
    Object? commentsCount = null,
    Object? likedCount = null,
    Object? bodyLettersCount = null,
    Object? articleType = freezed,
    Object? emoji = freezed,
    Object? isSuspendingPrivate = null,
    Object? publishedAt = freezed,
    Object? bodyUpdatedAt = freezed,
    Object? sourceRepoUpdatedAt = freezed,
    Object? pinned = null,
    Object? path = freezed,
    Object? bodyHtml = null,
    Object? user = null,
    Object? topics = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postType: freezed == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: null == likedCount
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      bodyLettersCount: null == bodyLettersCount
          ? _value.bodyLettersCount
          : bodyLettersCount // ignore: cast_nullable_to_non_nullable
              as int,
      articleType: freezed == articleType
          ? _value.articleType
          : articleType // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuspendingPrivate: null == isSuspendingPrivate
          ? _value.isSuspendingPrivate
          : isSuspendingPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyUpdatedAt: freezed == bodyUpdatedAt
          ? _value.bodyUpdatedAt
          : bodyUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceRepoUpdatedAt: freezed == sourceRepoUpdatedAt
          ? _value.sourceRepoUpdatedAt
          : sourceRepoUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyHtml: null == bodyHtml
          ? _value.bodyHtml
          : bodyHtml // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      topics: freezed == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZennArticleBodyImplCopyWith<$Res>
    implements $ZennArticleBodyCopyWith<$Res> {
  factory _$$ZennArticleBodyImplCopyWith(_$ZennArticleBodyImpl value,
          $Res Function(_$ZennArticleBodyImpl) then) =
      __$$ZennArticleBodyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'post_type') String? postType,
      String title,
      String slug,
      @JsonKey(name: 'comments_count') int commentsCount,
      @JsonKey(name: 'liked_count') int likedCount,
      @JsonKey(name: 'body_letters_count') int bodyLettersCount,
      @JsonKey(name: 'article_type') String? articleType,
      String? emoji,
      @JsonKey(name: 'is_suspending_private') bool isSuspendingPrivate,
      @JsonKey(name: 'published_at') String? publishedAt,
      @JsonKey(name: 'body_updated_at') String? bodyUpdatedAt,
      @JsonKey(name: 'source_repo_updated_at') String? sourceRepoUpdatedAt,
      bool pinned,
      String? path,
      @JsonKey(name: 'body_html') String bodyHtml,
      Map<String, dynamic> user,
      List<Map<String, dynamic>>? topics});
}

/// @nodoc
class __$$ZennArticleBodyImplCopyWithImpl<$Res>
    extends _$ZennArticleBodyCopyWithImpl<$Res, _$ZennArticleBodyImpl>
    implements _$$ZennArticleBodyImplCopyWith<$Res> {
  __$$ZennArticleBodyImplCopyWithImpl(
      _$ZennArticleBodyImpl _value, $Res Function(_$ZennArticleBodyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postType = freezed,
    Object? title = null,
    Object? slug = null,
    Object? commentsCount = null,
    Object? likedCount = null,
    Object? bodyLettersCount = null,
    Object? articleType = freezed,
    Object? emoji = freezed,
    Object? isSuspendingPrivate = null,
    Object? publishedAt = freezed,
    Object? bodyUpdatedAt = freezed,
    Object? sourceRepoUpdatedAt = freezed,
    Object? pinned = null,
    Object? path = freezed,
    Object? bodyHtml = null,
    Object? user = null,
    Object? topics = freezed,
  }) {
    return _then(_$ZennArticleBodyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      postType: freezed == postType
          ? _value.postType
          : postType // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      commentsCount: null == commentsCount
          ? _value.commentsCount
          : commentsCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedCount: null == likedCount
          ? _value.likedCount
          : likedCount // ignore: cast_nullable_to_non_nullable
              as int,
      bodyLettersCount: null == bodyLettersCount
          ? _value.bodyLettersCount
          : bodyLettersCount // ignore: cast_nullable_to_non_nullable
              as int,
      articleType: freezed == articleType
          ? _value.articleType
          : articleType // ignore: cast_nullable_to_non_nullable
              as String?,
      emoji: freezed == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuspendingPrivate: null == isSuspendingPrivate
          ? _value.isSuspendingPrivate
          : isSuspendingPrivate // ignore: cast_nullable_to_non_nullable
              as bool,
      publishedAt: freezed == publishedAt
          ? _value.publishedAt
          : publishedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyUpdatedAt: freezed == bodyUpdatedAt
          ? _value.bodyUpdatedAt
          : bodyUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      sourceRepoUpdatedAt: freezed == sourceRepoUpdatedAt
          ? _value.sourceRepoUpdatedAt
          : sourceRepoUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      pinned: null == pinned
          ? _value.pinned
          : pinned // ignore: cast_nullable_to_non_nullable
              as bool,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyHtml: null == bodyHtml
          ? _value.bodyHtml
          : bodyHtml // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      topics: freezed == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ZennArticleBodyImpl implements _ZennArticleBody {
  const _$ZennArticleBodyImpl(
      {required this.id,
      @JsonKey(name: 'post_type') required this.postType,
      required this.title,
      required this.slug,
      @JsonKey(name: 'comments_count') required this.commentsCount,
      @JsonKey(name: 'liked_count') required this.likedCount,
      @JsonKey(name: 'body_letters_count') required this.bodyLettersCount,
      @JsonKey(name: 'article_type') required this.articleType,
      required this.emoji,
      @JsonKey(name: 'is_suspending_private') required this.isSuspendingPrivate,
      @JsonKey(name: 'published_at') required this.publishedAt,
      @JsonKey(name: 'body_updated_at') required this.bodyUpdatedAt,
      @JsonKey(name: 'source_repo_updated_at')
      required this.sourceRepoUpdatedAt,
      required this.pinned,
      required this.path,
      @JsonKey(name: 'body_html') required this.bodyHtml,
      required final Map<String, dynamic> user,
      required final List<Map<String, dynamic>>? topics})
      : _user = user,
        _topics = topics;

  factory _$ZennArticleBodyImpl.fromJson(Map<String, dynamic> json) =>
      _$$ZennArticleBodyImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'post_type')
  final String? postType;
  @override
  final String title;
  @override
  final String slug;
  @override
  @JsonKey(name: 'comments_count')
  final int commentsCount;
  @override
  @JsonKey(name: 'liked_count')
  final int likedCount;
  @override
  @JsonKey(name: 'body_letters_count')
  final int bodyLettersCount;
  @override
  @JsonKey(name: 'article_type')
  final String? articleType;
  @override
  final String? emoji;
  @override
  @JsonKey(name: 'is_suspending_private')
  final bool isSuspendingPrivate;
  @override
  @JsonKey(name: 'published_at')
  final String? publishedAt;
  @override
  @JsonKey(name: 'body_updated_at')
  final String? bodyUpdatedAt;
  @override
  @JsonKey(name: 'source_repo_updated_at')
  final String? sourceRepoUpdatedAt;
  @override
  final bool pinned;
  @override
  final String? path;
  @override
  @JsonKey(name: 'body_html')
  final String bodyHtml;
  final Map<String, dynamic> _user;
  @override
  Map<String, dynamic> get user {
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_user);
  }

  final List<Map<String, dynamic>>? _topics;
  @override
  List<Map<String, dynamic>>? get topics {
    final value = _topics;
    if (value == null) return null;
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ZennArticleBody(id: $id, postType: $postType, title: $title, slug: $slug, commentsCount: $commentsCount, likedCount: $likedCount, bodyLettersCount: $bodyLettersCount, articleType: $articleType, emoji: $emoji, isSuspendingPrivate: $isSuspendingPrivate, publishedAt: $publishedAt, bodyUpdatedAt: $bodyUpdatedAt, sourceRepoUpdatedAt: $sourceRepoUpdatedAt, pinned: $pinned, path: $path, bodyHtml: $bodyHtml, user: $user, topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZennArticleBodyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postType, postType) ||
                other.postType == postType) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.commentsCount, commentsCount) ||
                other.commentsCount == commentsCount) &&
            (identical(other.likedCount, likedCount) ||
                other.likedCount == likedCount) &&
            (identical(other.bodyLettersCount, bodyLettersCount) ||
                other.bodyLettersCount == bodyLettersCount) &&
            (identical(other.articleType, articleType) ||
                other.articleType == articleType) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.isSuspendingPrivate, isSuspendingPrivate) ||
                other.isSuspendingPrivate == isSuspendingPrivate) &&
            (identical(other.publishedAt, publishedAt) ||
                other.publishedAt == publishedAt) &&
            (identical(other.bodyUpdatedAt, bodyUpdatedAt) ||
                other.bodyUpdatedAt == bodyUpdatedAt) &&
            (identical(other.sourceRepoUpdatedAt, sourceRepoUpdatedAt) ||
                other.sourceRepoUpdatedAt == sourceRepoUpdatedAt) &&
            (identical(other.pinned, pinned) || other.pinned == pinned) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.bodyHtml, bodyHtml) ||
                other.bodyHtml == bodyHtml) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      postType,
      title,
      slug,
      commentsCount,
      likedCount,
      bodyLettersCount,
      articleType,
      emoji,
      isSuspendingPrivate,
      publishedAt,
      bodyUpdatedAt,
      sourceRepoUpdatedAt,
      pinned,
      path,
      bodyHtml,
      const DeepCollectionEquality().hash(_user),
      const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZennArticleBodyImplCopyWith<_$ZennArticleBodyImpl> get copyWith =>
      __$$ZennArticleBodyImplCopyWithImpl<_$ZennArticleBodyImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ZennArticleBodyImplToJson(
      this,
    );
  }
}

abstract class _ZennArticleBody implements ZennArticleBody {
  const factory _ZennArticleBody(
      {required final int id,
      @JsonKey(name: 'post_type') required final String? postType,
      required final String title,
      required final String slug,
      @JsonKey(name: 'comments_count') required final int commentsCount,
      @JsonKey(name: 'liked_count') required final int likedCount,
      @JsonKey(name: 'body_letters_count') required final int bodyLettersCount,
      @JsonKey(name: 'article_type') required final String? articleType,
      required final String? emoji,
      @JsonKey(name: 'is_suspending_private')
      required final bool isSuspendingPrivate,
      @JsonKey(name: 'published_at') required final String? publishedAt,
      @JsonKey(name: 'body_updated_at') required final String? bodyUpdatedAt,
      @JsonKey(name: 'source_repo_updated_at')
      required final String? sourceRepoUpdatedAt,
      required final bool pinned,
      required final String? path,
      @JsonKey(name: 'body_html') required final String bodyHtml,
      required final Map<String, dynamic> user,
      required final List<Map<String, dynamic>>?
          topics}) = _$ZennArticleBodyImpl;

  factory _ZennArticleBody.fromJson(Map<String, dynamic> json) =
      _$ZennArticleBodyImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'post_type')
  String? get postType;
  @override
  String get title;
  @override
  String get slug;
  @override
  @JsonKey(name: 'comments_count')
  int get commentsCount;
  @override
  @JsonKey(name: 'liked_count')
  int get likedCount;
  @override
  @JsonKey(name: 'body_letters_count')
  int get bodyLettersCount;
  @override
  @JsonKey(name: 'article_type')
  String? get articleType;
  @override
  String? get emoji;
  @override
  @JsonKey(name: 'is_suspending_private')
  bool get isSuspendingPrivate;
  @override
  @JsonKey(name: 'published_at')
  String? get publishedAt;
  @override
  @JsonKey(name: 'body_updated_at')
  String? get bodyUpdatedAt;
  @override
  @JsonKey(name: 'source_repo_updated_at')
  String? get sourceRepoUpdatedAt;
  @override
  bool get pinned;
  @override
  String? get path;
  @override
  @JsonKey(name: 'body_html')
  String get bodyHtml;
  @override
  Map<String, dynamic> get user;
  @override
  List<Map<String, dynamic>>? get topics;
  @override
  @JsonKey(ignore: true)
  _$$ZennArticleBodyImplCopyWith<_$ZennArticleBodyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
