// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'zenn_article_content_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ZennArticleContentState {
  String get emoji => throw _privateConstructorUsedError;
  String get authorLink => throw _privateConstructorUsedError;
  List<String> get topics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ZennArticleContentStateCopyWith<ZennArticleContentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ZennArticleContentStateCopyWith<$Res> {
  factory $ZennArticleContentStateCopyWith(ZennArticleContentState value,
          $Res Function(ZennArticleContentState) then) =
      _$ZennArticleContentStateCopyWithImpl<$Res, ZennArticleContentState>;
  @useResult
  $Res call({String emoji, String authorLink, List<String> topics});
}

/// @nodoc
class _$ZennArticleContentStateCopyWithImpl<$Res,
        $Val extends ZennArticleContentState>
    implements $ZennArticleContentStateCopyWith<$Res> {
  _$ZennArticleContentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emoji = null,
    Object? authorLink = null,
    Object? topics = null,
  }) {
    return _then(_value.copyWith(
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      authorLink: null == authorLink
          ? _value.authorLink
          : authorLink // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ZennArticleContentStateImplCopyWith<$Res>
    implements $ZennArticleContentStateCopyWith<$Res> {
  factory _$$ZennArticleContentStateImplCopyWith(
          _$ZennArticleContentStateImpl value,
          $Res Function(_$ZennArticleContentStateImpl) then) =
      __$$ZennArticleContentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String emoji, String authorLink, List<String> topics});
}

/// @nodoc
class __$$ZennArticleContentStateImplCopyWithImpl<$Res>
    extends _$ZennArticleContentStateCopyWithImpl<$Res,
        _$ZennArticleContentStateImpl>
    implements _$$ZennArticleContentStateImplCopyWith<$Res> {
  __$$ZennArticleContentStateImplCopyWithImpl(
      _$ZennArticleContentStateImpl _value,
      $Res Function(_$ZennArticleContentStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emoji = null,
    Object? authorLink = null,
    Object? topics = null,
  }) {
    return _then(_$ZennArticleContentStateImpl(
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      authorLink: null == authorLink
          ? _value.authorLink
          : authorLink // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ZennArticleContentStateImpl implements _ZennArticleContentState {
  const _$ZennArticleContentStateImpl(
      {required this.emoji,
      required this.authorLink,
      required final List<String> topics})
      : _topics = topics;

  @override
  final String emoji;
  @override
  final String authorLink;
  final List<String> _topics;
  @override
  List<String> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  String toString() {
    return 'ZennArticleContentState(emoji: $emoji, authorLink: $authorLink, topics: $topics)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ZennArticleContentStateImpl &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.authorLink, authorLink) ||
                other.authorLink == authorLink) &&
            const DeepCollectionEquality().equals(other._topics, _topics));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emoji, authorLink,
      const DeepCollectionEquality().hash(_topics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ZennArticleContentStateImplCopyWith<_$ZennArticleContentStateImpl>
      get copyWith => __$$ZennArticleContentStateImplCopyWithImpl<
          _$ZennArticleContentStateImpl>(this, _$identity);
}

abstract class _ZennArticleContentState implements ZennArticleContentState {
  const factory _ZennArticleContentState(
      {required final String emoji,
      required final String authorLink,
      required final List<String> topics}) = _$ZennArticleContentStateImpl;

  @override
  String get emoji;
  @override
  String get authorLink;
  @override
  List<String> get topics;
  @override
  @JsonKey(ignore: true)
  _$$ZennArticleContentStateImplCopyWith<_$ZennArticleContentStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
