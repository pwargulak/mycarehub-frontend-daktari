// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'register_caregiver_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RegisterCaregiverPayload _$RegisterCaregiverPayloadFromJson(
    Map<String, dynamic> json) {
  return _RegisterCaregiverPayload.fromJson(json);
}

/// @nodoc
mixin _$RegisterCaregiverPayload {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender', fromJson: genderFromJson)
  Gender? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: 'phoneNumber')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiverNumber')
  String? get caregiverNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'sendInvite')
  bool? get sendInvite => throw _privateConstructorUsedError;
  @JsonKey(name: 'assignedClients')
  List<AssignedClient>? get assignedClients =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegisterCaregiverPayloadCopyWith<RegisterCaregiverPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterCaregiverPayloadCopyWith<$Res> {
  factory $RegisterCaregiverPayloadCopyWith(RegisterCaregiverPayload value,
          $Res Function(RegisterCaregiverPayload) then) =
      _$RegisterCaregiverPayloadCopyWithImpl<$Res, RegisterCaregiverPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
      @JsonKey(name: 'sendInvite') bool? sendInvite,
      @JsonKey(name: 'assignedClients') List<AssignedClient>? assignedClients});
}

/// @nodoc
class _$RegisterCaregiverPayloadCopyWithImpl<$Res,
        $Val extends RegisterCaregiverPayload>
    implements $RegisterCaregiverPayloadCopyWith<$Res> {
  _$RegisterCaregiverPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phoneNumber = freezed,
    Object? caregiverNumber = freezed,
    Object? sendInvite = freezed,
    Object? assignedClients = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      caregiverNumber: freezed == caregiverNumber
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      sendInvite: freezed == sendInvite
          ? _value.sendInvite
          : sendInvite // ignore: cast_nullable_to_non_nullable
              as bool?,
      assignedClients: freezed == assignedClients
          ? _value.assignedClients
          : assignedClients // ignore: cast_nullable_to_non_nullable
              as List<AssignedClient>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterCaregiverPayloadCopyWith<$Res>
    implements $RegisterCaregiverPayloadCopyWith<$Res> {
  factory _$$_RegisterCaregiverPayloadCopyWith(
          _$_RegisterCaregiverPayload value,
          $Res Function(_$_RegisterCaregiverPayload) then) =
      __$$_RegisterCaregiverPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'gender', fromJson: genderFromJson) Gender? gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson) DateTime? dateOfBirth,
      @JsonKey(name: 'phoneNumber') String? phoneNumber,
      @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
      @JsonKey(name: 'sendInvite') bool? sendInvite,
      @JsonKey(name: 'assignedClients') List<AssignedClient>? assignedClients});
}

/// @nodoc
class __$$_RegisterCaregiverPayloadCopyWithImpl<$Res>
    extends _$RegisterCaregiverPayloadCopyWithImpl<$Res,
        _$_RegisterCaregiverPayload>
    implements _$$_RegisterCaregiverPayloadCopyWith<$Res> {
  __$$_RegisterCaregiverPayloadCopyWithImpl(_$_RegisterCaregiverPayload _value,
      $Res Function(_$_RegisterCaregiverPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? phoneNumber = freezed,
    Object? caregiverNumber = freezed,
    Object? sendInvite = freezed,
    Object? assignedClients = freezed,
  }) {
    return _then(_$_RegisterCaregiverPayload(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
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
      caregiverNumber: freezed == caregiverNumber
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      sendInvite: freezed == sendInvite
          ? _value.sendInvite
          : sendInvite // ignore: cast_nullable_to_non_nullable
              as bool?,
      assignedClients: freezed == assignedClients
          ? _value._assignedClients
          : assignedClients // ignore: cast_nullable_to_non_nullable
              as List<AssignedClient>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_RegisterCaregiverPayload implements _RegisterCaregiverPayload {
  _$_RegisterCaregiverPayload(
      {@JsonKey(name: 'name')
          this.name,
      @JsonKey(name: 'username')
          this.username,
      @JsonKey(name: 'gender', fromJson: genderFromJson)
          this.gender,
      @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
          this.dateOfBirth,
      @JsonKey(name: 'phoneNumber')
          this.phoneNumber,
      @JsonKey(name: 'caregiverNumber')
          this.caregiverNumber,
      @JsonKey(name: 'sendInvite')
          this.sendInvite,
      @JsonKey(name: 'assignedClients')
          final List<AssignedClient>? assignedClients})
      : _assignedClients = assignedClients;

  factory _$_RegisterCaregiverPayload.fromJson(Map<String, dynamic> json) =>
      _$$_RegisterCaregiverPayloadFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'username')
  final String? username;
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
  @JsonKey(name: 'caregiverNumber')
  final String? caregiverNumber;
  @override
  @JsonKey(name: 'sendInvite')
  final bool? sendInvite;
  final List<AssignedClient>? _assignedClients;
  @override
  @JsonKey(name: 'assignedClients')
  List<AssignedClient>? get assignedClients {
    final value = _assignedClients;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RegisterCaregiverPayload(name: $name, username: $username, gender: $gender, dateOfBirth: $dateOfBirth, phoneNumber: $phoneNumber, caregiverNumber: $caregiverNumber, sendInvite: $sendInvite, assignedClients: $assignedClients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterCaregiverPayload &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.caregiverNumber, caregiverNumber) ||
                other.caregiverNumber == caregiverNumber) &&
            (identical(other.sendInvite, sendInvite) ||
                other.sendInvite == sendInvite) &&
            const DeepCollectionEquality()
                .equals(other._assignedClients, _assignedClients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      username,
      gender,
      dateOfBirth,
      phoneNumber,
      caregiverNumber,
      sendInvite,
      const DeepCollectionEquality().hash(_assignedClients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterCaregiverPayloadCopyWith<_$_RegisterCaregiverPayload>
      get copyWith => __$$_RegisterCaregiverPayloadCopyWithImpl<
          _$_RegisterCaregiverPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegisterCaregiverPayloadToJson(
      this,
    );
  }
}

abstract class _RegisterCaregiverPayload implements RegisterCaregiverPayload {
  factory _RegisterCaregiverPayload(
          {@JsonKey(name: 'name')
              final String? name,
          @JsonKey(name: 'username')
              final String? username,
          @JsonKey(name: 'gender', fromJson: genderFromJson)
              final Gender? gender,
          @JsonKey(name: 'dateOfBirth', toJson: dobToJson)
              final DateTime? dateOfBirth,
          @JsonKey(name: 'phoneNumber')
              final String? phoneNumber,
          @JsonKey(name: 'caregiverNumber')
              final String? caregiverNumber,
          @JsonKey(name: 'sendInvite')
              final bool? sendInvite,
          @JsonKey(name: 'assignedClients')
              final List<AssignedClient>? assignedClients}) =
      _$_RegisterCaregiverPayload;

  factory _RegisterCaregiverPayload.fromJson(Map<String, dynamic> json) =
      _$_RegisterCaregiverPayload.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'username')
  String? get username;
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
  @JsonKey(name: 'caregiverNumber')
  String? get caregiverNumber;
  @override
  @JsonKey(name: 'sendInvite')
  bool? get sendInvite;
  @override
  @JsonKey(name: 'assignedClients')
  List<AssignedClient>? get assignedClients;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterCaregiverPayloadCopyWith<_$_RegisterCaregiverPayload>
      get copyWith => throw _privateConstructorUsedError;
}
