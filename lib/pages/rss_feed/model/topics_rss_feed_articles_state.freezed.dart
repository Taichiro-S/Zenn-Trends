// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topics_rss_feed_articles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TopicsRssFeedArticlesState {
  Map<String, RssFeedArticlesState> get topicsRssFeedArticles =>
      throw _privateConstructorUsedError;
  String get selectedTopicName => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopicsRssFeedArticlesStateCopyWith<TopicsRssFeedArticlesState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicsRssFeedArticlesStateCopyWith<$Res> {
  factory $TopicsRssFeedArticlesStateCopyWith(TopicsRssFeedArticlesState value,
          $Res Function(TopicsRssFeedArticlesState) then) =
      _$TopicsRssFeedArticlesStateCopyWithImpl<$Res,
          TopicsRssFeedArticlesState>;
  @useResult
  $Res call(
      {Map<String, RssFeedArticlesState> topicsRssFeedArticles,
      String selectedTopicName,
      bool isLoadingMore});
}

/// @nodoc
class _$TopicsRssFeedArticlesStateCopyWithImpl<$Res,
        $Val extends TopicsRssFeedArticlesState>
    implements $TopicsRssFeedArticlesStateCopyWith<$Res> {
  _$TopicsRssFeedArticlesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicsRssFeedArticles = null,
    Object? selectedTopicName = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_value.copyWith(
      topicsRssFeedArticles: null == topicsRssFeedArticles
          ? _value.topicsRssFeedArticles
          : topicsRssFeedArticles // ignore: cast_nullable_to_non_nullable
              as Map<String, RssFeedArticlesState>,
      selectedTopicName: null == selectedTopicName
          ? _value.selectedTopicName
          : selectedTopicName // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicsRssFeedArticlesStateImplCopyWith<$Res>
    implements $TopicsRssFeedArticlesStateCopyWith<$Res> {
  factory _$$TopicsRssFeedArticlesStateImplCopyWith(
          _$TopicsRssFeedArticlesStateImpl value,
          $Res Function(_$TopicsRssFeedArticlesStateImpl) then) =
      __$$TopicsRssFeedArticlesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, RssFeedArticlesState> topicsRssFeedArticles,
      String selectedTopicName,
      bool isLoadingMore});
}

/// @nodoc
class __$$TopicsRssFeedArticlesStateImplCopyWithImpl<$Res>
    extends _$TopicsRssFeedArticlesStateCopyWithImpl<$Res,
        _$TopicsRssFeedArticlesStateImpl>
    implements _$$TopicsRssFeedArticlesStateImplCopyWith<$Res> {
  __$$TopicsRssFeedArticlesStateImplCopyWithImpl(
      _$TopicsRssFeedArticlesStateImpl _value,
      $Res Function(_$TopicsRssFeedArticlesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topicsRssFeedArticles = null,
    Object? selectedTopicName = null,
    Object? isLoadingMore = null,
  }) {
    return _then(_$TopicsRssFeedArticlesStateImpl(
      topicsRssFeedArticles: null == topicsRssFeedArticles
          ? _value._topicsRssFeedArticles
          : topicsRssFeedArticles // ignore: cast_nullable_to_non_nullable
              as Map<String, RssFeedArticlesState>,
      selectedTopicName: null == selectedTopicName
          ? _value.selectedTopicName
          : selectedTopicName // ignore: cast_nullable_to_non_nullable
              as String,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TopicsRssFeedArticlesStateImpl implements _TopicsRssFeedArticlesState {
  const _$TopicsRssFeedArticlesStateImpl(
      {required final Map<String, RssFeedArticlesState> topicsRssFeedArticles,
      required this.selectedTopicName,
      required this.isLoadingMore})
      : _topicsRssFeedArticles = topicsRssFeedArticles;

  final Map<String, RssFeedArticlesState> _topicsRssFeedArticles;
  @override
  Map<String, RssFeedArticlesState> get topicsRssFeedArticles {
    if (_topicsRssFeedArticles is EqualUnmodifiableMapView)
      return _topicsRssFeedArticles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_topicsRssFeedArticles);
  }

  @override
  final String selectedTopicName;
  @override
  final bool isLoadingMore;

  @override
  String toString() {
    return 'TopicsRssFeedArticlesState(topicsRssFeedArticles: $topicsRssFeedArticles, selectedTopicName: $selectedTopicName, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicsRssFeedArticlesStateImpl &&
            const DeepCollectionEquality()
                .equals(other._topicsRssFeedArticles, _topicsRssFeedArticles) &&
            (identical(other.selectedTopicName, selectedTopicName) ||
                other.selectedTopicName == selectedTopicName) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_topicsRssFeedArticles),
      selectedTopicName,
      isLoadingMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicsRssFeedArticlesStateImplCopyWith<_$TopicsRssFeedArticlesStateImpl>
      get copyWith => __$$TopicsRssFeedArticlesStateImplCopyWithImpl<
          _$TopicsRssFeedArticlesStateImpl>(this, _$identity);
}

abstract class _TopicsRssFeedArticlesState
    implements TopicsRssFeedArticlesState {
  const factory _TopicsRssFeedArticlesState(
      {required final Map<String, RssFeedArticlesState> topicsRssFeedArticles,
      required final String selectedTopicName,
      required final bool isLoadingMore}) = _$TopicsRssFeedArticlesStateImpl;

  @override
  Map<String, RssFeedArticlesState> get topicsRssFeedArticles;
  @override
  String get selectedTopicName;
  @override
  bool get isLoadingMore;
  @override
  @JsonKey(ignore: true)
  _$$TopicsRssFeedArticlesStateImplCopyWith<_$TopicsRssFeedArticlesStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
