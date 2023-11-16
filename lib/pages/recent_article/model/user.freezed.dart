// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get avatarSmallUrl => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  String get bio => throw _privateConstructorUsedError;
  String get autolinkedBio => throw _privateConstructorUsedError;
  String get githubUsername => throw _privateConstructorUsedError;
  String get twitterUsername => throw _privateConstructorUsedError;
  bool get isSupportOpen => throw _privateConstructorUsedError;
  String? get tokusyoContact => throw _privateConstructorUsedError;
  String? get tokusyoName => throw _privateConstructorUsedError;
  String? get websiteUrl => throw _privateConstructorUsedError;
  String? get websiteDomain => throw _privateConstructorUsedError;
  int get totalLikedCount => throw _privateConstructorUsedError;
  String? get gaTrackingId => throw _privateConstructorUsedError;
  String? get hatenaId => throw _privateConstructorUsedError;
  bool get isInvoiceIssuer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String username,
      String name,
      String avatarSmallUrl,
      String avatarUrl,
      String bio,
      String autolinkedBio,
      String githubUsername,
      String twitterUsername,
      bool isSupportOpen,
      String? tokusyoContact,
      String? tokusyoName,
      String? websiteUrl,
      String? websiteDomain,
      int totalLikedCount,
      String? gaTrackingId,
      String? hatenaId,
      bool isInvoiceIssuer});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? avatarSmallUrl = null,
    Object? avatarUrl = null,
    Object? bio = null,
    Object? autolinkedBio = null,
    Object? githubUsername = null,
    Object? twitterUsername = null,
    Object? isSupportOpen = null,
    Object? tokusyoContact = freezed,
    Object? tokusyoName = freezed,
    Object? websiteUrl = freezed,
    Object? websiteDomain = freezed,
    Object? totalLikedCount = null,
    Object? gaTrackingId = freezed,
    Object? hatenaId = freezed,
    Object? isInvoiceIssuer = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarSmallUrl: null == avatarSmallUrl
          ? _value.avatarSmallUrl
          : avatarSmallUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      autolinkedBio: null == autolinkedBio
          ? _value.autolinkedBio
          : autolinkedBio // ignore: cast_nullable_to_non_nullable
              as String,
      githubUsername: null == githubUsername
          ? _value.githubUsername
          : githubUsername // ignore: cast_nullable_to_non_nullable
              as String,
      twitterUsername: null == twitterUsername
          ? _value.twitterUsername
          : twitterUsername // ignore: cast_nullable_to_non_nullable
              as String,
      isSupportOpen: null == isSupportOpen
          ? _value.isSupportOpen
          : isSupportOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      tokusyoContact: freezed == tokusyoContact
          ? _value.tokusyoContact
          : tokusyoContact // ignore: cast_nullable_to_non_nullable
              as String?,
      tokusyoName: freezed == tokusyoName
          ? _value.tokusyoName
          : tokusyoName // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteDomain: freezed == websiteDomain
          ? _value.websiteDomain
          : websiteDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLikedCount: null == totalLikedCount
          ? _value.totalLikedCount
          : totalLikedCount // ignore: cast_nullable_to_non_nullable
              as int,
      gaTrackingId: freezed == gaTrackingId
          ? _value.gaTrackingId
          : gaTrackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      hatenaId: freezed == hatenaId
          ? _value.hatenaId
          : hatenaId // ignore: cast_nullable_to_non_nullable
              as String?,
      isInvoiceIssuer: null == isInvoiceIssuer
          ? _value.isInvoiceIssuer
          : isInvoiceIssuer // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String username,
      String name,
      String avatarSmallUrl,
      String avatarUrl,
      String bio,
      String autolinkedBio,
      String githubUsername,
      String twitterUsername,
      bool isSupportOpen,
      String? tokusyoContact,
      String? tokusyoName,
      String? websiteUrl,
      String? websiteDomain,
      int totalLikedCount,
      String? gaTrackingId,
      String? hatenaId,
      bool isInvoiceIssuer});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? name = null,
    Object? avatarSmallUrl = null,
    Object? avatarUrl = null,
    Object? bio = null,
    Object? autolinkedBio = null,
    Object? githubUsername = null,
    Object? twitterUsername = null,
    Object? isSupportOpen = null,
    Object? tokusyoContact = freezed,
    Object? tokusyoName = freezed,
    Object? websiteUrl = freezed,
    Object? websiteDomain = freezed,
    Object? totalLikedCount = null,
    Object? gaTrackingId = freezed,
    Object? hatenaId = freezed,
    Object? isInvoiceIssuer = null,
  }) {
    return _then(_$UserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarSmallUrl: null == avatarSmallUrl
          ? _value.avatarSmallUrl
          : avatarSmallUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bio: null == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String,
      autolinkedBio: null == autolinkedBio
          ? _value.autolinkedBio
          : autolinkedBio // ignore: cast_nullable_to_non_nullable
              as String,
      githubUsername: null == githubUsername
          ? _value.githubUsername
          : githubUsername // ignore: cast_nullable_to_non_nullable
              as String,
      twitterUsername: null == twitterUsername
          ? _value.twitterUsername
          : twitterUsername // ignore: cast_nullable_to_non_nullable
              as String,
      isSupportOpen: null == isSupportOpen
          ? _value.isSupportOpen
          : isSupportOpen // ignore: cast_nullable_to_non_nullable
              as bool,
      tokusyoContact: freezed == tokusyoContact
          ? _value.tokusyoContact
          : tokusyoContact // ignore: cast_nullable_to_non_nullable
              as String?,
      tokusyoName: freezed == tokusyoName
          ? _value.tokusyoName
          : tokusyoName // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteDomain: freezed == websiteDomain
          ? _value.websiteDomain
          : websiteDomain // ignore: cast_nullable_to_non_nullable
              as String?,
      totalLikedCount: null == totalLikedCount
          ? _value.totalLikedCount
          : totalLikedCount // ignore: cast_nullable_to_non_nullable
              as int,
      gaTrackingId: freezed == gaTrackingId
          ? _value.gaTrackingId
          : gaTrackingId // ignore: cast_nullable_to_non_nullable
              as String?,
      hatenaId: freezed == hatenaId
          ? _value.hatenaId
          : hatenaId // ignore: cast_nullable_to_non_nullable
              as String?,
      isInvoiceIssuer: null == isInvoiceIssuer
          ? _value.isInvoiceIssuer
          : isInvoiceIssuer // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.username,
      required this.name,
      required this.avatarSmallUrl,
      required this.avatarUrl,
      required this.bio,
      required this.autolinkedBio,
      required this.githubUsername,
      required this.twitterUsername,
      required this.isSupportOpen,
      required this.tokusyoContact,
      required this.tokusyoName,
      required this.websiteUrl,
      required this.websiteDomain,
      required this.totalLikedCount,
      required this.gaTrackingId,
      required this.hatenaId,
      required this.isInvoiceIssuer});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String username;
  @override
  final String name;
  @override
  final String avatarSmallUrl;
  @override
  final String avatarUrl;
  @override
  final String bio;
  @override
  final String autolinkedBio;
  @override
  final String githubUsername;
  @override
  final String twitterUsername;
  @override
  final bool isSupportOpen;
  @override
  final String? tokusyoContact;
  @override
  final String? tokusyoName;
  @override
  final String? websiteUrl;
  @override
  final String? websiteDomain;
  @override
  final int totalLikedCount;
  @override
  final String? gaTrackingId;
  @override
  final String? hatenaId;
  @override
  final bool isInvoiceIssuer;

  @override
  String toString() {
    return 'User(id: $id, username: $username, name: $name, avatarSmallUrl: $avatarSmallUrl, avatarUrl: $avatarUrl, bio: $bio, autolinkedBio: $autolinkedBio, githubUsername: $githubUsername, twitterUsername: $twitterUsername, isSupportOpen: $isSupportOpen, tokusyoContact: $tokusyoContact, tokusyoName: $tokusyoName, websiteUrl: $websiteUrl, websiteDomain: $websiteDomain, totalLikedCount: $totalLikedCount, gaTrackingId: $gaTrackingId, hatenaId: $hatenaId, isInvoiceIssuer: $isInvoiceIssuer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarSmallUrl, avatarSmallUrl) ||
                other.avatarSmallUrl == avatarSmallUrl) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.autolinkedBio, autolinkedBio) ||
                other.autolinkedBio == autolinkedBio) &&
            (identical(other.githubUsername, githubUsername) ||
                other.githubUsername == githubUsername) &&
            (identical(other.twitterUsername, twitterUsername) ||
                other.twitterUsername == twitterUsername) &&
            (identical(other.isSupportOpen, isSupportOpen) ||
                other.isSupportOpen == isSupportOpen) &&
            (identical(other.tokusyoContact, tokusyoContact) ||
                other.tokusyoContact == tokusyoContact) &&
            (identical(other.tokusyoName, tokusyoName) ||
                other.tokusyoName == tokusyoName) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.websiteDomain, websiteDomain) ||
                other.websiteDomain == websiteDomain) &&
            (identical(other.totalLikedCount, totalLikedCount) ||
                other.totalLikedCount == totalLikedCount) &&
            (identical(other.gaTrackingId, gaTrackingId) ||
                other.gaTrackingId == gaTrackingId) &&
            (identical(other.hatenaId, hatenaId) ||
                other.hatenaId == hatenaId) &&
            (identical(other.isInvoiceIssuer, isInvoiceIssuer) ||
                other.isInvoiceIssuer == isInvoiceIssuer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      name,
      avatarSmallUrl,
      avatarUrl,
      bio,
      autolinkedBio,
      githubUsername,
      twitterUsername,
      isSupportOpen,
      tokusyoContact,
      tokusyoName,
      websiteUrl,
      websiteDomain,
      totalLikedCount,
      gaTrackingId,
      hatenaId,
      isInvoiceIssuer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {required final int id,
      required final String username,
      required final String name,
      required final String avatarSmallUrl,
      required final String avatarUrl,
      required final String bio,
      required final String autolinkedBio,
      required final String githubUsername,
      required final String twitterUsername,
      required final bool isSupportOpen,
      required final String? tokusyoContact,
      required final String? tokusyoName,
      required final String? websiteUrl,
      required final String? websiteDomain,
      required final int totalLikedCount,
      required final String? gaTrackingId,
      required final String? hatenaId,
      required final bool isInvoiceIssuer}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get username;
  @override
  String get name;
  @override
  String get avatarSmallUrl;
  @override
  String get avatarUrl;
  @override
  String get bio;
  @override
  String get autolinkedBio;
  @override
  String get githubUsername;
  @override
  String get twitterUsername;
  @override
  bool get isSupportOpen;
  @override
  String? get tokusyoContact;
  @override
  String? get tokusyoName;
  @override
  String? get websiteUrl;
  @override
  String? get websiteDomain;
  @override
  int get totalLikedCount;
  @override
  String? get gaTrackingId;
  @override
  String? get hatenaId;
  @override
  bool get isInvoiceIssuer;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
