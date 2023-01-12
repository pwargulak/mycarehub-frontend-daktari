// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      userId: json['ID'] as String?,
      username: json['Username'] as String?,
      name: json['Name'] as String?,
      gender: genderFromJson(json['Gender'] as String?),
      active: json['Active'] as bool? ?? false,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userType: json['userType'] as String?,
      primaryContact: json['primaryContact'] == null
          ? null
          : Contact.fromJson(json['primaryContact'] as Map<String, dynamic>),
      lastSuccessfulLogin: json['lastSuccessfulLogin'] as String?,
      lastFailedLogin: json['lastFailedLogin'] as String?,
      failedLoginCount: json['failedLoginCount'] as int?,
      nextAllowedLogin: json['nextAllowedLogin'] as String?,
      pinChangeRequired: json['pinChangeRequired'] as bool?,
      hasSetPin: json['hasSetPin'] as bool?,
      isPhoneVerified: json['isPhoneVerified'] as bool?,
      hasSetSecurityQuestions: json['hasSetSecurityQuestions'] as bool?,
      termsAccepted: json['termsAccepted'] as bool?,
      acceptedTermsID: json['acceptedTermsID'] as int?,
      suspended: json['suspended'] as bool?,
      avatar: json['avatar'] as String?,
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      pinUpdateRequired: json['pinUpdateRequired'] as bool? ?? false,
      chatRoomToken: json['chatRoomToken'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'ID': instance.userId,
      'Username': instance.username,
      'Name': instance.name,
      'Gender': genderToJson(instance.gender),
      'Active': instance.active,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userType': instance.userType,
      'primaryContact': instance.primaryContact,
      'lastSuccessfulLogin': instance.lastSuccessfulLogin,
      'lastFailedLogin': instance.lastFailedLogin,
      'failedLoginCount': instance.failedLoginCount,
      'nextAllowedLogin': instance.nextAllowedLogin,
      'pinChangeRequired': instance.pinChangeRequired,
      'hasSetPin': instance.hasSetPin,
      'isPhoneVerified': instance.isPhoneVerified,
      'hasSetSecurityQuestions': instance.hasSetSecurityQuestions,
      'termsAccepted': instance.termsAccepted,
      'acceptedTermsID': instance.acceptedTermsID,
      'suspended': instance.suspended,
      'avatar': instance.avatar,
      'roles': instance.roles,
      'pinUpdateRequired': instance.pinUpdateRequired,
      'chatRoomToken': instance.chatRoomToken,
    };
