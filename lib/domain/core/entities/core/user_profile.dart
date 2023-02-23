// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/notification_filter_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/user.dart';
import 'package:prohealth360_daktari/domain/core/entities/health_diary/health_diary_entry.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  factory UserProfile({
    @JsonKey(name: 'id') String? id,

    // This is the nickname
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'pinChangeRequired') bool? pinChangeRequired,
    @JsonKey(name: 'hasSetPin') bool? hasSetPin,
    @JsonKey(name: 'isPhoneVerified') bool? isPhoneVerified,
    @JsonKey(name: 'hasSetSecurityQuestions') bool? hasSetSecurityQuestions,
    @JsonKey(name: 'hasSetNickname') bool? hasSetNickname,

    /// Used to indicate that the user's PIN has been reset by someone else
    ///
    /// This is used to trigger the change PIN workflow
    @JsonKey(name: 'pinUpdateRequired') bool? pinUpdateRequired,
    @JsonKey(name: 'termsAccepted') bool? termsAccepted,
    @JsonKey(name: 'suspended') bool? suspended,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'facilities') List<Facility>? facilities,
    String? staffNumber,
    Facility? defaultFacility,
    List<Facility>? linkedFacilities,
    User? user,
    String? defaultFacilityName,

    // recently shared health diary entries
    List<HealthDiaryEntry?>? clientSharedDiaryEntries,

    // staff notifications
    List<NotificationDetails?>? notifications,
    List<Caregiver?>? clientCaregivers,
    List<ManagedClient>? managedClients,
    NotificationFilterState? notificationFilterState,
    Facility? currentFacility,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  factory UserProfile.initial() => UserProfile(
        id: UNKNOWN,
        username: UNKNOWN,
        name: UNKNOWN,
        pinChangeRequired: false,
        hasSetPin: false,
        isPhoneVerified: false,
        hasSetSecurityQuestions: false,
        hasSetNickname: false,
        pinUpdateRequired: false,
        termsAccepted: false,
        active: false,
        userId: UNKNOWN,
        staffNumber: UNKNOWN,
        facilities: <Facility>[],
        linkedFacilities: <Facility>[],
        managedClients: <ManagedClient>[],
        defaultFacility: Facility.initial(),
        defaultFacilityName: UNKNOWN,
        user: User.initial(),
        clientSharedDiaryEntries: <HealthDiaryEntry>[],
        notifications: <NotificationDetails>[],
        currentFacility: Facility.initial(),
        clientCaregivers: <Caregiver>[],
      );
}
