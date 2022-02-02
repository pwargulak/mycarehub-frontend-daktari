// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    userId: json['userID'] as String?,
    username: json['userName'] as String?,
    displayName: json['displayName'] as String?,
    firstName: json['firstName'] as String?,
    middleName: json['middleName'] as String?,
    lastName: json['lastName'] as String?,
    userType: json['userType'] as String?,
    gender: genderFromJson(json['gender'] as String?),
    active: json['active'] as bool? ?? false,
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
    termsAccepted: json['termsAccepted'] as bool?,
    acceptedTermsID: json['acceptedTermsID'] as int?,
    suspended: json['suspended'] as bool?,
    avatar: json['avatar'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'userID': instance.userId,
      'userName': instance.username,
      'displayName': instance.displayName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'userType': instance.userType,
      'gender': genderToJson(instance.gender),
      'active': instance.active,
      'primaryContact': instance.primaryContact,
      'lastSuccessfulLogin': instance.lastSuccessfulLogin,
      'lastFailedLogin': instance.lastFailedLogin,
      'failedLoginCount': instance.failedLoginCount,
      'nextAllowedLogin': instance.nextAllowedLogin,
      'pinChangeRequired': instance.pinChangeRequired,
      'hasSetPin': instance.hasSetPin,
      'isPhoneVerified': instance.isPhoneVerified,
      'termsAccepted': instance.termsAccepted,
      'acceptedTermsID': instance.acceptedTermsID,
      'suspended': instance.suspended,
      'avatar': instance.avatar,
    };