// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'client_configuration_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClientConfigurationPayload _$ClientConfigurationPayloadFromJson(
    Map<String, dynamic> json) {
  return _ClientConfigurationPayload.fromJson(json);
}

/// @nodoc
mixin _$ClientConfigurationPayload {
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender')
  List<Gender>? get gender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientConfigurationPayloadCopyWith<ClientConfigurationPayload>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientConfigurationPayloadCopyWith<$Res> {
  factory $ClientConfigurationPayloadCopyWith(ClientConfigurationPayload value,
          $Res Function(ClientConfigurationPayload) then) =
      _$ClientConfigurationPayloadCopyWithImpl<$Res,
          ClientConfigurationPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'gender') List<Gender>? gender});
}

/// @nodoc
class _$ClientConfigurationPayloadCopyWithImpl<$Res,
        $Val extends ClientConfigurationPayload>
    implements $ClientConfigurationPayloadCopyWith<$Res> {
  _$ClientConfigurationPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientTypes = freezed,
    Object? gender = freezed,
  }) {
    return _then(_value.copyWith(
      clientTypes: freezed == clientTypes
          ? _value.clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClientConfigurationPayloadCopyWith<$Res>
    implements $ClientConfigurationPayloadCopyWith<$Res> {
  factory _$$_ClientConfigurationPayloadCopyWith(
          _$_ClientConfigurationPayload value,
          $Res Function(_$_ClientConfigurationPayload) then) =
      __$$_ClientConfigurationPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'clientTypes') List<ClientType>? clientTypes,
      @JsonKey(name: 'gender') List<Gender>? gender});
}

/// @nodoc
class __$$_ClientConfigurationPayloadCopyWithImpl<$Res>
    extends _$ClientConfigurationPayloadCopyWithImpl<$Res,
        _$_ClientConfigurationPayload>
    implements _$$_ClientConfigurationPayloadCopyWith<$Res> {
  __$$_ClientConfigurationPayloadCopyWithImpl(
      _$_ClientConfigurationPayload _value,
      $Res Function(_$_ClientConfigurationPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientTypes = freezed,
    Object? gender = freezed,
  }) {
    return _then(_$_ClientConfigurationPayload(
      clientTypes: freezed == clientTypes
          ? _value._clientTypes
          : clientTypes // ignore: cast_nullable_to_non_nullable
              as List<ClientType>?,
      gender: freezed == gender
          ? _value._gender
          : gender // ignore: cast_nullable_to_non_nullable
              as List<Gender>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_ClientConfigurationPayload implements _ClientConfigurationPayload {
  _$_ClientConfigurationPayload(
      {@JsonKey(name: 'clientTypes') final List<ClientType>? clientTypes,
      @JsonKey(name: 'gender') final List<Gender>? gender})
      : _clientTypes = clientTypes,
        _gender = gender;

  factory _$_ClientConfigurationPayload.fromJson(Map<String, dynamic> json) =>
      _$$_ClientConfigurationPayloadFromJson(json);

  final List<ClientType>? _clientTypes;
  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes {
    final value = _clientTypes;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Gender>? _gender;
  @override
  @JsonKey(name: 'gender')
  List<Gender>? get gender {
    final value = _gender;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ClientConfigurationPayload(clientTypes: $clientTypes, gender: $gender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClientConfigurationPayload &&
            const DeepCollectionEquality()
                .equals(other._clientTypes, _clientTypes) &&
            const DeepCollectionEquality().equals(other._gender, _gender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_clientTypes),
      const DeepCollectionEquality().hash(_gender));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientConfigurationPayloadCopyWith<_$_ClientConfigurationPayload>
      get copyWith => __$$_ClientConfigurationPayloadCopyWithImpl<
          _$_ClientConfigurationPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientConfigurationPayloadToJson(
      this,
    );
  }
}

abstract class _ClientConfigurationPayload
    implements ClientConfigurationPayload {
  factory _ClientConfigurationPayload(
          {@JsonKey(name: 'clientTypes') final List<ClientType>? clientTypes,
          @JsonKey(name: 'gender') final List<Gender>? gender}) =
      _$_ClientConfigurationPayload;

  factory _ClientConfigurationPayload.fromJson(Map<String, dynamic> json) =
      _$_ClientConfigurationPayload.fromJson;

  @override
  @JsonKey(name: 'clientTypes')
  List<ClientType>? get clientTypes;
  @override
  @JsonKey(name: 'gender')
  List<Gender>? get gender;
  @override
  @JsonKey(ignore: true)
  _$$_ClientConfigurationPayloadCopyWith<_$_ClientConfigurationPayload>
      get copyWith => throw _privateConstructorUsedError;
}
