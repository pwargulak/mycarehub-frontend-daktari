// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_client_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterClientPayload _$RegisterClientPayloadFromJson(
    Map<String, dynamic> json) {
  return _RegisterClientPayload.fromJson(json);
}

/// @nodoc
mixin _$RegisterClientPayload {
  @JsonKey(name: 'facility')
  String? get facility => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientName')
  String? get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
  DateTime? get enrollmentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'cccNumber')
  String? get cccNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'counselled')
  bool? get counselled => throw _privateConstructorUsedError;
  @JsonKey(name: 'inviteClient')
  bool? get inviteClient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterClientPayloadCopyWith<RegisterClientPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterClientPayloadCopyWith<$Res> {
  factory $RegisterClientPayloadCopyWith(RegisterClientPayload value,
          $Res Function(RegisterClientPayload) then) =
      _$RegisterClientPayloadCopyWithImpl<$Res, RegisterClientPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'facility')
          String? facility,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'clientTypes')
          List<ClientType>? clientTypes,
      @JsonKey(name: 'clientName')
          String? clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
          DateTime? enrollmentDate,
      @JsonKey(name: 'cccNumber')
          String? cccNumber,
      @JsonKey(name: 'counselled')
          bool? counselled,
      @JsonKey(name: 'inviteClient')
          bool? inviteClient});
}

/// @nodoc
class _$RegisterClientPayloadCopyWithImpl<$Res,
        $Val extends RegisterClientPayload>
    implements $RegisterClientPayloadCopyWith<$Res> {
  _$RegisterClientPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facility = freezed,
    Object? username = freezed,
    Object? clientTypes = freezed,
    Object? clientName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phoneNumber = freezed,
    Object? enrollmentDate = freezed,
    Object? cccNumber = freezed,
    Object? counselled = freezed,
    Object? inviteClient = freezed,
  }) {
    return _then(_value.copyWith(
      facility: freezed == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      clientTypes: freezed == clientTypes
          ? _value.clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentDate: freezed == enrollmentDate
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cccNumber: freezed == cccNumber
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      counselled: freezed == counselled
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteClient: freezed == inviteClient
          ? _value.inviteClient
          : inviteClient // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterClientPayloadCopyWith<$Res>
    implements $RegisterClientPayloadCopyWith<$Res> {
  factory _$$_RegisterClientPayloadCopyWith(_$_RegisterClientPayload value,
          $Res Function(_$_RegisterClientPayload) then) =
      __$$_RegisterClientPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'facility')
          String? facility,
      @JsonKey(name: 'username')
          String? username,
      @JsonKey(name: 'clientTypes')
          List<ClientType>? clientTypes,
      @JsonKey(name: 'clientName')
          String? clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          String? phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
          DateTime? enrollmentDate,
      @JsonKey(name: 'cccNumber')
          String? cccNumber,
      @JsonKey(name: 'counselled')
          bool? counselled,
      @JsonKey(name: 'inviteClient')
          bool? inviteClient});
}

/// @nodoc
class __$$_RegisterClientPayloadCopyWithImpl<$Res>
    extends _$RegisterClientPayloadCopyWithImpl<$Res, _$_RegisterClientPayload>
    implements _$$_RegisterClientPayloadCopyWith<$Res> {
  __$$_RegisterClientPayloadCopyWithImpl(_$_RegisterClientPayload _value,
      $Res Function(_$_RegisterClientPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facility = freezed,
    Object? username = freezed,
    Object? clientTypes = freezed,
    Object? clientName = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phoneNumber = freezed,
    Object? enrollmentDate = freezed,
    Object? cccNumber = freezed,
    Object? counselled = freezed,
    Object? inviteClient = freezed,
  }) {
    return _then(_$_RegisterClientPayload(
      facility: freezed == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      clientTypes: freezed == clientTypes
          ? _value._clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as Gender?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      enrollmentDate: freezed == enrollmentDate
          ? _value.enrollmentDate
          : enrollmentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      cccNumber: freezed == cccNumber
          ? _value.cccNumber
          : cccNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      counselled: freezed == counselled
          ? _value.counselled
          : counselled // ignore: cast_nullable_to_non_nullable
              as bool?,
      inviteClient: freezed == inviteClient
          ? _value.inviteClient
          : inviteClient // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RegisterClientPayload implements _RegisterClientPayload {
  _$_RegisterClientPayload(
      {@JsonKey(name: 'facility') this.facility,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'clientTypes') final List<ClientType>? clientTypes,
      @JsonKey(name: 'clientName') this.clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson) this.gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) this.dateOfBirth,
      @JsonKey(name: 'phoneNumber') this.phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson) this.enrollmentDate,
      @JsonKey(name: 'cccNumber') this.cccNumber,
      @JsonKey(name: 'counselled') this.counselled,
      @JsonKey(name: 'inviteClient') this.inviteClient})
      : _clientTypes = clientTypes;

  factory _$_RegisterClientPayload.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterClientPayloadFromJson(json);

  @override
  @JsonKey(name: 'facility')
  final String? facility;
  @override
  @JsonKey(name: 'username')
  final String? username;
  final List<ClientType>? _clientTypes;
  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes {
    final value = _clientTypes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'clientName')
  final String? clientName;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  final Gender? gender;
  @override
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  final DateTime? dateOfBirth;
  @override
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
  final DateTime? enrollmentDate;
  @override
  @JsonKey(name: 'cccNumber')
  final String? cccNumber;
  @override
  @JsonKey(name: 'counselled')
  final bool? counselled;
  @override
  @JsonKey(name: 'inviteClient')
  final bool? inviteClient;

  @override
  String toString() {
    return 'RegisterClientPayload(facility: $facility, username: $username, clientTypes: $clientTypes, clientName: $clientName, gender: $gender, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, enrollmentDate: $enrollmentDate, cccNumber: $cccNumber, counselled: $counselled, inviteClient: $inviteClient)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterClientPayload &&
            (identical(other.facility, facility) ||
                other.facility == facility) &&
            (identical(other.username, username) ||
                other.username == username) &&
            const DeepCollectionEquality()
                .equals(other._clientTypes, _clientTypes) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.enrollmentDate, enrollmentDate) ||
                other.enrollmentDate == enrollmentDate) &&
            (identical(other.cccNumber, cccNumber) ||
                other.cccNumber == cccNumber) &&
            (identical(other.counselled, counselled) ||
                other.counselled == counselled) &&
            (identical(other.inviteClient, inviteClient) ||
                other.inviteClient == inviteClient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      facility,
      username,
      const DeepCollectionEquality().hash(_clientTypes),
      clientName,
      gender,
      dateOfBirth,
      phoneNumber,
      enrollmentDate,
      cccNumber,
      counselled,
      inviteClient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterClientPayloadCopyWith<_$_RegisterClientPayload> get copyWith =>
      __$$_RegisterClientPayloadCopyWithImpl<_$_RegisterClientPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterClientPayloadToJson(
      this,
    );
  }
}

abstract class _RegisterClientPayload implements RegisterClientPayload {
  factory _RegisterClientPayload(
      {@JsonKey(name: 'facility')
          final String? facility,
      @JsonKey(name: 'username')
          final String? username,
      @JsonKey(name: 'clientTypes')
          final List<ClientType>? clientTypes,
      @JsonKey(name: 'clientName')
          final String? clientName,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          final Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          final DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          final String? phoneNumber,
      @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
          final DateTime? enrollmentDate,
      @JsonKey(name: 'cccNumber')
          final String? cccNumber,
      @JsonKey(name: 'counselled')
          final bool? counselled,
      @JsonKey(name: 'inviteClient')
          final bool? inviteClient}) = _$_RegisterClientPayload;

  factory _RegisterClientPayload.fromJson(Map<String, dynamic> json) =
      _$_RegisterClientPayload.fromJson;

  @override
  @JsonKey(name: 'facility')
  String? get facility;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes;
  @override
  @JsonKey(name: 'clientName')
  String? get clientName;
  @override
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  Gender? get gender;
  @override
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  DateTime? get dateOfBirth;
  @override
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'enrollmentDate', toJson: dobToJson)
  DateTime? get enrollmentDate;
  @override
  @JsonKey(name: 'cccNumber')
  String? get cccNumber;
  @override
  @JsonKey(name: 'counselled')
  bool? get counselled;
  @override
  @JsonKey(name: 'inviteClient')
  bool? get inviteClient;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterClientPayloadCopyWith<_$_RegisterClientPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
