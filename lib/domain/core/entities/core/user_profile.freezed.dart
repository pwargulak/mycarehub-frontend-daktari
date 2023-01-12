// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError; // This is the nickname
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'pinChangeRequired')
  bool? get pinChangeRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetPin')
  bool? get hasSetPin => throw _privateConstructorUsedError;
  @JsonKey(name: 'isPhoneVerified')
  bool? get isPhoneVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetSecurityQuestions')
  bool? get hasSetSecurityQuestions => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasSetNickname')
  bool? get hasSetNickname => throw _privateConstructorUsedError;

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired')
  bool? get pinUpdateRequired => throw _privateConstructorUsedError;
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted => throw _privateConstructorUsedError;
  @JsonKey(name: 'suspended')
  bool? get suspended => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;
  String? get staffNumber => throw _privateConstructorUsedError;
  Facility? get defaultFacility => throw _privateConstructorUsedError;
  List<Facility>? get linkedFacilities => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get defaultFacilityName =>
      throw _privateConstructorUsedError; // invited communities
  CommunitiesState? get communitiesState =>
      throw _privateConstructorUsedError; // recently shared health diary entries
  List<HealthDiaryEntry?>? get clientSharedDiaryEntries =>
      throw _privateConstructorUsedError; // staff notifications
  List<NotificationDetails?>? get notifications =>
      throw _privateConstructorUsedError;
  List<Caregiver?>? get clientCaregivers => throw _privateConstructorUsedError;
  List<ManagedClient>? get managedClients => throw _privateConstructorUsedError;
  NotificationFilterState? get notificationFilterState =>
      throw _privateConstructorUsedError;
  Facility? get currentFacility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'pinChangeRequired') bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin') bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified') bool? isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions') bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname') bool? hasSetNickname,
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
      CommunitiesState? communitiesState,
      List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      List<NotificationDetails?>? notifications,
      List<Caregiver?>? clientCaregivers,
      List<ManagedClient>? managedClients,
      NotificationFilterState? notificationFilterState,
      Facility? currentFacility});

  $FacilityCopyWith<$Res>? get defaultFacility;
  $UserCopyWith<$Res>? get user;
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
  $FacilityCopyWith<$Res>? get currentFacility;
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? pinUpdateRequired = freezed,
    Object? termsAccepted = freezed,
    Object? suspended = freezed,
    Object? userId = freezed,
    Object? active = freezed,
    Object? facilities = freezed,
    Object? staffNumber = freezed,
    Object? defaultFacility = freezed,
    Object? linkedFacilities = freezed,
    Object? user = freezed,
    Object? defaultFacilityName = freezed,
    Object? communitiesState = freezed,
    Object? clientSharedDiaryEntries = freezed,
    Object? notifications = freezed,
    Object? clientCaregivers = freezed,
    Object? managedClients = freezed,
    Object? notificationFilterState = freezed,
    Object? currentFacility = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      hasSetNickname: freezed == hasSetNickname
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilities: freezed == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      staffNumber: freezed == staffNumber
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      linkedFacilities: freezed == linkedFacilities
          ? _value.linkedFacilities
          : linkedFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      defaultFacilityName: freezed == defaultFacilityName
          ? _value.defaultFacilityName
          : defaultFacilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      communitiesState: freezed == communitiesState
          ? _value.communitiesState
          : communitiesState // ignore: cast_nullable_to_non_nullable
              as CommunitiesState?,
      clientSharedDiaryEntries: freezed == clientSharedDiaryEntries
          ? _value.clientSharedDiaryEntries
          : clientSharedDiaryEntries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails?>?,
      clientCaregivers: freezed == clientCaregivers
          ? _value.clientCaregivers
          : clientCaregivers // ignore: cast_nullable_to_non_nullable
              as List<Caregiver?>?,
      managedClients: freezed == managedClients
          ? _value.managedClients
          : managedClients // ignore: cast_nullable_to_non_nullable
              as List<ManagedClient>?,
      notificationFilterState: freezed == notificationFilterState
          ? _value.notificationFilterState
          : notificationFilterState // ignore: cast_nullable_to_non_nullable
              as NotificationFilterState?,
      currentFacility: freezed == currentFacility
          ? _value.currentFacility
          : currentFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get defaultFacility {
    if (_value.defaultFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.defaultFacility!, (value) {
      return _then(_value.copyWith(defaultFacility: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CommunitiesStateCopyWith<$Res>? get communitiesState {
    if (_value.communitiesState == null) {
      return null;
    }

    return $CommunitiesStateCopyWith<$Res>(_value.communitiesState!, (value) {
      return _then(_value.copyWith(communitiesState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState {
    if (_value.notificationFilterState == null) {
      return null;
    }

    return $NotificationFilterStateCopyWith<$Res>(
        _value.notificationFilterState!, (value) {
      return _then(_value.copyWith(notificationFilterState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get currentFacility {
    if (_value.currentFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.currentFacility!, (value) {
      return _then(_value.copyWith(currentFacility: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$_UserProfileCopyWith(
          _$_UserProfile value, $Res Function(_$_UserProfile) then) =
      __$$_UserProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'pinChangeRequired') bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin') bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified') bool? isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions') bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname') bool? hasSetNickname,
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
      CommunitiesState? communitiesState,
      List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      List<NotificationDetails?>? notifications,
      List<Caregiver?>? clientCaregivers,
      List<ManagedClient>? managedClients,
      NotificationFilterState? notificationFilterState,
      Facility? currentFacility});

  @override
  $FacilityCopyWith<$Res>? get defaultFacility;
  @override
  $UserCopyWith<$Res>? get user;
  @override
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  @override
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
  @override
  $FacilityCopyWith<$Res>? get currentFacility;
}

/// @nodoc
class __$$_UserProfileCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$_UserProfile>
    implements _$$_UserProfileCopyWith<$Res> {
  __$$_UserProfileCopyWithImpl(
      _$_UserProfile _value, $Res Function(_$_UserProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? name = freezed,
    Object? pinChangeRequired = freezed,
    Object? hasSetPin = freezed,
    Object? isPhoneVerified = freezed,
    Object? hasSetSecurityQuestions = freezed,
    Object? hasSetNickname = freezed,
    Object? pinUpdateRequired = freezed,
    Object? termsAccepted = freezed,
    Object? suspended = freezed,
    Object? userId = freezed,
    Object? active = freezed,
    Object? facilities = freezed,
    Object? staffNumber = freezed,
    Object? defaultFacility = freezed,
    Object? linkedFacilities = freezed,
    Object? user = freezed,
    Object? defaultFacilityName = freezed,
    Object? communitiesState = freezed,
    Object? clientSharedDiaryEntries = freezed,
    Object? notifications = freezed,
    Object? clientCaregivers = freezed,
    Object? managedClients = freezed,
    Object? notificationFilterState = freezed,
    Object? currentFacility = freezed,
  }) {
    return _then(_$_UserProfile(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
      hasSetNickname: freezed == hasSetNickname
          ? _value.hasSetNickname
          : hasSetNickname // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinUpdateRequired: freezed == pinUpdateRequired
          ? _value.pinUpdateRequired
          : pinUpdateRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      termsAccepted: freezed == termsAccepted
          ? _value.termsAccepted
          : termsAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      suspended: freezed == suspended
          ? _value.suspended
          : suspended // ignore: cast_nullable_to_non_nullable
              as bool?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilities: freezed == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      staffNumber: freezed == staffNumber
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      linkedFacilities: freezed == linkedFacilities
          ? _value._linkedFacilities
          : linkedFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      defaultFacilityName: freezed == defaultFacilityName
          ? _value.defaultFacilityName
          : defaultFacilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      communitiesState: freezed == communitiesState
          ? _value.communitiesState
          : communitiesState // ignore: cast_nullable_to_non_nullable
              as CommunitiesState?,
      clientSharedDiaryEntries: freezed == clientSharedDiaryEntries
          ? _value._clientSharedDiaryEntries
          : clientSharedDiaryEntries // ignore: cast_nullable_to_non_nullable
              as List<HealthDiaryEntry?>?,
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationDetails?>?,
      clientCaregivers: freezed == clientCaregivers
          ? _value._clientCaregivers
          : clientCaregivers // ignore: cast_nullable_to_non_nullable
              as List<Caregiver?>?,
      managedClients: freezed == managedClients
          ? _value._managedClients
          : managedClients // ignore: cast_nullable_to_non_nullable
              as List<ManagedClient>?,
      notificationFilterState: freezed == notificationFilterState
          ? _value.notificationFilterState
          : notificationFilterState // ignore: cast_nullable_to_non_nullable
              as NotificationFilterState?,
      currentFacility: freezed == currentFacility
          ? _value.currentFacility
          : currentFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfile implements _UserProfile {
  _$_UserProfile(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'pinChangeRequired') this.pinChangeRequired,
      @JsonKey(name: 'hasSetPin') this.hasSetPin,
      @JsonKey(name: 'isPhoneVerified') this.isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions') this.hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname') this.hasSetNickname,
      @JsonKey(name: 'pinUpdateRequired') this.pinUpdateRequired,
      @JsonKey(name: 'termsAccepted') this.termsAccepted,
      @JsonKey(name: 'suspended') this.suspended,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'facilities') final List<Facility>? facilities,
      this.staffNumber,
      this.defaultFacility,
      final List<Facility>? linkedFacilities,
      this.user,
      this.defaultFacilityName,
      this.communitiesState,
      final List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      final List<NotificationDetails?>? notifications,
      final List<Caregiver?>? clientCaregivers,
      final List<ManagedClient>? managedClients,
      this.notificationFilterState,
      this.currentFacility})
      : _facilities = facilities,
        _linkedFacilities = linkedFacilities,
        _clientSharedDiaryEntries = clientSharedDiaryEntries,
        _notifications = notifications,
        _clientCaregivers = clientCaregivers,
        _managedClients = managedClients;

  factory _$_UserProfile.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
// This is the nickname
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'name')
  final String? name;
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
  @JsonKey(name: 'hasSetNickname')
  final bool? hasSetNickname;

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @override
  @JsonKey(name: 'pinUpdateRequired')
  final bool? pinUpdateRequired;
  @override
  @JsonKey(name: 'termsAccepted')
  final bool? termsAccepted;
  @override
  @JsonKey(name: 'suspended')
  final bool? suspended;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  final List<Facility>? _facilities;
  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? staffNumber;
  @override
  final Facility? defaultFacility;
  final List<Facility>? _linkedFacilities;
  @override
  List<Facility>? get linkedFacilities {
    final value = _linkedFacilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final User? user;
  @override
  final String? defaultFacilityName;
// invited communities
  @override
  final CommunitiesState? communitiesState;
// recently shared health diary entries
  final List<HealthDiaryEntry?>? _clientSharedDiaryEntries;
// recently shared health diary entries
  @override
  List<HealthDiaryEntry?>? get clientSharedDiaryEntries {
    final value = _clientSharedDiaryEntries;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// staff notifications
  final List<NotificationDetails?>? _notifications;
// staff notifications
  @override
  List<NotificationDetails?>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Caregiver?>? _clientCaregivers;
  @override
  List<Caregiver?>? get clientCaregivers {
    final value = _clientCaregivers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ManagedClient>? _managedClients;
  @override
  List<ManagedClient>? get managedClients {
    final value = _managedClients;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final NotificationFilterState? notificationFilterState;
  @override
  final Facility? currentFacility;

  @override
  String toString() {
    return 'UserProfile(id: $id, username: $username, name: $name, pinChangeRequired: $pinChangeRequired, hasSetPin: $hasSetPin, isPhoneVerified: $isPhoneVerified, hasSetSecurityQuestions: $hasSetSecurityQuestions, hasSetNickname: $hasSetNickname, pinUpdateRequired: $pinUpdateRequired, termsAccepted: $termsAccepted, suspended: $suspended, userId: $userId, active: $active, facilities: $facilities, staffNumber: $staffNumber, defaultFacility: $defaultFacility, linkedFacilities: $linkedFacilities, user: $user, defaultFacilityName: $defaultFacilityName, communitiesState: $communitiesState, clientSharedDiaryEntries: $clientSharedDiaryEntries, notifications: $notifications, clientCaregivers: $clientCaregivers, managedClients: $managedClients, notificationFilterState: $notificationFilterState, currentFacility: $currentFacility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pinChangeRequired, pinChangeRequired) ||
                other.pinChangeRequired == pinChangeRequired) &&
            (identical(other.hasSetPin, hasSetPin) ||
                other.hasSetPin == hasSetPin) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(
                    other.hasSetSecurityQuestions, hasSetSecurityQuestions) ||
                other.hasSetSecurityQuestions == hasSetSecurityQuestions) &&
            (identical(other.hasSetNickname, hasSetNickname) ||
                other.hasSetNickname == hasSetNickname) &&
            (identical(other.pinUpdateRequired, pinUpdateRequired) ||
                other.pinUpdateRequired == pinUpdateRequired) &&
            (identical(other.termsAccepted, termsAccepted) ||
                other.termsAccepted == termsAccepted) &&
            (identical(other.suspended, suspended) ||
                other.suspended == suspended) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.active, active) || other.active == active) &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            (identical(other.staffNumber, staffNumber) ||
                other.staffNumber == staffNumber) &&
            (identical(other.defaultFacility, defaultFacility) ||
                other.defaultFacility == defaultFacility) &&
            const DeepCollectionEquality()
                .equals(other._linkedFacilities, _linkedFacilities) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.defaultFacilityName, defaultFacilityName) ||
                other.defaultFacilityName == defaultFacilityName) &&
            (identical(other.communitiesState, communitiesState) ||
                other.communitiesState == communitiesState) &&
            const DeepCollectionEquality().equals(
                other._clientSharedDiaryEntries, _clientSharedDiaryEntries) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            const DeepCollectionEquality()
                .equals(other._clientCaregivers, _clientCaregivers) &&
            const DeepCollectionEquality()
                .equals(other._managedClients, _managedClients) &&
            (identical(
                    other.notificationFilterState, notificationFilterState) ||
                other.notificationFilterState == notificationFilterState) &&
            (identical(other.currentFacility, currentFacility) ||
                other.currentFacility == currentFacility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        username,
        name,
        pinChangeRequired,
        hasSetPin,
        isPhoneVerified,
        hasSetSecurityQuestions,
        hasSetNickname,
        pinUpdateRequired,
        termsAccepted,
        suspended,
        userId,
        active,
        const DeepCollectionEquality().hash(_facilities),
        staffNumber,
        defaultFacility,
        const DeepCollectionEquality().hash(_linkedFacilities),
        user,
        defaultFacilityName,
        communitiesState,
        const DeepCollectionEquality().hash(_clientSharedDiaryEntries),
        const DeepCollectionEquality().hash(_notifications),
        const DeepCollectionEquality().hash(_clientCaregivers),
        const DeepCollectionEquality().hash(_managedClients),
        notificationFilterState,
        currentFacility
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      __$$_UserProfileCopyWithImpl<_$_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  factory _UserProfile(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'username')
          final String? username,
      @JsonKey(name: 'name')
          final String? name,
      @JsonKey(name: 'pinChangeRequired')
          final bool? pinChangeRequired,
      @JsonKey(name: 'hasSetPin')
          final bool? hasSetPin,
      @JsonKey(name: 'isPhoneVerified')
          final bool? isPhoneVerified,
      @JsonKey(name: 'hasSetSecurityQuestions')
          final bool? hasSetSecurityQuestions,
      @JsonKey(name: 'hasSetNickname')
          final bool? hasSetNickname,
      @JsonKey(name: 'pinUpdateRequired')
          final bool? pinUpdateRequired,
      @JsonKey(name: 'termsAccepted')
          final bool? termsAccepted,
      @JsonKey(name: 'suspended')
          final bool? suspended,
      @JsonKey(name: 'user_id')
          final String? userId,
      @JsonKey(name: 'active', defaultValue: false)
          final bool? active,
      @JsonKey(name: 'facilities')
          final List<Facility>? facilities,
      final String? staffNumber,
      final Facility? defaultFacility,
      final List<Facility>? linkedFacilities,
      final User? user,
      final String? defaultFacilityName,
      final CommunitiesState? communitiesState,
      final List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      final List<NotificationDetails?>? notifications,
      final List<Caregiver?>? clientCaregivers,
      final List<ManagedClient>? managedClients,
      final NotificationFilterState? notificationFilterState,
      final Facility? currentFacility}) = _$_UserProfile;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$_UserProfile.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override // This is the nickname
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'name')
  String? get name;
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
  @JsonKey(name: 'hasSetNickname')
  bool? get hasSetNickname;
  @override

  /// Used to indicate that the user's PIN has been reset by someone else
  ///
  /// This is used to trigger the change PIN workflow
  @JsonKey(name: 'pinUpdateRequired')
  bool? get pinUpdateRequired;
  @override
  @JsonKey(name: 'termsAccepted')
  bool? get termsAccepted;
  @override
  @JsonKey(name: 'suspended')
  bool? get suspended;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities;
  @override
  String? get staffNumber;
  @override
  Facility? get defaultFacility;
  @override
  List<Facility>? get linkedFacilities;
  @override
  User? get user;
  @override
  String? get defaultFacilityName;
  @override // invited communities
  CommunitiesState? get communitiesState;
  @override // recently shared health diary entries
  List<HealthDiaryEntry?>? get clientSharedDiaryEntries;
  @override // staff notifications
  List<NotificationDetails?>? get notifications;
  @override
  List<Caregiver?>? get clientCaregivers;
  @override
  List<ManagedClient>? get managedClients;
  @override
  NotificationFilterState? get notificationFilterState;
  @override
  Facility? get currentFacility;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileCopyWith<_$_UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
