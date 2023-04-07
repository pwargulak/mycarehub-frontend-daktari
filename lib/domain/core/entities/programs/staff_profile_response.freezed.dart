// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'staff_profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StaffProfileResponse _$StaffProfileResponseFromJson(Map<String, dynamic> json) {
  return _StaffProfileResponse.fromJson(json);
}

/// @nodoc
mixin _$StaffProfileResponse {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User? get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffNumber')
  String? get staffNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'defaultFacility')
  Facility? get defaultFacility => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StaffProfileResponseCopyWith<StaffProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StaffProfileResponseCopyWith<$Res> {
  factory $StaffProfileResponseCopyWith(StaffProfileResponse value,
          $Res Function(StaffProfileResponse) then) =
      _$StaffProfileResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'staffNumber') String? staffNumber,
      @JsonKey(name: 'defaultFacility') Facility? defaultFacility});

  $UserCopyWith<$Res>? get user;
  $FacilityCopyWith<$Res>? get defaultFacility;
}

/// @nodoc
class _$StaffProfileResponseCopyWithImpl<$Res>
    implements $StaffProfileResponseCopyWith<$Res> {
  _$StaffProfileResponseCopyWithImpl(this._value, this._then);

  final StaffProfileResponse _value;
  // ignore: unused_field
  final $Res Function(StaffProfileResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? staffNumber = freezed,
    Object? defaultFacility = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacility: defaultFacility == freezed
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }

  @override
  $FacilityCopyWith<$Res>? get defaultFacility {
    if (_value.defaultFacility == null) {
      return null;
    }

    return $FacilityCopyWith<$Res>(_value.defaultFacility!, (value) {
      return _then(_value.copyWith(defaultFacility: value));
    });
  }
}

/// @nodoc
abstract class _$$_StaffProfileResponseCopyWith<$Res>
    implements $StaffProfileResponseCopyWith<$Res> {
  factory _$$_StaffProfileResponseCopyWith(_$_StaffProfileResponse value,
          $Res Function(_$_StaffProfileResponse) then) =
      __$$_StaffProfileResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') User? user,
      @JsonKey(name: 'staffNumber') String? staffNumber,
      @JsonKey(name: 'defaultFacility') Facility? defaultFacility});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $FacilityCopyWith<$Res>? get defaultFacility;
}

/// @nodoc
class __$$_StaffProfileResponseCopyWithImpl<$Res>
    extends _$StaffProfileResponseCopyWithImpl<$Res>
    implements _$$_StaffProfileResponseCopyWith<$Res> {
  __$$_StaffProfileResponseCopyWithImpl(_$_StaffProfileResponse _value,
      $Res Function(_$_StaffProfileResponse) _then)
      : super(_value, (v) => _then(v as _$_StaffProfileResponse));

  @override
  _$_StaffProfileResponse get _value => super._value as _$_StaffProfileResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? staffNumber = freezed,
    Object? defaultFacility = freezed,
  }) {
    return _then(_$_StaffProfileResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      staffNumber: staffNumber == freezed
          ? _value.staffNumber
          : staffNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultFacility: defaultFacility == freezed
          ? _value.defaultFacility
          : defaultFacility // ignore: cast_nullable_to_non_nullable
              as Facility?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StaffProfileResponse implements _StaffProfileResponse {
  _$_StaffProfileResponse(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user') this.user,
      @JsonKey(name: 'staffNumber') this.staffNumber,
      @JsonKey(name: 'defaultFacility') this.defaultFacility});

  factory _$_StaffProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StaffProfileResponseFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'user')
  final User? user;
  @override
  @JsonKey(name: 'staffNumber')
  final String? staffNumber;
  @override
  @JsonKey(name: 'defaultFacility')
  final Facility? defaultFacility;

  @override
  String toString() {
    return 'StaffProfileResponse(id: $id, user: $user, staffNumber: $staffNumber, defaultFacility: $defaultFacility)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StaffProfileResponse &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.user, user) &&
            const DeepCollectionEquality()
                .equals(other.staffNumber, staffNumber) &&
            const DeepCollectionEquality()
                .equals(other.defaultFacility, defaultFacility));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(user),
      const DeepCollectionEquality().hash(staffNumber),
      const DeepCollectionEquality().hash(defaultFacility));

  @JsonKey(ignore: true)
  @override
  _$$_StaffProfileResponseCopyWith<_$_StaffProfileResponse> get copyWith =>
      __$$_StaffProfileResponseCopyWithImpl<_$_StaffProfileResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StaffProfileResponseToJson(
      this,
    );
  }
}

abstract class _StaffProfileResponse implements StaffProfileResponse {
  factory _StaffProfileResponse(
          {@JsonKey(name: 'id') final String? id,
          @JsonKey(name: 'user') final User? user,
          @JsonKey(name: 'staffNumber') final String? staffNumber,
          @JsonKey(name: 'defaultFacility') final Facility? defaultFacility}) =
      _$_StaffProfileResponse;

  factory _StaffProfileResponse.fromJson(Map<String, dynamic> json) =
      _$_StaffProfileResponse.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'user')
  User? get user;
  @override
  @JsonKey(name: 'staffNumber')
  String? get staffNumber;
  @override
  @JsonKey(name: 'defaultFacility')
  Facility? get defaultFacility;
  @override
  @JsonKey(ignore: true)
  _$$_StaffProfileResponseCopyWith<_$_StaffProfileResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
