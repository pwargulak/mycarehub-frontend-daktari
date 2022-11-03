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
  @JsonKey(name: 'consented')
  bool? get isConsented => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CaregiverCopyWith<Caregiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CaregiverCopyWith<$Res> {
  factory $CaregiverCopyWith(Caregiver value, $Res Function(Caregiver) then) =
      _$CaregiverCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') UserData? caregiverUser,
      @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
      @JsonKey(name: 'isClient') bool? isClient,
      @JsonKey(name: 'consented') bool? isConsented});

  $UserDataCopyWith<$Res>? get caregiverUser;
}

/// @nodoc
class _$CaregiverCopyWithImpl<$Res> implements $CaregiverCopyWith<$Res> {
  _$CaregiverCopyWithImpl(this._value, this._then);

  final Caregiver _value;
  // ignore: unused_field
  final $Res Function(Caregiver) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? caregiverUser = freezed,
    Object? caregiverNumber = freezed,
    Object? isClient = freezed,
    Object? isConsented = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverUser: caregiverUser == freezed
          ? _value.caregiverUser
          : caregiverUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      caregiverNumber: caregiverNumber == freezed
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isClient: isClient == freezed
          ? _value.isClient
          : isClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConsented: isConsented == freezed
          ? _value.isConsented
          : isConsented // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  $UserDataCopyWith<$Res>? get caregiverUser {
    if (_value.caregiverUser == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.caregiverUser!, (value) {
      return _then(_value.copyWith(caregiverUser: value));
    });
  }
}

/// @nodoc
abstract class _$$_CaregiverCopyWith<$Res> implements $CaregiverCopyWith<$Res> {
  factory _$$_CaregiverCopyWith(
          _$_Caregiver value, $Res Function(_$_Caregiver) then) =
      __$$_CaregiverCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'user') UserData? caregiverUser,
      @JsonKey(name: 'caregiverNumber') String? caregiverNumber,
      @JsonKey(name: 'isClient') bool? isClient,
      @JsonKey(name: 'consented') bool? isConsented});

  @override
  $UserDataCopyWith<$Res>? get caregiverUser;
}

/// @nodoc
class __$$_CaregiverCopyWithImpl<$Res> extends _$CaregiverCopyWithImpl<$Res>
    implements _$$_CaregiverCopyWith<$Res> {
  __$$_CaregiverCopyWithImpl(
      _$_Caregiver _value, $Res Function(_$_Caregiver) _then)
      : super(_value, (v) => _then(v as _$_Caregiver));

  @override
  _$_Caregiver get _value => super._value as _$_Caregiver;

  @override
  $Res call({
    Object? id = freezed,
    Object? caregiverUser = freezed,
    Object? caregiverNumber = freezed,
    Object? isClient = freezed,
    Object? isConsented = freezed,
  }) {
    return _then(_$_Caregiver(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverUser: caregiverUser == freezed
          ? _value.caregiverUser
          : caregiverUser // ignore: cast_nullable_to_non_nullable
              as UserData?,
      caregiverNumber: caregiverNumber == freezed
          ? _value.caregiverNumber
          : caregiverNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isClient: isClient == freezed
          ? _value.isClient
          : isClient // ignore: cast_nullable_to_non_nullable
              as bool?,
      isConsented: isConsented == freezed
          ? _value.isConsented
          : isConsented // ignore: cast_nullable_to_non_nullable
              as bool?,
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
      @JsonKey(name: 'consented') this.isConsented});

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
  @JsonKey(name: 'consented')
  final bool? isConsented;

  @override
  String toString() {
    return 'Caregiver(id: $id, caregiverUser: $caregiverUser, caregiverNumber: $caregiverNumber, isClient: $isClient, isConsented: $isConsented)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Caregiver &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.caregiverUser, caregiverUser) &&
            const DeepCollectionEquality()
                .equals(other.caregiverNumber, caregiverNumber) &&
            const DeepCollectionEquality().equals(other.isClient, isClient) &&
            const DeepCollectionEquality()
                .equals(other.isConsented, isConsented));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(caregiverUser),
      const DeepCollectionEquality().hash(caregiverNumber),
      const DeepCollectionEquality().hash(isClient),
      const DeepCollectionEquality().hash(isConsented));

  @JsonKey(ignore: true)
  @override
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
      @JsonKey(name: 'consented') final bool? isConsented}) = _$_Caregiver;

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
  @JsonKey(name: 'consented')
  bool? get isConsented;
  @override
  @JsonKey(ignore: true)
  _$$_CaregiverCopyWith<_$_Caregiver> get copyWith =>
      throw _privateConstructorUsedError;
}
