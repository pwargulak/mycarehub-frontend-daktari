// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_program_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateProgramPayload _$CreateProgramPayloadFromJson(Map<String, dynamic> json) {
  return _CreateProgramPayload.fromJson(json);
}

/// @nodoc
mixin _$CreateProgramPayload {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'organisationID')
  String? get organisationID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateProgramPayloadCopyWith<CreateProgramPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateProgramPayloadCopyWith<$Res> {
  factory $CreateProgramPayloadCopyWith(CreateProgramPayload value,
          $Res Function(CreateProgramPayload) then) =
      _$CreateProgramPayloadCopyWithImpl<$Res, CreateProgramPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'organisationID') String? organisationID});
}

/// @nodoc
class _$CreateProgramPayloadCopyWithImpl<$Res,
        $Val extends CreateProgramPayload>
    implements $CreateProgramPayloadCopyWith<$Res> {
  _$CreateProgramPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? organisationID = freezed,
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
      organisationID: freezed == organisationID
          ? _value.organisationID
          : organisationID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateProgramPayloadCopyWith<$Res>
    implements $CreateProgramPayloadCopyWith<$Res> {
  factory _$$_CreateProgramPayloadCopyWith(_$_CreateProgramPayload value,
          $Res Function(_$_CreateProgramPayload) then) =
      __$$_CreateProgramPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'organisationID') String? organisationID});
}

/// @nodoc
class __$$_CreateProgramPayloadCopyWithImpl<$Res>
    extends _$CreateProgramPayloadCopyWithImpl<$Res, _$_CreateProgramPayload>
    implements _$$_CreateProgramPayloadCopyWith<$Res> {
  __$$_CreateProgramPayloadCopyWithImpl(_$_CreateProgramPayload _value,
      $Res Function(_$_CreateProgramPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? organisationID = freezed,
  }) {
    return _then(_$_CreateProgramPayload(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      organisationID: freezed == organisationID
          ? _value.organisationID
          : organisationID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CreateProgramPayload implements _CreateProgramPayload {
  _$_CreateProgramPayload(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'organisationID') this.organisationID});

  factory _$_CreateProgramPayload.fromJson(Map<String, dynamic> json) =>
      _$$_CreateProgramPayloadFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'organisationID')
  final String? organisationID;

  @override
  String toString() {
    return 'CreateProgramPayload(name: $name, description: $description, organisationID: $organisationID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateProgramPayload &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.organisationID, organisationID) ||
                other.organisationID == organisationID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, organisationID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateProgramPayloadCopyWith<_$_CreateProgramPayload> get copyWith =>
      __$$_CreateProgramPayloadCopyWithImpl<_$_CreateProgramPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateProgramPayloadToJson(
      this,
    );
  }
}

abstract class _CreateProgramPayload implements CreateProgramPayload {
  factory _CreateProgramPayload(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'description') final String? description,
          @JsonKey(name: 'organisationID') final String? organisationID}) =
      _$_CreateProgramPayload;

  factory _CreateProgramPayload.fromJson(Map<String, dynamic> json) =
      _$_CreateProgramPayload.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'organisationID')
  String? get organisationID;
  @override
  @JsonKey(ignore: true)
  _$$_CreateProgramPayloadCopyWith<_$_CreateProgramPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
