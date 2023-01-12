// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  @JsonKey(name: 'ID')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'Username')
  String? get username =>
      throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'Name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'Gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'userType')
  String? get userType => throw _privateConstructorUsedError;
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
  @JsonKey(name: 'hasSetSecurityQuestions')
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'acceptedTermsID')
  int? get acceptedTermsID => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspended')
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'roles')
  List<Role>? get roles => throw _privateConstructorUsedError;

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired => throw _privateConstructorUsedError;
  String? get chatRoomToken => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'ID')
          String? userId,
      @JsonKey(name: 'Username')
          String? username,
      @JsonKey(name: 'Name')
          String? name,
      @JsonKey(name: 'Gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'Active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
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
      @JsonKey(name: 'hasSetSecurityQuestions')
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'roles')
          List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      String? chatRoomToken});

  $ContactCopyWith<$Res>? get primaryContact;
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
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userType = freezed,
    Object? primaryContact = freezed,
    Object? lastSuccessfulLogin = freezed,
    Object? lastFailedLogin = freezed,
    Object? failedLoginCount = freezed,
    Object? nextAllowedLogin = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? termsAccepted = freezed,
    Object? acceptedTermsID = freezed,
    Object? suspended = freezed,
    Object? avatar = freezed,
    Object? roles = freezed,
    Object? pinUpdateRequired = freezed,
    Object? chatRoomToken = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryContact: freezed == primaryContact
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastSuccessfulLogin: freezed == lastSuccessfulLogin
          ? _value.lastSuccessfulLogin
          : lastSuccessfulLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedLogin: freezed == lastFailedLogin
          ? _value.lastFailedLogin
          : lastFailedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: freezed == failedLoginCount
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAllowedLogin: freezed == nextAllowedLogin
          ? _value.nextAllowedLogin
          : nextAllowedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: freezed == pinChangeRequired
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: freezed == hasSetPin
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: freezed == hasSetSecurityQuestions
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptedTermsID: freezed == acceptedTermsID
          ? _value.acceptedTermsID
          : acceptedTermsID // ignore: cast_nullable_to_non_nullable
              as int?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatRoomToken: freezed == chatRoomToken
          ? _value.chatRoomToken
          : chatRoomToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ContactCopyWith<$Res>? get primaryContact {
    if (_value.primaryContact == null) {
      return null;
    }

    return $ContactCopyWith<$Res>(_value.primaryContact!, (value) {
      return _then(_value.copyWith(primaryContact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID')
          String? userId,
      @JsonKey(name: 'Username')
          String? username,
      @JsonKey(name: 'Name')
          String? name,
      @JsonKey(name: 'Gender', fromJson: genderFromJson, toJson: genderToJson)
          Gender? gender,
      @JsonKey(name: 'Active', defaultValue: false)
          bool? active,
      @JsonKey(name: 'firstName')
          String? firstName,
      @JsonKey(name: 'lastName')
          String? lastName,
      @JsonKey(name: 'userType')
          String? userType,
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
      @JsonKey(name: 'hasSetSecurityQuestions')
          bool? hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          bool? suspended,
      @JsonKey(name: 'avatar')
          String? avatar,
      @JsonKey(name: 'roles')
          List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          bool? pinUpdateRequired,
      String? chatRoomToken});

  @override
  $ContactCopyWith<$Res>? get primaryContact;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? gender = freezed,
    Object? active = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userType = freezed,
    Object? primaryContact = freezed,
    Object? lastSuccessfulLogin = freezed,
    Object? lastFailedLogin = freezed,
    Object? failedLoginCount = freezed,
    Object? nextAllowedLogin = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? termsAccepted = freezed,
    Object? acceptedTermsID = freezed,
    Object? suspended = freezed,
    Object? avatar = freezed,
    Object? roles = freezed,
    Object? pinUpdateRequired = freezed,
    Object? chatRoomToken = freezed,
  }) {
    return _then(_$_User(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryContact: freezed == primaryContact
          ? _value.primaryContact
          : primaryContact // ignore: cast_nullable_to_non_nullable
              as Contact?,
      lastSuccessfulLogin: freezed == lastSuccessfulLogin
          ? _value.lastSuccessfulLogin
          : lastSuccessfulLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      lastFailedLogin: freezed == lastFailedLogin
          ? _value.lastFailedLogin
          : lastFailedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      failedLoginCount: freezed == failedLoginCount
          ? _value.failedLoginCount
          : failedLoginCount // ignore: cast_nullable_to_non_nullable
              as int?,
      nextAllowedLogin: freezed == nextAllowedLogin
          ? _value.nextAllowedLogin
          : nextAllowedLogin // ignore: cast_nullable_to_non_nullable
              as String?,
      pinChangeRequired: freezed == pinChangeRequired
          ? _value.pinChangeRequired
          : pinChangeRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetPin: freezed == hasSetPin
          ? _value.hasSetPin
          : hasSetPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _value.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSetSecurityQuestions: freezed == hasSetSecurityQuestions
          ? _value.hasSetSecurityQuestions
          : hasSetSecurityQuestions // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      acceptedTermsID: freezed == acceptedTermsID
          ? _value.acceptedTermsID
          : acceptedTermsID // ignore: cast_nullable_to_non_nullable
              as int?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<Role>?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      chatRoomToken: freezed == chatRoomToken
          ? _value.chatRoomToken
          : chatRoomToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {@JsonKey(name: 'ID')
          this.userId,
      @JsonKey(name: 'Username')
          this.username,
      @JsonKey(name: 'Name')
          this.name,
      @JsonKey(name: 'Gender', fromJson: genderFromJson, toJson: genderToJson)
          this.gender,
      @JsonKey(name: 'Active', defaultValue: false)
          this.active,
      @JsonKey(name: 'firstName')
          this.firstName,
      @JsonKey(name: 'lastName')
          this.lastName,
      @JsonKey(name: 'userType')
          this.userType,
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
      @JsonKey(name: 'hasSetSecurityQuestions')
          this.hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          this.termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          this.acceptedTermsID,
      @JsonKey(name: 'suspended')
          this.suspended,
      @JsonKey(name: 'avatar')
          this.avatar,
      @JsonKey(name: 'roles')
          final List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          this.pinUpdateRequired,
      this.chatRoomToken})
      : _roles = roles;

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? userId;
  @override
  @JsonKey(name: 'Username')
  final String? username;
// This is the nickname
  @override
  @JsonKey(name: 'Name')
  final String? name;
  @override
  @JsonKey(name: 'Gender', fromJson: genderFromJson, toJson: genderToJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'userType')
  final String? userType;
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
  @JsonKey(name: 'hasSetSecurityQuestions')
  final bool? hasSetSecurityQuestions;
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
  final List<Role>? _roles;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles {
    final value = _roles;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @override
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  final bool? pinUpdateRequired;
  @override
  final String? chatRoomToken;

  @override
  String toString() {
    return 'User(userId: $userId, username: $username, name: $name, gender: $gender, active: $active, firstName: $firstName, lastName: $lastName, userType: $userType, primaryContact: $primaryContact, lastSuccessfulLogin: $lastSuccessfulLogin, lastFailedLogin: $lastFailedLogin, failedLoginCount: $failedLoginCount, nextAllowedLogin: $nextAllowedLogin, pinChangeRequired: $pinChangeRequired, hasSetPin: $hasSetPin, isPhoneVerified: $isPhoneVerified, hasSetSecurityQuestions: $hasSetSecurityQuestions, termsAccepted: $termsAccepted, acceptedTermsID: $acceptedTermsID, suspended: $suspended, avatar: $avatar, roles: $roles, pinUpdateRequired: $pinUpdateRequired, chatRoomToken: $chatRoomToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.primaryContact, primaryContact) ||
                other.primaryContact == primaryContact) &&
            (identical(other.lastSuccessfulLogin, lastSuccessfulLogin) ||
                other.lastSuccessfulLogin == lastSuccessfulLogin) &&
            (identical(other.lastFailedLogin, lastFailedLogin) ||
                other.lastFailedLogin == lastFailedLogin) &&
            (identical(other.failedLoginCount, failedLoginCount) ||
                other.failedLoginCount == failedLoginCount) &&
            (identical(other.nextAllowedLogin, nextAllowedLogin) ||
                other.nextAllowedLogin == nextAllowedLogin) &&
            (identical(other.pinChangeRequired, pinChangeRequired) ||
                other.pinChangeRequired == pinChangeRequired) &&
            (identical(other.hasSetPin, hasSetPin) ||
                other.hasSetPin == hasSetPin) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(
                    other.hasSetSecurityQuestions, hasSetSecurityQuestions) ||
                other.hasSetSecurityQuestions == hasSetSecurityQuestions) &&
            (identical(other.termsAccepted, termsAccepted) ||
                other.termsAccepted == termsAccepted) &&
            (identical(other.acceptedTermsID, acceptedTermsID) ||
                other.acceptedTermsID == acceptedTermsID) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.pinUpdateRequired, pinUpdateRequired) ||
                other.pinUpdateRequired == pinUpdateRequired) &&
            (identical(other.chatRoomToken, chatRoomToken) ||
                other.chatRoomToken == chatRoomToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userId,
        username,
        name,
        gender,
        active,
        firstName,
        lastName,
        userType,
        primaryContact,
        lastSuccessfulLogin,
        lastFailedLogin,
        failedLoginCount,
        nextAllowedLogin,
        pinChangeRequired,
        hasSetPin,
        isPhoneVerified,
        hasSetSecurityQuestions,
        termsAccepted,
        acceptedTermsID,
        suspended,
        avatar,
        const DeepCollectionEquality().hash(_roles),
        pinUpdateRequired,
        chatRoomToken
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {@JsonKey(name: 'ID')
          final String? userId,
      @JsonKey(name: 'Username')
          final String? username,
      @JsonKey(name: 'Name')
          final String? name,
      @JsonKey(name: 'Gender', fromJson: genderFromJson, toJson: genderToJson)
          final Gender? gender,
      @JsonKey(name: 'Active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'firstName')
          final String? firstName,
      @JsonKey(name: 'lastName')
          final String? lastName,
      @JsonKey(name: 'userType')
          final String? userType,
      @JsonKey(name: 'primaryContact')
          final Contact? primaryContact,
      @JsonKey(name: 'lastSuccessfulLogin')
          final String? lastSuccessfulLogin,
      @JsonKey(name: 'lastFailedLogin')
          final String? lastFailedLogin,
      @JsonKey(name: 'failedLoginCount')
          final int? failedLoginCount,
      @JsonKey(name: 'nextAllowedLogin')
          final String? nextAllowedLogin,
      @JsonKey(name: 'pinChangeRequired')
          final bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          final bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          final bool? isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions')
          final bool? hasSetSecurityQuestions,
      @JsonKey(name: 'termsAccepted')
          final bool? termsAccepted,
      @JsonKey(name: 'acceptedTermsID')
          final int? acceptedTermsID,
      @JsonKey(name: 'suspended')
          final bool? suspended,
      @JsonKey(name: 'avatar')
          final String? avatar,
      @JsonKey(name: 'roles')
          final List<Role>? roles,
      @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
          final bool? pinUpdateRequired,
      final String? chatRoomToken}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get userId;
  @override
  @JsonKey(name: 'Username')
  String? get username;
  @override // This is the nickname
  @JsonKey(name: 'Name')
  String? get name;
  @override
  @JsonKey(name: 'Gender', fromJson: genderFromJson, toJson: genderToJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'Active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'firstName')
  String? get firstName;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName;
  @override
  @JsonKey(name: 'userType')
  String? get userType;
  @override
  @JsonKey(name: 'primaryContact')
  Contact? get primaryContact;
  @override
  @JsonKey(name: 'lastSuccessfulLogin')
  String? get lastSuccessfulLogin;
  @override
  @JsonKey(name: 'lastFailedLogin')
  String? get lastFailedLogin;
  @override
  @JsonKey(name: 'failedLoginCount')
  int? get failedLoginCount;
  @override
  @JsonKey(name: 'nextAllowedLogin')
  String? get nextAllowedLogin;
  @override
  @JsonKey(name: 'pinChangeRequired')
  bool? get pinChangeRequired;
  @override
  @JsonKey(name: 'hasSetPin')
  bool? get hasSetPin;
  @override
  @JsonKey(name: 'isPhoneVerified')
  bool? get isPhoneVerified;
  @override
  @JsonKey(name: 'hasSetSecurityQuestions')
  bool? get hasSetSecurityQuestions;
  @override
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted;
  @override
  @JsonKey(name: 'acceptedTermsID')
  int? get acceptedTermsID;
  @override
  @JsonKey(name: 'suspended')
  bool? get suspended;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'roles')
  List<Role>? get roles;
  @override

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired', defaultValue: false)
  bool? get pinUpdateRequired;
  @override
  String? get chatRoomToken;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
