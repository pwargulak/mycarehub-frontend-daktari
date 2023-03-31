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
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'identifiers')
  List<Identifier>? get identifiers =>
      throw _privateConstructorUsedError; // This is the CCCNumber if the person being searched is a client
  @JsonKey(name: 'active')
  bool? get isActive =>
      throw _privateConstructorUsedError; // This is a boolean for checking if the user was deactivated from the platform
  @JsonKey(name: 'staffNumber')
  String? get staffNumber =>
      throw _privateConstructorUsedError; // this is the staff number if the person being searched is a staff member
  @JsonKey(name: 'user')
  UserData? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacility')
  Facility? get defaultFacility => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'identifiers') List<Identifier>? identifiers,
      @JsonKey(name: 'active') bool? isActive,
      @JsonKey(name: 'staffNumber') String? staffNumber,
      @JsonKey(name: 'user') UserData? user,
      @JsonKey(name: 'defaultFacility') Facility? defaultFacility});

  $UserDataCopyWith<$Res>? get user;
  $FacilityCopyWith<$Res>? get defaultFacility;
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
    Object? identifiers = freezed,
    Object? isActive = freezed,
    Object? staffNumber = freezed,
    Object? user = freezed,
    Object? defaultFacility = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifiers: freezed == identifiers
          ? _value.identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<Identifier>?,
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
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'identifiers') List<Identifier>? identifiers,
      @JsonKey(name: 'active') bool? isActive,
      @JsonKey(name: 'staffNumber') String? staffNumber,
      @JsonKey(name: 'user') UserData? user,
      @JsonKey(name: 'defaultFacility') Facility? defaultFacility});

  @override
  $UserDataCopyWith<$Res>? get user;
  @override
  $FacilityCopyWith<$Res>? get defaultFacility;
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
    Object? identifiers = freezed,
    Object? isActive = freezed,
    Object? staffNumber = freezed,
    Object? user = freezed,
    Object? defaultFacility = freezed,
  }) {
    return _then(_$_SearchUserResponse(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      identifiers: freezed == identifiers
          ? _value._identifiers
          : identifiers // ignore: cast_nullable_to_non_nullable
              as List<Identifier>?,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchUserResponse implements _SearchUserResponse {
  _$_SearchUserResponse(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'identifiers') final List<Identifier>? identifiers,
      @JsonKey(name: 'active') this.isActive,
      @JsonKey(name: 'staffNumber') this.staffNumber,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'defaultFacility') this.defaultFacility})
      : _identifiers = identifiers;

  factory _$_SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_SearchUserResponseFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  final List<Identifier>? _identifiers;
  @override
  @JsonKey(name: 'identifiers')
  List<Identifier>? get identifiers {
    final value = _identifiers;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// This is the CCCNumber if the person being searched is a client
  @override
  @JsonKey(name: 'active')
  final bool? isActive;
// This is a boolean for checking if the user was deactivated from the platform
  @override
  @JsonKey(name: 'staffNumber')
  final String? staffNumber;
// this is the staff number if the person being searched is a staff member
  @override
  @JsonKey(name: 'user')
  final UserData? user;
  @override
  @JsonKey(name: 'defaultFacility')
  final Facility? defaultFacility;

  @override
  String toString() {
    return 'SearchUserResponse(id: $id, identifiers: $identifiers, isActive: $isActive, staffNumber: $staffNumber, user: $user, defaultFacility: $defaultFacility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchUserResponse &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._identifiers, _identifiers) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.staffNumber, staffNumber) ||
                other.staffNumber == staffNumber) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.defaultFacility, defaultFacility) ||
                other.defaultFacility == defaultFacility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_identifiers),
      isActive,
      staffNumber,
      user,
      defaultFacility);

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
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'identifiers') final List<Identifier>? identifiers,
          @JsonKey(name: 'active') final bool? isActive,
          @JsonKey(name: 'staffNumber') final String? staffNumber,
          @JsonKey(name: 'user') final UserData? user,
          @JsonKey(name: 'defaultFacility') final Facility? defaultFacility}) =
      _$_SearchUserResponse;

  factory _SearchUserResponse.fromJson(Map<String, dynamic> json) =
      _$_SearchUserResponse.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'identifiers')
  List<Identifier>? get identifiers;
  @override // This is the CCCNumber if the person being searched is a client
  @JsonKey(name: 'active')
  bool? get isActive;
  @override // This is a boolean for checking if the user was deactivated from the platform
  @JsonKey(name: 'staffNumber')
  String? get staffNumber;
  @override // this is the staff number if the person being searched is a staff member
  @JsonKey(name: 'user')
  UserData? get user;
  @override
  @JsonKey(name: 'defaultFacility')
  Facility? get defaultFacility;
  @override
  @JsonKey(ignore: true)
  _$$_SearchUserResponseCopyWith<_$_SearchUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
