// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_group_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateGroupPayload _$CreateGroupPayloadFromJson(Map<String, dynamic> json) {
  return _CreateGroupPayload.fromJson(json);
}

/// @nodoc
mixin _$CreateGroupPayload {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  AgeRange? get ageRange => throw _privateConstructorUsedError;
  List<Gender>? get gender => throw _privateConstructorUsedError;
  List<ClientType>? get clientType => throw _privateConstructorUsedError;
  bool? get inviteOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateGroupPayloadCopyWith<CreateGroupPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupPayloadCopyWith<$Res> {
  factory $CreateGroupPayloadCopyWith(
          CreateGroupPayload value, $Res Function(CreateGroupPayload) then) =
      _$CreateGroupPayloadCopyWithImpl<$Res, CreateGroupPayload>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      AgeRange? ageRange,
      List<Gender>? gender,
      List<ClientType>? clientType,
      bool? inviteOnly});

  $AgeRangeCopyWith<$Res>? get ageRange;
}

/// @nodoc
class _$CreateGroupPayloadCopyWithImpl<$Res, $Val extends CreateGroupPayload>
    implements $CreateGroupPayloadCopyWith<$Res> {
  _$CreateGroupPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? ageRange = freezed,
    Object? gender = freezed,
    Object? clientType = freezed,
    Object? inviteOnly = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ageRange: freezed == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as AgeRange?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
      clientType: freezed == clientType
          ? _value.clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      inviteOnly: freezed == inviteOnly
          ? _value.inviteOnly
          : inviteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AgeRangeCopyWith<$Res>? get ageRange {
    if (_value.ageRange == null) {
      return null;
    }

    return $AgeRangeCopyWith<$Res>(_value.ageRange!, (value) {
      return _then(_value.copyWith(ageRange: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateGroupPayloadCopyWith<$Res>
    implements $CreateGroupPayloadCopyWith<$Res> {
  factory _$$_CreateGroupPayloadCopyWith(_$_CreateGroupPayload value,
          $Res Function(_$_CreateGroupPayload) then) =
      __$$_CreateGroupPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      AgeRange? ageRange,
      List<Gender>? gender,
      List<ClientType>? clientType,
      bool? inviteOnly});

  @override
  $AgeRangeCopyWith<$Res>? get ageRange;
}

/// @nodoc
class __$$_CreateGroupPayloadCopyWithImpl<$Res>
    extends _$CreateGroupPayloadCopyWithImpl<$Res, _$_CreateGroupPayload>
    implements _$$_CreateGroupPayloadCopyWith<$Res> {
  __$$_CreateGroupPayloadCopyWithImpl(
      _$_CreateGroupPayload _value, $Res Function(_$_CreateGroupPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? ageRange = freezed,
    Object? gender = freezed,
    Object? clientType = freezed,
    Object? inviteOnly = freezed,
  }) {
    return _then(_$_CreateGroupPayload(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      ageRange: freezed == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as AgeRange?,
      gender: freezed == gender
          ? _value._gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
      clientType: freezed == clientType
          ? _value._clientType
          : clientType // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      inviteOnly: freezed == inviteOnly
          ? _value.inviteOnly
          : inviteOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CreateGroupPayload implements _CreateGroupPayload {
  _$_CreateGroupPayload(
      {this.name,
      this.description,
      this.ageRange,
      final List<Gender>? gender,
      final List<ClientType>? clientType,
      this.inviteOnly})
      : _gender = gender,
        _clientType = clientType;

  factory _$_CreateGroupPayload.fromJson(Map<String, dynamic> json) =>
      _$$_CreateGroupPayloadFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final AgeRange? ageRange;
  final List<Gender>? _gender;
  @override
  List<Gender>? get gender {
    final value = _gender;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ClientType>? _clientType;
  @override
  List<ClientType>? get clientType {
    final value = _clientType;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? inviteOnly;

  @override
  String toString() {
    return 'CreateGroupPayload(name: $name, description: $description, ageRange: $ageRange, gender: $gender, clientType: $clientType, inviteOnly: $inviteOnly)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateGroupPayload &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ageRange, ageRange) ||
                other.ageRange == ageRange) &&
            const DeepCollectionEquality().equals(other._gender, _gender) &&
            const DeepCollectionEquality()
                .equals(other._clientType, _clientType) &&
            (identical(other.inviteOnly, inviteOnly) ||
                other.inviteOnly == inviteOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      ageRange,
      const DeepCollectionEquality().hash(_gender),
      const DeepCollectionEquality().hash(_clientType),
      inviteOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateGroupPayloadCopyWith<_$_CreateGroupPayload> get copyWith =>
      __$$_CreateGroupPayloadCopyWithImpl<_$_CreateGroupPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateGroupPayloadToJson(
      this,
    );
  }
}

abstract class _CreateGroupPayload implements CreateGroupPayload {
  factory _CreateGroupPayload(
      {final String? name,
      final String? description,
      final AgeRange? ageRange,
      final List<Gender>? gender,
      final List<ClientType>? clientType,
      final bool? inviteOnly}) = _$_CreateGroupPayload;

  factory _CreateGroupPayload.fromJson(Map<String, dynamic> json) =
      _$_CreateGroupPayload.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  AgeRange? get ageRange;
  @override
  List<Gender>? get gender;
  @override
  List<ClientType>? get clientType;
  @override
  bool? get inviteOnly;
  @override
  @JsonKey(ignore: true)
  _$$_CreateGroupPayloadCopyWith<_$_CreateGroupPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
