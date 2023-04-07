// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sghi_core/communities/models/strings.dart';

part 'community_profile.freezed.dart';
part 'community_profile.g.dart';

@freezed
class CommunityProfile with _$CommunityProfile {
  factory CommunityProfile({
    @JsonKey(name: 'userID') String? userID,
    @JsonKey(name: 'accessToken') String? accessToken,
    @JsonKey(name: 'deviceID') String? deviceID,
  }) = _CommunityProfile;

  factory CommunityProfile.fromJson(Map<String, dynamic> json) =>
      _$CommunityProfileFromJson(json);

  factory CommunityProfile.initial() => CommunityProfile(
        userID: UNKNOWN,
        accessToken: UNKNOWN,
        deviceID: UNKNOWN,
      );
}
