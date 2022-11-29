// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchUserResponse _$SearchUserResponseFromJson(Map<String, dynamic> json) {
  return _SearchUserResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchUserResponse {
  @JsonKey(name: 'ID')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'CCCNumber')
  String? get clientCCCNumber =>
      throw _privateConstructorUsedError; // This is the CCCNumber if the person being searched is a client
  @JsonKey(name: 'Active')
  bool? get isActive =>
      throw _privateConstructorUsedError; // This is a boolean for checking if the user was deactivated from the platform
  @JsonKey(name: 'StaffNumber')
  String? get staffNumber =>
      throw _privateConstructorUsedError; // this is the staff number if the person being searched is a staff member
  @JsonKey(name: 'User')
  UserData? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'DefaultFacility')
  Facility? get defaultFacility => throw _privateConstructorUsedError;
  @JsonKey(name: 'rolesList')
  RolesList? get rolesList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchUserResponseCopyWith<SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserResponseCopyWith<$Res> {
  factory $SearchUserResponseCopyWith(
          SearchUserResponse value, $Res Function(SearchUserResponse) then) =
      _$SearchUserResponseCopyWithImpl<$Res, SearchUserResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'CCCNumber') String? clientCCCNumber,
      @JsonKey(name: 'Active') bool? isActive,
      @JsonKey(name: 'StaffNumber') String? staffNumber,
      @JsonKey(name: 'User') UserData? user,
      @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
      @JsonKey(name: 'rolesList') RolesList? rolesList});

  $UserDataCopyWith<$Res>? get user;
  $FacilityCopyWith<$Res>? get defaultFacility;
  $RolesListCopyWith<$Res>? get rolesList;
}

/// @nodoc
class _$SearchUserResponseCopyWithImpl<$Res, $Val extends SearchUserResponse>
    implements $SearchUserResponseCopyWith<$Res> {
  _$SearchUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clientCCCNumber = freezed,
    Object? isActive = freezed,
    Object? staffNumber = freezed,
    Object? user = freezed,
    Object? defaultFacility = freezed,
    Object? rolesList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCCCNumber: freezed == clientCCCNumber
          ? _value.clientCCCNumber
          : clientCCCNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: freezed == staffNumber
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      rolesList: freezed == rolesList
          ? _value.rolesList
          : rolesList // ignore: cast_nullable_to_non_nullable
              as RolesList?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
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
  $RolesListCopyWith<$Res>? get rolesList {
    if (_value.rolesList == null) {
      return null;
    }

    return $RolesListCopyWith<$Res>(_value.rolesList!, (value) {
      return _then(_value.copyWith(rolesList: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SearchUserResponseCopyWith<$Res>
    implements $SearchUserResponseCopyWith<$Res> {
  factory _$$_SearchUserResponseCopyWith(_$_SearchUserResponse value,
          $Res Function(_$_SearchUserResponse) then) =
      __$$_SearchUserResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ID') String? id,
      @JsonKey(name: 'CCCNumber') String? clientCCCNumber,
      @JsonKey(name: 'Active') bool? isActive,
      @JsonKey(name: 'StaffNumber') String? staffNumber,
      @JsonKey(name: 'User') UserData? user,
      @JsonKey(name: 'DefaultFacility') Facility? defaultFacility,
      @JsonKey(name: 'rolesList') RolesList? rolesList});

  @override
  $UserDataCopyWith<$Res>? get user;
  @override
  $FacilityCopyWith<$Res>? get defaultFacility;
  @override
  $RolesListCopyWith<$Res>? get rolesList;
}

/// @nodoc
class __$$_SearchUserResponseCopyWithImpl<$Res>
    extends _$SearchUserResponseCopyWithImpl<$Res, _$_SearchUserResponse>
    implements _$$_SearchUserResponseCopyWith<$Res> {
  __$$_SearchUserResponseCopyWithImpl(
      _$_SearchUserResponse _value, $Res Function(_$_SearchUserResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? clientCCCNumber = freezed,
    Object? isActive = freezed,
    Object? staffNumber = freezed,
    Object? user = freezed,
    Object? defaultFacility = freezed,
    Object? rolesList = freezed,
  }) {
    return _then(_$_SearchUserResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      clientCCCNumber: freezed == clientCCCNumber
          ? _value.clientCCCNumber
          : clientCCCNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      staffNumber: freezed == staffNumber
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      defaultFacility: freezed == defaultFacility
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
      rolesList: freezed == rolesList
          ? _value.rolesList
          : rolesList // ignore: cast_nullable_to_non_nullable
              as RolesList?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchUserResponse implements _SearchUserResponse {
  _$_SearchUserResponse(
      {@JsonKey(name: 'ID') this.id,
      @JsonKey(name: 'CCCNumber') this.clientCCCNumber,
      @JsonKey(name: 'Active') this.isActive,
      @JsonKey(name: 'StaffNumber') this.staffNumber,
      @JsonKey(name: 'User') this.user,
      @JsonKey(name: 'DefaultFacility') this.defaultFacility,
      @JsonKey(name: 'rolesList') this.rolesList});

  factory _$_SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchUserResponseFromJson(json);

  @override
  @JsonKey(name: 'ID')
  final String? id;
  @override
  @JsonKey(name: 'CCCNumber')
  final String? clientCCCNumber;
// This is the CCCNumber if the person being searched is a client
  @override
  @JsonKey(name: 'Active')
  final bool? isActive;
// This is a boolean for checking if the user was deactivated from the platform
  @override
  @JsonKey(name: 'StaffNumber')
  final String? staffNumber;
// this is the staff number if the person being searched is a staff member
  @override
  @JsonKey(name: 'User')
  final UserData? user;
  @override
  @JsonKey(name: 'DefaultFacility')
  final Facility? defaultFacility;
  @override
  @JsonKey(name: 'rolesList')
  final RolesList? rolesList;

  @override
  String toString() {
    return 'SearchUserResponse(id: $id, clientCCCNumber: $clientCCCNumber, isActive: $isActive, staffNumber: $staffNumber, user: $user, defaultFacility: $defaultFacility, rolesList: $rolesList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchUserResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clientCCCNumber, clientCCCNumber) ||
                other.clientCCCNumber == clientCCCNumber) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.staffNumber, staffNumber) ||
                other.staffNumber == staffNumber) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.defaultFacility, defaultFacility) ||
                other.defaultFacility == defaultFacility) &&
            (identical(other.rolesList, rolesList) ||
                other.rolesList == rolesList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, clientCCCNumber, isActive,
      staffNumber, user, defaultFacility, rolesList);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchUserResponseCopyWith<_$_SearchUserResponse> get copyWith =>
      __$$_SearchUserResponseCopyWithImpl<_$_SearchUserResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchUserResponseToJson(
      this,
    );
  }
}

abstract class _SearchUserResponse implements SearchUserResponse {
  factory _SearchUserResponse(
          {@JsonKey(name: 'ID') final String? id,
          @JsonKey(name: 'CCCNumber') final String? clientCCCNumber,
          @JsonKey(name: 'Active') final bool? isActive,
          @JsonKey(name: 'StaffNumber') final String? staffNumber,
          @JsonKey(name: 'User') final UserData? user,
          @JsonKey(name: 'DefaultFacility') final Facility? defaultFacility,
          @JsonKey(name: 'rolesList') final RolesList? rolesList}) =
      _$_SearchUserResponse;

  factory _SearchUserResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchUserResponse.fromJson;

  @override
  @JsonKey(name: 'ID')
  String? get id;
  @override
  @JsonKey(name: 'CCCNumber')
  String? get clientCCCNumber;
  @override // This is the CCCNumber if the person being searched is a client
  @JsonKey(name: 'Active')
  bool? get isActive;
  @override // This is a boolean for checking if the user was deactivated from the platform
  @JsonKey(name: 'StaffNumber')
  String? get staffNumber;
  @override // this is the staff number if the person being searched is a staff member
  @JsonKey(name: 'User')
  UserData? get user;
  @override
  @JsonKey(name: 'DefaultFacility')
  Facility? get defaultFacility;
  @override
  @JsonKey(name: 'rolesList')
  RolesList? get rolesList;
  @override
  @JsonKey(ignore: true)
  _$$_SearchUserResponseCopyWith<_$_SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
