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
  Facility? get selectedFacility => throw _privateConstructorUsedError;
  Organisation? get selectedOrganisation => throw _privateConstructorUsedError;
  SearchUserResponseState? get searchUserResponseState =>
      throw _privateConstructorUsedError;
  String? get inactiveTime => throw _privateConstructorUsedError;
  bool? get resumeWithPin => throw _privateConstructorUsedError;
  bool? get updateFacility => throw _privateConstructorUsedError;
  SearchCaregiverResponseState? get searchCaregiverResponseState =>
      throw _privateConstructorUsedError;
  bool? get userExists => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MiscStateCopyWith<MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MiscStateCopyWith<$Res> {
  factory $MiscStateCopyWith(MiscState value, $Res Function(MiscState) then) =
      _$MiscStateCopyWithImpl<$Res>;
  $Res call(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      Facility? selectedFacility,
      Organisation? selectedOrganisation,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime,
      bool? resumeWithPin,
      bool? updateFacility,
      SearchCaregiverResponseState? searchCaregiverResponseState,
      bool? userExists});

  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  $FacilityCopyWith<$Res>? get selectedFacility;
  $OrganisationCopyWith<$Res>? get selectedOrganisation;
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState;
  $SearchCaregiverResponseStateCopyWith<$Res>? get searchCaregiverResponseState;
}

/// @nodoc
class _$MiscStateCopyWithImpl<$Res> implements $MiscStateCopyWith<$Res> {
  _$MiscStateCopyWithImpl(this._value, this._then);

  final MiscState _value;
  // ignore: unused_field
  final $Res Function(MiscState) _then;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
    Object? profileFAQsContentState = freezed,
    Object? selectedFacility = freezed,
    Object? selectedOrganisation = freezed,
    Object? searchUserResponseState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? updateFacility = freezed,
    Object? searchCaregiverResponseState = freezed,
    Object? userExists = freezed,
  }) {
    return _then(_value.copyWith(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFAQsContentState: profileFAQsContentState == freezed
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      selectedFacility: selectedFacility == freezed
          ? _value.selectedFacility
          : selectedFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      selectedOrganisation: selectedOrganisation == freezed
          ? _value.selectedOrganisation
          : selectedOrganisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      searchUserResponseState: searchUserResponseState == freezed
          ? _value.searchUserResponseState
          : searchUserResponseState // ignore: cast_nullable_to_non_nullable
              as SearchUserResponseState?,
      inactiveTime: inactiveTime == freezed
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: resumeWithPin == freezed
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateFacility: updateFacility == freezed
          ? _value.updateFacility
          : updateFacility // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchCaregiverResponseState: searchCaregiverResponseState == freezed
          ? _value.searchCaregiverResponseState
          : searchCaregiverResponseState // ignore: cast_nullable_to_non_nullable
              as SearchCaregiverResponseState?,
      userExists: userExists == freezed
          ? _value.userExists
          : userExists // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState {
    if (_value.profileFAQsContentState == null) {
      return null;
    }

    return $FAQsContentStateCopyWith<$Res>(_value.profileFAQsContentState!,
        (value) {
      return _then(_value.copyWith(profileFAQsContentState: value));
    });
  }

  @override
  $FacilityCopyWith<$Res>? get selectedFacility {
    if (_value.selectedFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.selectedFacility!, (value) {
      return _then(_value.copyWith(selectedFacility: value));
    });
  }

  @override
  $OrganisationCopyWith<$Res>? get selectedOrganisation {
    if (_value.selectedOrganisation == null) {
      return null;
    }

    return $OrganisationCopyWith<$Res>(_value.selectedOrganisation!, (value) {
      return _then(_value.copyWith(selectedOrganisation: value));
    });
  }

  @override
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState {
    if (_value.searchUserResponseState == null) {
      return null;
    }

    return $SearchUserResponseStateCopyWith<$Res>(
        _value.searchUserResponseState!, (value) {
      return _then(_value.copyWith(searchUserResponseState: value));
    });
  }

  @override
  $SearchCaregiverResponseStateCopyWith<$Res>?
      get searchCaregiverResponseState {
    if (_value.searchCaregiverResponseState == null) {
      return null;
    }

    return $SearchCaregiverResponseStateCopyWith<$Res>(
        _value.searchCaregiverResponseState!, (value) {
      return _then(_value.copyWith(searchCaregiverResponseState: value));
    });
  }
}

/// @nodoc
abstract class _$$_MiscStateCopyWith<$Res> implements $MiscStateCopyWith<$Res> {
  factory _$$_MiscStateCopyWith(
          _$_MiscState value, $Res Function(_$_MiscState) then) =
      __$$_MiscStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? initialRoute,
      String? error,
      FAQsContentState? profileFAQsContentState,
      Facility? selectedFacility,
      Organisation? selectedOrganisation,
      SearchUserResponseState? searchUserResponseState,
      String? inactiveTime,
      bool? resumeWithPin,
      bool? updateFacility,
      SearchCaregiverResponseState? searchCaregiverResponseState,
      bool? userExists});

  @override
  $FAQsContentStateCopyWith<$Res>? get profileFAQsContentState;
  @override
  $FacilityCopyWith<$Res>? get selectedFacility;
  @override
  $OrganisationCopyWith<$Res>? get selectedOrganisation;
  @override
  $SearchUserResponseStateCopyWith<$Res>? get searchUserResponseState;
  @override
  $SearchCaregiverResponseStateCopyWith<$Res>? get searchCaregiverResponseState;
}

/// @nodoc
class __$$_MiscStateCopyWithImpl<$Res> extends _$MiscStateCopyWithImpl<$Res>
    implements _$$_MiscStateCopyWith<$Res> {
  __$$_MiscStateCopyWithImpl(
      _$_MiscState _value, $Res Function(_$_MiscState) _then)
      : super(_value, (v) => _then(v as _$_MiscState));

  @override
  _$_MiscState get _value => super._value as _$_MiscState;

  @override
  $Res call({
    Object? initialRoute = freezed,
    Object? error = freezed,
    Object? profileFAQsContentState = freezed,
    Object? selectedFacility = freezed,
    Object? selectedOrganisation = freezed,
    Object? searchUserResponseState = freezed,
    Object? inactiveTime = freezed,
    Object? resumeWithPin = freezed,
    Object? updateFacility = freezed,
    Object? searchCaregiverResponseState = freezed,
    Object? userExists = freezed,
  }) {
    return _then(_$_MiscState(
      initialRoute: initialRoute == freezed
          ? _value.initialRoute
          : initialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      profileFAQsContentState: profileFAQsContentState == freezed
          ? _value.profileFAQsContentState
          : profileFAQsContentState // ignore: cast_nullable_to_non_nullable
              as FAQsContentState?,
      selectedFacility: selectedFacility == freezed
          ? _value.selectedFacility
          : selectedFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      selectedOrganisation: selectedOrganisation == freezed
          ? _value.selectedOrganisation
          : selectedOrganisation // ignore: cast_nullable_to_non_nullable
              as Organisation?,
      searchUserResponseState: searchUserResponseState == freezed
          ? _value.searchUserResponseState
          : searchUserResponseState // ignore: cast_nullable_to_non_nullable
              as SearchUserResponseState?,
      inactiveTime: inactiveTime == freezed
          ? _value.inactiveTime
          : inactiveTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resumeWithPin: resumeWithPin == freezed
          ? _value.resumeWithPin
          : resumeWithPin // ignore: cast_nullable_to_non_nullable
              as bool?,
      updateFacility: updateFacility == freezed
          ? _value.updateFacility
          : updateFacility // ignore: cast_nullable_to_non_nullable
              as bool?,
      searchCaregiverResponseState: searchCaregiverResponseState == freezed
          ? _value.searchCaregiverResponseState
          : searchCaregiverResponseState // ignore: cast_nullable_to_non_nullable
              as SearchCaregiverResponseState?,
      userExists: userExists == freezed
          ? _value.userExists
          : userExists // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      this.selectedFacility,
      this.selectedOrganisation,
      this.searchUserResponseState,
      this.inactiveTime,
      this.resumeWithPin,
      this.updateFacility,
      this.searchCaregiverResponseState,
      this.userExists});

  factory _$_MiscState.fromJson(Map<String, dynamic> json) =>
      _$$_MiscStateFromJson(json);

  @override
  final String? initialRoute;
  @override
  final String? error;
  @override
  final FAQsContentState? profileFAQsContentState;
  @override
  final Facility? selectedFacility;
  @override
  final Organisation? selectedOrganisation;
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
  final bool? userExists;

  @override
  String toString() {
    return 'MiscState(initialRoute: $initialRoute, error: $error, profileFAQsContentState: $profileFAQsContentState, selectedFacility: $selectedFacility, selectedOrganisation: $selectedOrganisation, searchUserResponseState: $searchUserResponseState, inactiveTime: $inactiveTime, resumeWithPin: $resumeWithPin, updateFacility: $updateFacility, searchCaregiverResponseState: $searchCaregiverResponseState, userExists: $userExists)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MiscState &&
            const DeepCollectionEquality()
                .equals(other.initialRoute, initialRoute) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(
                other.profileFAQsContentState, profileFAQsContentState) &&
            const DeepCollectionEquality()
                .equals(other.selectedFacility, selectedFacility) &&
            const DeepCollectionEquality()
                .equals(other.selectedOrganisation, selectedOrganisation) &&
            const DeepCollectionEquality().equals(
                other.searchUserResponseState, searchUserResponseState) &&
            const DeepCollectionEquality()
                .equals(other.inactiveTime, inactiveTime) &&
            const DeepCollectionEquality()
                .equals(other.resumeWithPin, resumeWithPin) &&
            const DeepCollectionEquality()
                .equals(other.updateFacility, updateFacility) &&
            const DeepCollectionEquality().equals(
                other.searchCaregiverResponseState,
                searchCaregiverResponseState) &&
            const DeepCollectionEquality()
                .equals(other.userExists, userExists));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(initialRoute),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(profileFAQsContentState),
      const DeepCollectionEquality().hash(selectedFacility),
      const DeepCollectionEquality().hash(selectedOrganisation),
      const DeepCollectionEquality().hash(searchUserResponseState),
      const DeepCollectionEquality().hash(inactiveTime),
      const DeepCollectionEquality().hash(resumeWithPin),
      const DeepCollectionEquality().hash(updateFacility),
      const DeepCollectionEquality().hash(searchCaregiverResponseState),
      const DeepCollectionEquality().hash(userExists));

  @JsonKey(ignore: true)
  @override
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
      final Facility? selectedFacility,
      final Organisation? selectedOrganisation,
      final SearchUserResponseState? searchUserResponseState,
      final String? inactiveTime,
      final bool? resumeWithPin,
      final bool? updateFacility,
      final SearchCaregiverResponseState? searchCaregiverResponseState,
      final bool? userExists}) = _$_MiscState;

  factory _MiscState.fromJson(Map<String, dynamic> json) =
      _$_MiscState.fromJson;

  @override
  String? get initialRoute;
  @override
  String? get error;
  @override
  FAQsContentState? get profileFAQsContentState;
  @override
  Facility? get selectedFacility;
  @override
  Organisation? get selectedOrganisation;
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
  bool? get userExists;
  @override
  @JsonKey(ignore: true)
  _$$_MiscStateCopyWith<_$_MiscState> get copyWith =>
      throw _privateConstructorUsedError;
}
