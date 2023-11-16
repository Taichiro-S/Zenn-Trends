import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String username,
    required String name,
    required String avatarSmallUrl,
    required String avatarUrl,
    required String bio,
    required String autolinkedBio,
    required String githubUsername,
    required String twitterUsername,
    required bool isSupportOpen,
    required String? tokusyoContact,
    required String? tokusyoName,
    required String? websiteUrl,
    required String? websiteDomain,
    required int totalLikedCount,
    required String? gaTrackingId,
    required String? hatenaId,
    required bool isInvoiceIssuer,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
