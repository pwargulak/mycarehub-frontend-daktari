// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'staff_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffState _$StaffStateFromJson(Map<String, dynamic> json) {
  return _StaffState.fromJson(json);
}

/// @nodoc
mixin _$StaffState {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active => throw _privateConstructorUsedError;
  @JsonKey(name: 'staff_number')
  String? get staffNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities => throw _privateConstructorUsedError;
  List<Facility>? get linkedFacilities => throw _privateConstructorUsedError;
  @JsonKey(name: 'default_facility')
  String? get defaultFacility => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacilityName')
  String? get defaultFacilityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError; // invited communities
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
  $StaffStateCopyWith<StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffStateCopyWith<$Res> {
  factory $StaffStateCopyWith(
          StaffState value, $Res Function(StaffState) then) =
      _$StaffStateCopyWithImpl<$Res, StaffState>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'staff_number') String? staffNumber,
      @JsonKey(name: 'facilities') List<Facility>? facilities,
      List<Facility>? linkedFacilities,
      @JsonKey(name: 'default_facility') String? defaultFacility,
      @JsonKey(name: 'defaultFacilityName') String? defaultFacilityName,
      @JsonKey(name: 'user') User? user,
      CommunitiesState? communitiesState,
      List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      List<NotificationDetails?>? notifications,
      List<Caregiver?>? clientCaregivers,
      List<ManagedClient>? managedClients,
      NotificationFilterState? notificationFilterState,
      Facility? currentFacility});

  $UserCopyWith<$Res>? get user;
  $CommunitiesStateCopyWith<$Res>? get communitiesState;
  $NotificationFilterStateCopyWith<$Res>? get notificationFilterState;
  $FacilityCopyWith<$Res>? get currentFacility;
}

/// @nodoc
class _$StaffStateCopyWithImpl<$Res, $Val extends StaffState>
    implements $StaffStateCopyWith<$Res> {
  _$StaffStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? active = freezed,
    Object? staffNumber = freezed,
    Object? facilities = freezed,
    Object? linkedFacilities = freezed,
    Object? defaultFacility = freezed,
    Object? defaultFacilityName = freezed,
    Object? user = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: freezed == staffNumber
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      facilities: freezed == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      linkedFacilities: freezed == linkedFacilities
          ? _value.linkedFacilities
          : linkedFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacilityName: freezed == defaultFacilityName
          ? _value.defaultFacilityName
          : defaultFacilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
abstract class _$$_StaffStateCopyWith<$Res>
    implements $StaffStateCopyWith<$Res> {
  factory _$$_StaffStateCopyWith(
          _$_StaffState value, $Res Function(_$_StaffState) then) =
      __$$_StaffStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'active', defaultValue: false) bool? active,
      @JsonKey(name: 'staff_number') String? staffNumber,
      @JsonKey(name: 'facilities') List<Facility>? facilities,
      List<Facility>? linkedFacilities,
      @JsonKey(name: 'default_facility') String? defaultFacility,
      @JsonKey(name: 'defaultFacilityName') String? defaultFacilityName,
      @JsonKey(name: 'user') User? user,
      CommunitiesState? communitiesState,
      List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      List<NotificationDetails?>? notifications,
      List<Caregiver?>? clientCaregivers,
      List<ManagedClient>? managedClients,
      NotificationFilterState? notificationFilterState,
      Facility? currentFacility});

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
class __$$_StaffStateCopyWithImpl<$Res>
    extends _$StaffStateCopyWithImpl<$Res, _$_StaffState>
    implements _$$_StaffStateCopyWith<$Res> {
  __$$_StaffStateCopyWithImpl(
      _$_StaffState _value, $Res Function(_$_StaffState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? active = freezed,
    Object? staffNumber = freezed,
    Object? facilities = freezed,
    Object? linkedFacilities = freezed,
    Object? defaultFacility = freezed,
    Object? defaultFacilityName = freezed,
    Object? user = freezed,
    Object? communitiesState = freezed,
    Object? clientSharedDiaryEntries = freezed,
    Object? notifications = freezed,
    Object? clientCaregivers = freezed,
    Object? managedClients = freezed,
    Object? notificationFilterState = freezed,
    Object? currentFacility = freezed,
  }) {
    return _then(_$_StaffState(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: freezed == staffNumber
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      facilities: freezed == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      linkedFacilities: freezed == linkedFacilities
          ? _value._linkedFacilities
          : linkedFacilities // ignore: cast_nullable_to_non_nullable
              as List<Facility>?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacilityName: freezed == defaultFacilityName
          ? _value.defaultFacilityName
          : defaultFacilityName // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
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
class _$_StaffState implements _StaffState {
  _$_StaffState(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'active', defaultValue: false) this.active,
      @JsonKey(name: 'staff_number') this.staffNumber,
      @JsonKey(name: 'facilities') final List<Facility>? facilities,
      final List<Facility>? linkedFacilities,
      @JsonKey(name: 'default_facility') this.defaultFacility,
      @JsonKey(name: 'defaultFacilityName') this.defaultFacilityName,
      @JsonKey(name: 'user') this.user,
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

  factory _$_StaffState.fromJson(Map<String, dynamic> json) =>
      _$$_StaffStateFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  final bool? active;
  @override
  @JsonKey(name: 'staff_number')
  final String? staffNumber;
  final List<Facility>? _facilities;
  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Facility>? _linkedFacilities;
  @override
  List<Facility>? get linkedFacilities {
    final value = _linkedFacilities;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'default_facility')
  final String? defaultFacility;
  @override
  @JsonKey(name: 'defaultFacilityName')
  final String? defaultFacilityName;
  @override
  @JsonKey(name: 'user')
  final User? user;
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
    return 'StaffState(id: $id, userId: $userId, active: $active, staffNumber: $staffNumber, facilities: $facilities, linkedFacilities: $linkedFacilities, defaultFacility: $defaultFacility, defaultFacilityName: $defaultFacilityName, user: $user, communitiesState: $communitiesState, clientSharedDiaryEntries: $clientSharedDiaryEntries, notifications: $notifications, clientCaregivers: $clientCaregivers, managedClients: $managedClients, notificationFilterState: $notificationFilterState, currentFacility: $currentFacility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StaffState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.staffNumber, staffNumber) ||
                other.staffNumber == staffNumber) &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            const DeepCollectionEquality()
                .equals(other._linkedFacilities, _linkedFacilities) &&
            (identical(other.defaultFacility, defaultFacility) ||
                other.defaultFacility == defaultFacility) &&
            (identical(other.defaultFacilityName, defaultFacilityName) ||
                other.defaultFacilityName == defaultFacilityName) &&
            (identical(other.user, user) || other.user == user) &&
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
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      active,
      staffNumber,
      const DeepCollectionEquality().hash(_facilities),
      const DeepCollectionEquality().hash(_linkedFacilities),
      defaultFacility,
      defaultFacilityName,
      user,
      communitiesState,
      const DeepCollectionEquality().hash(_clientSharedDiaryEntries),
      const DeepCollectionEquality().hash(_notifications),
      const DeepCollectionEquality().hash(_clientCaregivers),
      const DeepCollectionEquality().hash(_managedClients),
      notificationFilterState,
      currentFacility);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StaffStateCopyWith<_$_StaffState> get copyWith =>
      __$$_StaffStateCopyWithImpl<_$_StaffState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StaffStateToJson(
      this,
    );
  }
}

abstract class _StaffState implements StaffState {
  factory _StaffState(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'user_id') final String? userId,
      @JsonKey(name: 'active', defaultValue: false) final bool? active,
      @JsonKey(name: 'staff_number') final String? staffNumber,
      @JsonKey(name: 'facilities') final List<Facility>? facilities,
      final List<Facility>? linkedFacilities,
      @JsonKey(name: 'default_facility') final String? defaultFacility,
      @JsonKey(name: 'defaultFacilityName') final String? defaultFacilityName,
      @JsonKey(name: 'user') final User? user,
      final CommunitiesState? communitiesState,
      final List<HealthDiaryEntry?>? clientSharedDiaryEntries,
      final List<NotificationDetails?>? notifications,
      final List<Caregiver?>? clientCaregivers,
      final List<ManagedClient>? managedClients,
      final NotificationFilterState? notificationFilterState,
      final Facility? currentFacility}) = _$_StaffState;

  factory _StaffState.fromJson(Map<String, dynamic> json) =
      _$_StaffState.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'user_id')
  String? get userId;
  @override
  @JsonKey(name: 'active', defaultValue: false)
  bool? get active;
  @override
  @JsonKey(name: 'staff_number')
  String? get staffNumber;
  @override
  @JsonKey(name: 'facilities')
  List<Facility>? get facilities;
  @override
  List<Facility>? get linkedFacilities;
  @override
  @JsonKey(name: 'default_facility')
  String? get defaultFacility;
  @override
  @JsonKey(name: 'defaultFacilityName')
  String? get defaultFacilityName;
  @override
  @JsonKey(name: 'user')
  User? get user;
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
  _$$_StaffStateCopyWith<_$_StaffState> get copyWith =>
      throw _privateConstructorUsedError;
}
