// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserProfile _$$_UserProfileFromJson(Map<String, dynamic> json) =>
    _$_UserProfile(
      id: json['id'] as String?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      pinChangeRequired: json['pinChangeRequired'] as bool?,
      hasSetPin: json['hasSetPin'] as bool?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      hasSetSecurityQuestions: json['hasSetSecurityQuestions'] as bool?,
      hasSetNickname: json['hasSetNickname'] as bool?,
      pinUpdateRequired: json['pinUpdateRequired'] as bool?,
      termsAccepted: json['termsAccepted'] as bool?,
      suspended: json['suspended'] as bool?,
      userId: json['user_id'] as String?,
      active: json['active'] as bool? ?? false,
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
      staffNumber: json['staffNumber'] as String?,
      defaultFacility: json['defaultFacility'] == null
          ? null
          : Facility.fromJson(json['defaultFacility'] as Map<String, dynamic>),
      linkedFacilities: (json['linkedFacilities'] as List<dynamic>?)
          ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      defaultFacilityName: json['defaultFacilityName'] as String?,
      clientSharedDiaryEntries:
          (json['clientSharedDiaryEntries'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : HealthDiaryEntry.fromJson(e as Map<String, dynamic>))
              .toList(),
      notifications: (json['notifications'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : NotificationDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      clientCaregivers: (json['clientCaregivers'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Caregiver.fromJson(e as Map<String, dynamic>))
          .toList(),
      managedClients: (json['managedClients'] as List<dynamic>?)
          ?.map((e) => ManagedClient.fromJson(e as Map<String, dynamic>))
          .toList(),
      notificationFilterState: json['notificationFilterState'] == null
          ? null
          : NotificationFilterState.fromJson(
              json['notificationFilterState'] as Map<String, dynamic>),
      currentFacility: json['currentFacility'] == null
          ? null
          : Facility.fromJson(json['currentFacility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserProfileToJson(_$_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'name': instance.name,
      'pinChangeRequired': instance.pinChangeRequired,
      'hasSetPin': instance.hasSetPin,
      'isPhoneVerified': instance.isPhoneVerified,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'hasSetNickname': instance.hasSetNickname,
      'pinUpdateRequired': instance.pinUpdateRequired,
      'termsAccepted': instance.termsAccepted,
      'suspended': instance.suspended,
      'user_id': instance.userId,
      'active': instance.active,
      'facilities': instance.facilities,
      'staffNumber': instance.staffNumber,
      'defaultFacility': instance.defaultFacility,
      'linkedFacilities': instance.linkedFacilities,
      'user': instance.user,
      'defaultFacilityName': instance.defaultFacilityName,
      'clientSharedDiaryEntries': instance.clientSharedDiaryEntries,
      'notifications': instance.notifications,
      'clientCaregivers': instance.clientCaregivers,
      'managedClients': instance.managedClients,
      'notificationFilterState': instance.notificationFilterState,
      'currentFacility': instance.currentFacility,
    };
