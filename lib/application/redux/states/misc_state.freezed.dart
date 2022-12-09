// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'misc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MiscState _$MiscStateFromJson(Map<String, dynamic> json) {
  return _MiscState.fromJson(json);
}

/// @nodoc
mixin _$MiscState {
  String? get initialRoute => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  FAQsContentState? get profileFAQsContentState =>
      throw _privateConstructorUsedError;
  List<Member>? get communityMembers => throw _privateConstructorUsedError;
  Facility? get selectedFacility => throw _privateConstructorUsedError;
  Organisation? get selectedOrganisation => throw _privateConstructorUsedError;
  GroupState? get groupState => throw _privateConstructorUsedError;
  SearchUserResponseState? get searchUserResponseState =>
      throw _privateConstructorUsedError;
  String? get inactiveTime => throw _privateConstructorUsedError;
  bool? get resumeWithPin => throw _privateConstructorUsedError;
  bool? get updateFacility => throw _privateConstructorUsedError;
  SearchCaregiverResponseState? get searchCaregiverResponseState =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res, MiscState>;
  @useResult
  $Res call(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      List<Member>? communityMembers,
      Facility? selectedFacility,
      Organisation? selectedOrganisation,
      GroupState? groupState,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime,
      bool? resumeWithPin,
      bool? updateFacility,
      SearchCaregiverResponseState? searchCaregiverResponseState});

  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  $FacilityCopyWith<$Res>? get selectedFacility;
  $OrganisationCopyWith<$Res>? get selectedOrganisation;
  $GroupStateCopyWith<$Res>? get groupState;
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState;
  $SearchCaregiverResponseStateCopyWith<$Res>? get searchCaregiverResponseState;
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res, $Val extends MiscState>
    implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
    Object? profileFAQsContentState = freezed,
    Object? communityMembers = freezed,
    Object? selectedFacility = freezed,
    Object? selectedOrganisation = freezed,
    Object? groupState = freezed,
    Object? searchUserResponseState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? updateFacility = freezed,
    Object? searchCaregiverResponseState = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: freezed == initialRoute
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFAQsContentState: freezed == profileFAQsContentState
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      communityMembers: freezed == communityMembers
          ? _value.communityMembers
          : communityMembers // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
      selectedFacility: freezed == selectedFacility
          ? _value.selectedFacility
          : selectedFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      selectedOrganisation: freezed == selectedOrganisation
          ? _value.selectedOrganisation
          : selectedOrganisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      groupState: freezed == groupState
          ? _value.groupState
          : groupState // ignore: cast_nullable_to_non_nullable
              as GroupState?,
      searchUserResponseState: freezed == searchUserResponseState
          ? _value.searchUserResponseState
          : searchUserResponseState // ignore: cast_nullable_to_non_nullable
              as SearchUserResponseState?,
      inactiveTime: freezed == inactiveTime
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: freezed == resumeWithPin
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateFacility: freezed == updateFacility
          ? _value.updateFacility
          : updateFacility // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchCaregiverResponseState: freezed == searchCaregiverResponseState
          ? _value.searchCaregiverResponseState
          : searchCaregiverResponseState // ignore: cast_nullable_to_non_nullable
              as SearchCaregiverResponseState?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState {
    if (_value.profileFAQsContentState == null) {
      return null;
    }

    return $FAQsContentStateCopyWith<$Res>(_value.profileFAQsContentState!,
        (value) {
      return _then(_value.copyWith(profileFAQsContentState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityCopyWith<$Res>? get selectedFacility {
    if (_value.selectedFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.selectedFacility!, (value) {
      return _then(_value.copyWith(selectedFacility: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OrganisationCopyWith<$Res>? get selectedOrganisation {
    if (_value.selectedOrganisation == null) {
      return null;
    }

    return $OrganisationCopyWith<$Res>(_value.selectedOrganisation!, (value) {
      return _then(_value.copyWith(selectedOrganisation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupStateCopyWith<$Res>? get groupState {
    if (_value.groupState == null) {
      return null;
    }

    return $GroupStateCopyWith<$Res>(_value.groupState!, (value) {
      return _then(_value.copyWith(groupState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState {
    if (_value.searchUserResponseState == null) {
      return null;
    }

    return $SearchUserResponseStateCopyWith<$Res>(
        _value.searchUserResponseState!, (value) {
      return _then(_value.copyWith(searchUserResponseState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SearchCaregiverResponseStateCopyWith<$Res>?
      get searchCaregiverResponseState {
    if (_value.searchCaregiverResponseState == null) {
      return null;
    }

    return $SearchCaregiverResponseStateCopyWith<$Res>(
        _value.searchCaregiverResponseState!, (value) {
      return _then(
          _value.copyWith(searchCaregiverResponseState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$$_MiscStateCopyWith(
          _$_MiscState value, $Res Function(_$_MiscState) then) =
      __$$_MiscStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      List<Member>? communityMembers,
      Facility? selectedFacility,
      Organisation? selectedOrganisation,
      GroupState? groupState,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime,
      bool? resumeWithPin,
      bool? updateFacility,
      SearchCaregiverResponseState? searchCaregiverResponseState});

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  @override
  $FacilityCopyWith<$Res>? get selectedFacility;
  @override
  $OrganisationCopyWith<$Res>? get selectedOrganisation;
  @override
  $GroupStateCopyWith<$Res>? get groupState;
  @override
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState;
  @override
  $SearchCaregiverResponseStateCopyWith<$Res>? get searchCaregiverResponseState;
}

/// @nodoc
class __$$_MiscStateCopyWithImpl<$Res>
    extends _$MiscStateCopyWithImpl<$Res, _$_MiscState>
    implements _$$_MiscStateCopyWith<$Res> {
  __$$_MiscStateCopyWithImpl(
      _$_MiscState _value, $Res Function(_$_MiscState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
    Object? profileFAQsContentState = freezed,
    Object? communityMembers = freezed,
    Object? selectedFacility = freezed,
    Object? selectedOrganisation = freezed,
    Object? groupState = freezed,
    Object? searchUserResponseState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? updateFacility = freezed,
    Object? searchCaregiverResponseState = freezed,
  }) {
    return _then(_$_MiscState(
      initialRoute: freezed == initialRoute
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFAQsContentState: freezed == profileFAQsContentState
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      communityMembers: freezed == communityMembers
          ? _value._communityMembers
          : communityMembers // ignore: cast_nullable_to_non_nullable
              as List<Member>?,
      selectedFacility: freezed == selectedFacility
          ? _value.selectedFacility
          : selectedFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      selectedOrganisation: freezed == selectedOrganisation
          ? _value.selectedOrganisation
          : selectedOrganisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      groupState: freezed == groupState
          ? _value.groupState
          : groupState // ignore: cast_nullable_to_non_nullable
              as GroupState?,
      searchUserResponseState: freezed == searchUserResponseState
          ? _value.searchUserResponseState
          : searchUserResponseState // ignore: cast_nullable_to_non_nullable
              as SearchUserResponseState?,
      inactiveTime: freezed == inactiveTime
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: freezed == resumeWithPin
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateFacility: freezed == updateFacility
          ? _value.updateFacility
          : updateFacility // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchCaregiverResponseState: freezed == searchCaregiverResponseState
          ? _value.searchCaregiverResponseState
          : searchCaregiverResponseState // ignore: cast_nullable_to_non_nullable
              as SearchCaregiverResponseState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MiscState implements _MiscState {
  _$_MiscState(
      {this.initialRoute,
      this.error,
      this.profileFAQsContentState,
      final List<Member>? communityMembers,
      this.selectedFacility,
      this.selectedOrganisation,
      this.groupState,
      this.searchUserResponseState,
      this.inactiveTime,
      this.resumeWithPin,
      this.updateFacility,
      this.searchCaregiverResponseState})
      : _communityMembers = communityMembers;

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$$_MiscStateFromJson(json);

  @override
  final String? initialRoute;
  @override
  final String? error;
  @override
  final FAQsContentState? profileFAQsContentState;
  final List<Member>? _communityMembers;
  @override
  List<Member>? get communityMembers {
    final value = _communityMembers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Facility? selectedFacility;
  @override
  final Organisation? selectedOrganisation;
  @override
  final GroupState? groupState;
  @override
  final SearchUserResponseState? searchUserResponseState;
  @override
  final String? inactiveTime;
  @override
  final bool? resumeWithPin;
  @override
  final bool? updateFacility;
  @override
  final SearchCaregiverResponseState? searchCaregiverResponseState;

  @override
  String toString() {
    return 'MiscState(initialRoute: $initialRoute, error: $error, profileFAQsContentState: $profileFAQsContentState, communityMembers: $communityMembers, selectedFacility: $selectedFacility, selectedOrganisation: $selectedOrganisation, groupState: $groupState, searchUserResponseState: $searchUserResponseState, inactiveTime: $inactiveTime, resumeWithPin: $resumeWithPin, updateFacility: $updateFacility, searchCaregiverResponseState: $searchCaregiverResponseState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MiscState &&
            (identical(other.initialRoute, initialRoute) ||
                other.initialRoute == initialRoute) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(
                    other.profileFAQsContentState, profileFAQsContentState) ||
                other.profileFAQsContentState == profileFAQsContentState) &&
            const DeepCollectionEquality()
                .equals(other._communityMembers, _communityMembers) &&
            (identical(other.selectedFacility, selectedFacility) ||
                other.selectedFacility == selectedFacility) &&
            (identical(other.selectedOrganisation, selectedOrganisation) ||
                other.selectedOrganisation == selectedOrganisation) &&
            (identical(other.groupState, groupState) ||
                other.groupState == groupState) &&
            (identical(
                    other.searchUserResponseState, searchUserResponseState) ||
                other.searchUserResponseState == searchUserResponseState) &&
            (identical(other.inactiveTime, inactiveTime) ||
                other.inactiveTime == inactiveTime) &&
            (identical(other.resumeWithPin, resumeWithPin) ||
                other.resumeWithPin == resumeWithPin) &&
            (identical(other.updateFacility, updateFacility) ||
                other.updateFacility == updateFacility) &&
            (identical(other.searchCaregiverResponseState,
                    searchCaregiverResponseState) ||
                other.searchCaregiverResponseState ==
                    searchCaregiverResponseState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      initialRoute,
      error,
      profileFAQsContentState,
      const DeepCollectionEquality().hash(_communityMembers),
      selectedFacility,
      selectedOrganisation,
      groupState,
      searchUserResponseState,
      inactiveTime,
      resumeWithPin,
      updateFacility,
      searchCaregiverResponseState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MiscStateCopyWith<_$_MiscState> get copyWith =>
      __$$_MiscStateCopyWithImpl<_$_MiscState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MiscStateToJson(
      this,
    );
  }
}

abstract class _MiscState implements MiscState {
  factory _MiscState(
          {final String? initialRoute,
          final String? error,
          final FAQsContentState? profileFAQsContentState,
          final List<Member>? communityMembers,
          final Facility? selectedFacility,
          final Organisation? selectedOrganisation,
          final GroupState? groupState,
          final SearchUserResponseState? searchUserResponseState,
          final String? inactiveTime,
          final bool? resumeWithPin,
          final bool? updateFacility,
          final SearchCaregiverResponseState? searchCaregiverResponseState}) =
      _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get initialRoute;
  @override
  String? get error;
  @override
  FAQsContentState? get profileFAQsContentState;
  @override
  List<Member>? get communityMembers;
  @override
  Facility? get selectedFacility;
  @override
  Organisation? get selectedOrganisation;
  @override
  GroupState? get groupState;
  @override
  SearchUserResponseState? get searchUserResponseState;
  @override
  String? get inactiveTime;
  @override
  bool? get resumeWithPin;
  @override
  bool? get updateFacility;
  @override
  SearchCaregiverResponseState? get searchCaregiverResponseState;
  @override
  @JsonKey(ignore: true)
  _$$_MiscStateCopyWith<_$_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
