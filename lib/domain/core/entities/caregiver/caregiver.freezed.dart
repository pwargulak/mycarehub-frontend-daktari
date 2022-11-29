// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'caregiver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Caregiver _$CaregiverFromJson(Map<String, dynamic> json) {
  return _Caregiver.fromJson(json);
}

/// @nodoc
mixin _$Caregiver {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  UserData? get caregiverUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiverNumber')
  String? get caregiverNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'isClient')
  bool? get isClient => throw _privateConstructorUsedError;
  @JsonKey(name: 'consent')
  Consent? get consent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaregiverCopyWith<Caregiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaregiverCopyWith<$Res> {
  factory $CaregiverCopyWith(Caregiver value, $Res Function(Caregiver) then) =
      _$CaregiverCopyWithImpl<$Res, Caregiver>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') UserData? caregiverUser,
      @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
      @JsonKey(name: 'isClient') bool? isClient,
      @JsonKey(name: 'consent') Consent? consent});

  $UserDataCopyWith<$Res>? get caregiverUser;
  $ConsentCopyWith<$Res>? get consent;
}

/// @nodoc
class _$CaregiverCopyWithImpl<$Res, $Val extends Caregiver>
    implements $CaregiverCopyWith<$Res> {
  _$CaregiverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? caregiverUser = freezed,
    Object? caregiverNumber = freezed,
    Object? isClient = freezed,
    Object? consent = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverUser: freezed == caregiverUser
          ? _value.caregiverUser
          : caregiverUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      caregiverNumber: freezed == caregiverNumber
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isClient: freezed == isClient
          ? _value.isClient
          : isClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      consent: freezed == consent
          ? _value.consent
          : consent // ignore: cast_nullable_to_non_nullable
              as Consent?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get caregiverUser {
    if (_value.caregiverUser == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.caregiverUser!, (value) {
      return _then(_value.copyWith(caregiverUser: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ConsentCopyWith<$Res>? get consent {
    if (_value.consent == null) {
      return null;
    }

    return $ConsentCopyWith<$Res>(_value.consent!, (value) {
      return _then(_value.copyWith(consent: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CaregiverCopyWith<$Res> implements $CaregiverCopyWith<$Res> {
  factory _$$_CaregiverCopyWith(
          _$_Caregiver value, $Res Function(_$_Caregiver) then) =
      __$$_CaregiverCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') UserData? caregiverUser,
      @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
      @JsonKey(name: 'isClient') bool? isClient,
      @JsonKey(name: 'consent') Consent? consent});

  @override
  $UserDataCopyWith<$Res>? get caregiverUser;
  @override
  $ConsentCopyWith<$Res>? get consent;
}

/// @nodoc
class __$$_CaregiverCopyWithImpl<$Res>
    extends _$CaregiverCopyWithImpl<$Res, _$_Caregiver>
    implements _$$_CaregiverCopyWith<$Res> {
  __$$_CaregiverCopyWithImpl(
      _$_Caregiver _value, $Res Function(_$_Caregiver) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? caregiverUser = freezed,
    Object? caregiverNumber = freezed,
    Object? isClient = freezed,
    Object? consent = freezed,
  }) {
    return _then(_$_Caregiver(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverUser: freezed == caregiverUser
          ? _value.caregiverUser
          : caregiverUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      caregiverNumber: freezed == caregiverNumber
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isClient: freezed == isClient
          ? _value.isClient
          : isClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      consent: freezed == consent
          ? _value.consent
          : consent // ignore: cast_nullable_to_non_nullable
              as Consent?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Caregiver implements _Caregiver {
  _$_Caregiver(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user') this.caregiverUser,
      @JsonKey(name: 'caregiverNumber') this.caregiverNumber,
      @JsonKey(name: 'isClient') this.isClient,
      @JsonKey(name: 'consent') this.consent});

  factory _$_Caregiver.fromJson(Map<String, dynamic> json) =>
      _$$_CaregiverFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'user')
  final UserData? caregiverUser;
  @override
  @JsonKey(name: 'caregiverNumber')
  final String? caregiverNumber;
  @override
  @JsonKey(name: 'isClient')
  final bool? isClient;
  @override
  @JsonKey(name: 'consent')
  final Consent? consent;

  @override
  String toString() {
    return 'Caregiver(id: $id, caregiverUser: $caregiverUser, caregiverNumber: $caregiverNumber, isClient: $isClient, consent: $consent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Caregiver &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.caregiverUser, caregiverUser) ||
                other.caregiverUser == caregiverUser) &&
            (identical(other.caregiverNumber, caregiverNumber) ||
                other.caregiverNumber == caregiverNumber) &&
            (identical(other.isClient, isClient) ||
                other.isClient == isClient) &&
            (identical(other.consent, consent) || other.consent == consent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, caregiverUser, caregiverNumber, isClient, consent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CaregiverCopyWith<_$_Caregiver> get copyWith =>
      __$$_CaregiverCopyWithImpl<_$_Caregiver>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CaregiverToJson(
      this,
    );
  }
}

abstract class _Caregiver implements Caregiver {
  factory _Caregiver(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'user') final UserData? caregiverUser,
      @JsonKey(name: 'caregiverNumber') final String? caregiverNumber,
      @JsonKey(name: 'isClient') final bool? isClient,
      @JsonKey(name: 'consent') final Consent? consent}) = _$_Caregiver;

  factory _Caregiver.fromJson(Map<String, dynamic> json) =
      _$_Caregiver.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'user')
  UserData? get caregiverUser;
  @override
  @JsonKey(name: 'caregiverNumber')
  String? get caregiverNumber;
  @override
  @JsonKey(name: 'isClient')
  bool? get isClient;
  @override
  @JsonKey(name: 'consent')
  Consent? get consent;
  @override
  @JsonKey(ignore: true)
  _$$_CaregiverCopyWith<_$_Caregiver> get copyWith =>
      throw _privateConstructorUsedError;
}
