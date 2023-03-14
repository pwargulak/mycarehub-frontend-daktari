// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'assigned_caregiver.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssignedCaregiver _$AssignedCaregiverFromJson(Map<String, dynamic> json) {
  return _AssignedCaregiver.fromJson(json);
}

/// @nodoc
mixin _$AssignedCaregiver {
  @JsonKey(name: 'clientID')
  String? get clientID => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiverID')
  String? get caregiverID => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiverType')
  CaregiverType? get caregiverType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedCaregiverCopyWith<AssignedCaregiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedCaregiverCopyWith<$Res> {
  factory $AssignedCaregiverCopyWith(
          AssignedCaregiver value, $Res Function(AssignedCaregiver) then) =
      _$AssignedCaregiverCopyWithImpl<$Res, AssignedCaregiver>;
  @useResult
  $Res call(
      {@JsonKey(name: 'clientID') String? clientID,
      @JsonKey(name: 'caregiverID') String? caregiverID,
      @JsonKey(name: 'caregiverType') CaregiverType? caregiverType});
}

/// @nodoc
class _$AssignedCaregiverCopyWithImpl<$Res, $Val extends AssignedCaregiver>
    implements $AssignedCaregiverCopyWith<$Res> {
  _$AssignedCaregiverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientID = freezed,
    Object? caregiverID = freezed,
    Object? caregiverType = freezed,
  }) {
    return _then(_value.copyWith(
      clientID: freezed == clientID
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverID: freezed == caregiverID
          ? _value.caregiverID
          : caregiverID // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverType: freezed == caregiverType
          ? _value.caregiverType
          : caregiverType // ignore: cast_nullable_to_non_nullable
              as CaregiverType?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssignedCaregiverCopyWith<$Res>
    implements $AssignedCaregiverCopyWith<$Res> {
  factory _$$_AssignedCaregiverCopyWith(_$_AssignedCaregiver value,
          $Res Function(_$_AssignedCaregiver) then) =
      __$$_AssignedCaregiverCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'clientID') String? clientID,
      @JsonKey(name: 'caregiverID') String? caregiverID,
      @JsonKey(name: 'caregiverType') CaregiverType? caregiverType});
}

/// @nodoc
class __$$_AssignedCaregiverCopyWithImpl<$Res>
    extends _$AssignedCaregiverCopyWithImpl<$Res, _$_AssignedCaregiver>
    implements _$$_AssignedCaregiverCopyWith<$Res> {
  __$$_AssignedCaregiverCopyWithImpl(
      _$_AssignedCaregiver _value, $Res Function(_$_AssignedCaregiver) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientID = freezed,
    Object? caregiverID = freezed,
    Object? caregiverType = freezed,
  }) {
    return _then(_$_AssignedCaregiver(
      clientID: freezed == clientID
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverID: freezed == caregiverID
          ? _value.caregiverID
          : caregiverID // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverType: freezed == caregiverType
          ? _value.caregiverType
          : caregiverType // ignore: cast_nullable_to_non_nullable
              as CaregiverType?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssignedCaregiver implements _AssignedCaregiver {
  _$_AssignedCaregiver(
      {@JsonKey(name: 'clientID') this.clientID,
      @JsonKey(name: 'caregiverID') this.caregiverID,
      @JsonKey(name: 'caregiverType') this.caregiverType});

  factory _$_AssignedCaregiver.fromJson(Map<String, dynamic> json) =>
      _$$_AssignedCaregiverFromJson(json);

  @override
  @JsonKey(name: 'clientID')
  final String? clientID;
  @override
  @JsonKey(name: 'caregiverID')
  final String? caregiverID;
  @override
  @JsonKey(name: 'caregiverType')
  final CaregiverType? caregiverType;

  @override
  String toString() {
    return 'AssignedCaregiver(clientID: $clientID, caregiverID: $caregiverID, caregiverType: $caregiverType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssignedCaregiver &&
            (identical(other.clientID, clientID) ||
                other.clientID == clientID) &&
            (identical(other.caregiverID, caregiverID) ||
                other.caregiverID == caregiverID) &&
            (identical(other.caregiverType, caregiverType) ||
                other.caregiverType == caregiverType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, clientID, caregiverID, caregiverType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssignedCaregiverCopyWith<_$_AssignedCaregiver> get copyWith =>
      __$$_AssignedCaregiverCopyWithImpl<_$_AssignedCaregiver>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignedCaregiverToJson(
      this,
    );
  }
}

abstract class _AssignedCaregiver implements AssignedCaregiver {
  factory _AssignedCaregiver(
          {@JsonKey(name: 'clientID') final String? clientID,
          @JsonKey(name: 'caregiverID') final String? caregiverID,
          @JsonKey(name: 'caregiverType') final CaregiverType? caregiverType}) =
      _$_AssignedCaregiver;

  factory _AssignedCaregiver.fromJson(Map<String, dynamic> json) =
      _$_AssignedCaregiver.fromJson;

  @override
  @JsonKey(name: 'clientID')
  String? get clientID;
  @override
  @JsonKey(name: 'caregiverID')
  String? get caregiverID;
  @override
  @JsonKey(name: 'caregiverType')
  CaregiverType? get caregiverType;
  @override
  @JsonKey(ignore: true)
  _$$_AssignedCaregiverCopyWith<_$_AssignedCaregiver> get copyWith =>
      throw _privateConstructorUsedError;
}
