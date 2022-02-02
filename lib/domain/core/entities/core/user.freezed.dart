// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'displayName')
          String? displayName,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'middleName')
          String? middleName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          bool? isPhoneVerified,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar}) {
    return _User(
      userId: userId,
      username: username,
      displayName: displayName,
      firstName: firstName,
      middleName: middleName,
      lastName: lastName,
      userType: userType,
      gender: gender,
      active: active,
      primaryContact: primaryContact,
      lastSuccessfulLogin: lastSuccessfulLogin,
      lastFailedLogin: lastFailedLogin,
      failedLoginCount: failedLoginCount,
      nextAllowedLogin: nextAllowedLogin,
      pinChangeRequired: pinChangeRequired,
      hasSetPin: hasSetPin,
      isPhoneVerified: isPhoneVerified,
      termsAccepted: termsAccepted,
      acceptedTermsID: acceptedTermsID,
      suspended: suspended,
      avatar: avatar,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  @JsonKey(name: 'userID')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'userName')
  String? get username =>
      throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'displayName')
  String? get displayName =>
      throw _privateConstructorUsedError; // This is the @handle
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middleName')
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userType')
  String? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'primaryContact')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastSuccessfulLogin')
  String? get lastSuccessfulLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastFailedLogin')
  String? get lastFailedLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'failedLoginCount')
  int? get failedLoginCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'nextAllowedLogin')
  String? get nextAllowedLogin => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinChangeRequired')
  bool? get pinChangeRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetPin')
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPhoneVerified')
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptedTermsID')
  int? get acceptedTermsID => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspended')
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'displayName')
          String? displayName,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'middleName')
          String? middleName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          bool? isPhoneVerified,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar});

  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? displayName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? userType = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? lastSuccessfulLogin = freezed,
    Object? lastFailedLogin = freezed,
    Object? failedLoginCount = freezed,
    Object? nextAllowedLogin = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? termsAccepted = freezed,
    Object? acceptedTermsID = freezed,
    Object? suspended = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastSuccessfulLogin: lastSuccessfulLogin == freezed
          ? _value.lastSuccessfulLogin
          : lastSuccessfulLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedLogin: lastFailedLogin == freezed
          ? _value.lastFailedLogin
          : lastFailedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: failedLoginCount == freezed
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAllowedLogin: nextAllowedLogin == freezed
          ? _value.nextAllowedLogin
          : nextAllowedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: pinChangeRequired == freezed
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptedTermsID: acceptedTermsID == freezed
          ? _value.acceptedTermsID
          : acceptedTermsID // ignore: cast_nullable_to_non_nullable
              as int?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ContactCopyWith<$Res>? get primaryContact {
    if (_value.primaryContact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.primaryContact!, (value) {
      return _then(_value.copyWith(primaryContact: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'displayName')
          String? displayName,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'middleName')
          String? middleName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          bool? isPhoneVerified,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar});

  @override
  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? displayName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? userType = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? primaryContact = freezed,
    Object? lastSuccessfulLogin = freezed,
    Object? lastFailedLogin = freezed,
    Object? failedLoginCount = freezed,
    Object? nextAllowedLogin = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? termsAccepted = freezed,
    Object? acceptedTermsID = freezed,
    Object? suspended = freezed,
    Object? avatar = freezed,
  }) {
    return _then(_User(
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: middleName == freezed
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: userType == freezed
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: gender == freezed
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: active == freezed
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      primaryContact: primaryContact == freezed
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastSuccessfulLogin: lastSuccessfulLogin == freezed
          ? _value.lastSuccessfulLogin
          : lastSuccessfulLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedLogin: lastFailedLogin == freezed
          ? _value.lastFailedLogin
          : lastFailedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: failedLoginCount == freezed
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAllowedLogin: nextAllowedLogin == freezed
          ? _value.nextAllowedLogin
          : nextAllowedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: pinChangeRequired == freezed
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: hasSetPin == freezed
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: isPhoneVerified == freezed
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: termsAccepted == freezed
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptedTermsID: acceptedTermsID == freezed
          ? _value.acceptedTermsID
          : acceptedTermsID // ignore: cast_nullable_to_non_nullable
              as int?,
      suspended: suspended == freezed
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {@JsonKey(name: 'userID')
          this.userId,
      @JsonKey(name: 'userName')
          this.username,
      @JsonKey(name: 'displayName')
          this.displayName,
      @JsonKey(name: 'firstName')
          this.firstName,
      @JsonKey(name: 'middleName')
          this.middleName,
      @JsonKey(name: 'lastName')
          this.lastName,
      @JsonKey(name: 'userType')
          this.userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          this.gender,
      @JsonKey(name: 'active', defaultValue: false)
          this.active,
      @JsonKey(name: 'primaryContact')
          this.primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          this.lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          this.lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          this.failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          this.nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          this.pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          this.hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          this.isPhoneVerified,
      @JsonKey(name: 'termsAccepted')
          this.termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          this.acceptedTermsID,
      @JsonKey(name: 'suspended')
          this.suspended,
      @JsonKey(name: 'avatar')
          this.avatar});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  @JsonKey(name: 'userID')
  final String? userId;
  @override
  @JsonKey(name: 'userName')
  final String? username;
  @override // This is the nickname
  @JsonKey(name: 'displayName')
  final String? displayName;
  @override // This is the @handle
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'middleName')
  final String? middleName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'userType')
  final String? userType;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'primaryContact')
  final Contact? primaryContact;
  @override
  @JsonKey(name: 'lastSuccessfulLogin')
  final String? lastSuccessfulLogin;
  @override
  @JsonKey(name: 'lastFailedLogin')
  final String? lastFailedLogin;
  @override
  @JsonKey(name: 'failedLoginCount')
  final int? failedLoginCount;
  @override
  @JsonKey(name: 'nextAllowedLogin')
  final String? nextAllowedLogin;
  @override
  @JsonKey(name: 'pinChangeRequired')
  final bool? pinChangeRequired;
  @override
  @JsonKey(name: 'hasSetPin')
  final bool? hasSetPin;
  @override
  @JsonKey(name: 'isPhoneVerified')
  final bool? isPhoneVerified;
  @override
  @JsonKey(name: 'termsAccepted')
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'acceptedTermsID')
  final int? acceptedTermsID;
  @override
  @JsonKey(name: 'suspended')
  final bool? suspended;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, displayName: $displayName, firstName: $firstName, middleName: $middleName, lastName: $lastName, userType: $userType, gender: $gender, active: $active, primaryContact: $primaryContact, lastSuccessfulLogin: $lastSuccessfulLogin, lastFailedLogin: $lastFailedLogin, failedLoginCount: $failedLoginCount, nextAllowedLogin: $nextAllowedLogin, pinChangeRequired: $pinChangeRequired, hasSetPin: $hasSetPin, isPhoneVerified: $isPhoneVerified, termsAccepted: $termsAccepted, acceptedTermsID: $acceptedTermsID, suspended: $suspended, avatar: $avatar)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.middleName, middleName) ||
                const DeepCollectionEquality()
                    .equals(other.middleName, middleName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.userType, userType) ||
                const DeepCollectionEquality()
                    .equals(other.userType, userType)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.active, active) ||
                const DeepCollectionEquality().equals(other.active, active)) &&
            (identical(other.primaryContact, primaryContact) ||
                const DeepCollectionEquality()
                    .equals(other.primaryContact, primaryContact)) &&
            (identical(other.lastSuccessfulLogin, lastSuccessfulLogin) ||
                const DeepCollectionEquality()
                    .equals(other.lastSuccessfulLogin, lastSuccessfulLogin)) &&
            (identical(other.lastFailedLogin, lastFailedLogin) ||
                const DeepCollectionEquality()
                    .equals(other.lastFailedLogin, lastFailedLogin)) &&
            (identical(other.failedLoginCount, failedLoginCount) ||
                const DeepCollectionEquality()
                    .equals(other.failedLoginCount, failedLoginCount)) &&
            (identical(other.nextAllowedLogin, nextAllowedLogin) ||
                const DeepCollectionEquality()
                    .equals(other.nextAllowedLogin, nextAllowedLogin)) &&
            (identical(other.pinChangeRequired, pinChangeRequired) ||
                const DeepCollectionEquality()
                    .equals(other.pinChangeRequired, pinChangeRequired)) &&
            (identical(other.hasSetPin, hasSetPin) ||
                const DeepCollectionEquality()
                    .equals(other.hasSetPin, hasSetPin)) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isPhoneVerified, isPhoneVerified)) &&
            (identical(other.termsAccepted, termsAccepted) ||
                const DeepCollectionEquality()
                    .equals(other.termsAccepted, termsAccepted)) &&
            (identical(other.acceptedTermsID, acceptedTermsID) ||
                const DeepCollectionEquality()
                    .equals(other.acceptedTermsID, acceptedTermsID)) &&
            (identical(other.suspended, suspended) ||
                const DeepCollectionEquality()
                    .equals(other.suspended, suspended)) &&
            (identical(other.avatar, avatar) ||
                const DeepCollectionEquality().equals(other.avatar, avatar)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(middleName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(userType) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(active) ^
      const DeepCollectionEquality().hash(primaryContact) ^
      const DeepCollectionEquality().hash(lastSuccessfulLogin) ^
      const DeepCollectionEquality().hash(lastFailedLogin) ^
      const DeepCollectionEquality().hash(failedLoginCount) ^
      const DeepCollectionEquality().hash(nextAllowedLogin) ^
      const DeepCollectionEquality().hash(pinChangeRequired) ^
      const DeepCollectionEquality().hash(hasSetPin) ^
      const DeepCollectionEquality().hash(isPhoneVerified) ^
      const DeepCollectionEquality().hash(termsAccepted) ^
      const DeepCollectionEquality().hash(acceptedTermsID) ^
      const DeepCollectionEquality().hash(suspended) ^
      const DeepCollectionEquality().hash(avatar);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: 'userID')
          String? userId,
      @JsonKey(name: 'userName')
          String? username,
      @JsonKey(name: 'displayName')
          String? displayName,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'middleName')
          String? middleName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
      @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'primaryContact')
          Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          bool? isPhoneVerified,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'userID')
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'userName')
  String? get username => throw _privateConstructorUsedError;
  @override // This is the nickname
  @JsonKey(name: 'displayName')
  String? get displayName => throw _privateConstructorUsedError;
  @override // This is the @handle
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'middleName')
  String? get middleName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'userType')
  String? get userType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'primaryContact')
  Contact? get primaryContact => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastSuccessfulLogin')
  String? get lastSuccessfulLogin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'lastFailedLogin')
  String? get lastFailedLogin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'failedLoginCount')
  int? get failedLoginCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'nextAllowedLogin')
  String? get nextAllowedLogin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pinChangeRequired')
  bool? get pinChangeRequired => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'hasSetPin')
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'isPhoneVerified')
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'acceptedTermsID')
  int? get acceptedTermsID => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'suspended')
  bool? get suspended => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}