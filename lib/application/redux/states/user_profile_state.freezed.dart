// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileState _$UserProfileStateFromJson(Map<String, dynamic> json) {
  return _UserProfileState.fromJson(json);
}

/// @nodoc
mixin _$UserProfileState {
  UserProfile? get userProfile => throw _privateConstructorUsedError;
  ProgramsState? get programsState => throw _privateConstructorUsedError;
  FacilitiesState? get facilitiesState => throw _privateConstructorUsedError;
  OrganisationState? get organizationState =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileStateCopyWith<UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileStateCopyWith<$Res> {
  factory $UserProfileStateCopyWith(
          UserProfileState value, $Res Function(UserProfileState) then) =
      _$UserProfileStateCopyWithImpl<$Res>;
  $Res call(
      {UserProfile? userProfile,
      ProgramsState? programsState,
      FacilitiesState? facilitiesState,
      OrganisationState? organizationState});

  $UserProfileCopyWith<$Res>? get userProfile;
  $ProgramsStateCopyWith<$Res>? get programsState;
  $FacilitiesStateCopyWith<$Res>? get facilitiesState;
  $OrganisationStateCopyWith<$Res>? get organizationState;
}

/// @nodoc
class _$UserProfileStateCopyWithImpl<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  _$UserProfileStateCopyWithImpl(this._value, this._then);

  final UserProfileState _value;
  // ignore: unused_field
  final $Res Function(UserProfileState) _then;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? programsState = freezed,
    Object? facilitiesState = freezed,
    Object? organizationState = freezed,
  }) {
    return _then(_value.copyWith(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      programsState: programsState == freezed
          ? _value.programsState
          : programsState // ignore: cast_nullable_to_non_nullable
              as ProgramsState?,
      facilitiesState: facilitiesState == freezed
          ? _value.facilitiesState
          : facilitiesState // ignore: cast_nullable_to_non_nullable
              as FacilitiesState?,
      organizationState: organizationState == freezed
          ? _value.organizationState
          : organizationState // ignore: cast_nullable_to_non_nullable
              as OrganisationState?,
    ));
  }

  @override
  $UserProfileCopyWith<$Res>? get userProfile {
    if (_value.userProfile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_value.userProfile!, (value) {
      return _then(_value.copyWith(userProfile: value));
    });
  }

  @override
  $ProgramsStateCopyWith<$Res>? get programsState {
    if (_value.programsState == null) {
      return null;
    }

    return $ProgramsStateCopyWith<$Res>(_value.programsState!, (value) {
      return _then(_value.copyWith(programsState: value));
    });
  }

  @override
  $FacilitiesStateCopyWith<$Res>? get facilitiesState {
    if (_value.facilitiesState == null) {
      return null;
    }

    return $FacilitiesStateCopyWith<$Res>(_value.facilitiesState!, (value) {
      return _then(_value.copyWith(facilitiesState: value));
    });
  }

  @override
  $OrganisationStateCopyWith<$Res>? get organizationState {
    if (_value.organizationState == null) {
      return null;
    }

    return $OrganisationStateCopyWith<$Res>(_value.organizationState!, (value) {
      return _then(_value.copyWith(organizationState: value));
    });
  }
}

/// @nodoc
abstract class _$$_UserProfileStateCopyWith<$Res>
    implements $UserProfileStateCopyWith<$Res> {
  factory _$$_UserProfileStateCopyWith(
          _$_UserProfileState value, $Res Function(_$_UserProfileState) then) =
      __$$_UserProfileStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {UserProfile? userProfile,
      ProgramsState? programsState,
      FacilitiesState? facilitiesState,
      OrganisationState? organizationState});

  @override
  $UserProfileCopyWith<$Res>? get userProfile;
  @override
  $ProgramsStateCopyWith<$Res>? get programsState;
  @override
  $FacilitiesStateCopyWith<$Res>? get facilitiesState;
  @override
  $OrganisationStateCopyWith<$Res>? get organizationState;
}

/// @nodoc
class __$$_UserProfileStateCopyWithImpl<$Res>
    extends _$UserProfileStateCopyWithImpl<$Res>
    implements _$$_UserProfileStateCopyWith<$Res> {
  __$$_UserProfileStateCopyWithImpl(
      _$_UserProfileState _value, $Res Function(_$_UserProfileState) _then)
      : super(_value, (v) => _then(v as _$_UserProfileState));

  @override
  _$_UserProfileState get _value => super._value as _$_UserProfileState;

  @override
  $Res call({
    Object? userProfile = freezed,
    Object? programsState = freezed,
    Object? facilitiesState = freezed,
    Object? organizationState = freezed,
  }) {
    return _then(_$_UserProfileState(
      userProfile: userProfile == freezed
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile?,
      programsState: programsState == freezed
          ? _value.programsState
          : programsState // ignore: cast_nullable_to_non_nullable
              as ProgramsState?,
      facilitiesState: facilitiesState == freezed
          ? _value.facilitiesState
          : facilitiesState // ignore: cast_nullable_to_non_nullable
              as FacilitiesState?,
      organizationState: organizationState == freezed
          ? _value.organizationState
          : organizationState // ignore: cast_nullable_to_non_nullable
              as OrganisationState?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserProfileState implements _UserProfileState {
  _$_UserProfileState(
      {this.userProfile,
      this.programsState,
      this.facilitiesState,
      this.organizationState});

  factory _$_UserProfileState.fromJson(Map<String, dynamic> json) =>
      _$$_UserProfileStateFromJson(json);

  @override
  final UserProfile? userProfile;
  @override
  final ProgramsState? programsState;
  @override
  final FacilitiesState? facilitiesState;
  @override
  final OrganisationState? organizationState;

  @override
  String toString() {
    return 'UserProfileState(userProfile: $userProfile, programsState: $programsState, facilitiesState: $facilitiesState, organizationState: $organizationState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserProfileState &&
            const DeepCollectionEquality()
                .equals(other.userProfile, userProfile) &&
            const DeepCollectionEquality()
                .equals(other.programsState, programsState) &&
            const DeepCollectionEquality()
                .equals(other.facilitiesState, facilitiesState) &&
            const DeepCollectionEquality()
                .equals(other.organizationState, organizationState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userProfile),
      const DeepCollectionEquality().hash(programsState),
      const DeepCollectionEquality().hash(facilitiesState),
      const DeepCollectionEquality().hash(organizationState));

  @JsonKey(ignore: true)
  @override
  _$$_UserProfileStateCopyWith<_$_UserProfileState> get copyWith =>
      __$$_UserProfileStateCopyWithImpl<_$_UserProfileState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserProfileStateToJson(
      this,
    );
  }
}

abstract class _UserProfileState implements UserProfileState {
  factory _UserProfileState(
      {final UserProfile? userProfile,
      final ProgramsState? programsState,
      final FacilitiesState? facilitiesState,
      final OrganisationState? organizationState}) = _$_UserProfileState;

  factory _UserProfileState.fromJson(Map<String, dynamic> json) =
      _$_UserProfileState.fromJson;

  @override
  UserProfile? get userProfile;
  @override
  ProgramsState? get programsState;
  @override
  FacilitiesState? get facilitiesState;
  @override
  OrganisationState? get organizationState;
  @override
  @JsonKey(ignore: true)
  _$$_UserProfileStateCopyWith<_$_UserProfileState> get copyWith =>
      throw _privateConstructorUsedError;
}
