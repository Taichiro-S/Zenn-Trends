// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticlesInfo _$ArticlesInfoFromJson(Map<String, dynamic> json) {
  return _ArticlesInfo.fromJson(json);
}

/// @nodoc
mixin _$ArticlesInfo {
  String get slug => throw _privateConstructorUsedError;
  Article get article => throw _privateConstructorUsedError;
  ZennUser get user => throw _privateConstructorUsedError;
  List<Topic> get topics => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesInfoCopyWith<ArticlesInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesInfoCopyWith<$Res> {
  factory $ArticlesInfoCopyWith(
          ArticlesInfo value, $Res Function(ArticlesInfo) then) =
      _$ArticlesInfoCopyWithImpl<$Res, ArticlesInfo>;
  @useResult
  $Res call({String slug, Article article, ZennUser user, List<Topic> topics});

  $ArticleCopyWith<$Res> get article;
  $ZennUserCopyWith<$Res> get user;
}

/// @nodoc
class _$ArticlesInfoCopyWithImpl<$Res, $Val extends ArticlesInfo>
    implements $ArticlesInfoCopyWith<$Res> {
  _$ArticlesInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? article = null,
    Object? user = null,
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ZennUser,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ArticleCopyWith<$Res> get article {
    return $ArticleCopyWith<$Res>(_value.article, (value) {
      return _then(_value.copyWith(article: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ZennUserCopyWith<$Res> get user {
    return $ZennUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ArticlesInfoImplCopyWith<$Res>
    implements $ArticlesInfoCopyWith<$Res> {
  factory _$$ArticlesInfoImplCopyWith(
          _$ArticlesInfoImpl value, $Res Function(_$ArticlesInfoImpl) then) =
      __$$ArticlesInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String slug, Article article, ZennUser user, List<Topic> topics});

  @override
  $ArticleCopyWith<$Res> get article;
  @override
  $ZennUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$ArticlesInfoImplCopyWithImpl<$Res>
    extends _$ArticlesInfoCopyWithImpl<$Res, _$ArticlesInfoImpl>
    implements _$$ArticlesInfoImplCopyWith<$Res> {
  __$$ArticlesInfoImplCopyWithImpl(
      _$ArticlesInfoImpl _value, $Res Function(_$ArticlesInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slug = null,
    Object? article = null,
    Object? user = null,
    Object? topics = null,
  }) {
    return _then(_$ArticlesInfoImpl(
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      article: null == article
          ? _value.article
          : article // ignore: cast_nullable_to_non_nullable
              as Article,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ZennUser,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Topic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticlesInfoImpl with DiagnosticableTreeMixin implements _ArticlesInfo {
  const _$ArticlesInfoImpl(
      {required this.slug,
      required this.article,
      required this.user,
      required final List<Topic> topics})
      : _topics = topics;

  factory _$ArticlesInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticlesInfoImplFromJson(json);

  @override
  final String slug;
  @override
  final Article article;
  @override
  final ZennUser user;
  final List<Topic> _topics;
  @override
  List<Topic> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ArticlesInfo(slug: $slug, article: $article, user: $user, topics: $topics)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ArticlesInfo'))
      ..add(DiagnosticsProperty('slug', slug))
      ..add(DiagnosticsProperty('article', article))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('topics', topics));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesInfoImpl &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.article, article) || other.article == article) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slug, article, user,
      const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesInfoImplCopyWith<_$ArticlesInfoImpl> get copyWith =>
      __$$ArticlesInfoImplCopyWithImpl<_$ArticlesInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticlesInfoImplToJson(
      this,
    );
  }
}

abstract class _ArticlesInfo implements ArticlesInfo {
  const factory _ArticlesInfo(
      {required final String slug,
      required final Article article,
      required final ZennUser user,
      required final List<Topic> topics}) = _$ArticlesInfoImpl;

  factory _ArticlesInfo.fromJson(Map<String, dynamic> json) =
      _$ArticlesInfoImpl.fromJson;

  @override
  String get slug;
  @override
  Article get article;
  @override
  ZennUser get user;
  @override
  List<Topic> get topics;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesInfoImplCopyWith<_$ArticlesInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
