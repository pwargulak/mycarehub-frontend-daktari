// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'assigned_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AssignedClient _$AssignedClientFromJson(Map<String, dynamic> json) {
  return _AssignedClient.fromJson(json);
}

/// @nodoc
mixin _$AssignedClient {
  @JsonKey(name: 'clientID')
  String? get clientID => throw _privateConstructorUsedError;
  @JsonKey(name: 'caregiverType')
  String? get caregiverType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedClientCopyWith<AssignedClient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedClientCopyWith<$Res> {
  factory $AssignedClientCopyWith(
          AssignedClient value, $Res Function(AssignedClient) then) =
      _$AssignedClientCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'clientID') String? clientID,
      @JsonKey(name: 'caregiverType') String? caregiverType});
}

/// @nodoc
class _$AssignedClientCopyWithImpl<$Res>
    implements $AssignedClientCopyWith<$Res> {
  _$AssignedClientCopyWithImpl(this._value, this._then);

  final AssignedClient _value;
  // ignore: unused_field
  final $Res Function(AssignedClient) _then;

  @override
  $Res call({
    Object? clientID = freezed,
    Object? caregiverType = freezed,
  }) {
    return _then(_value.copyWith(
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverType: caregiverType == freezed
          ? _value.caregiverType
          : caregiverType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AssignedClientCopyWith<$Res>
    implements $AssignedClientCopyWith<$Res> {
  factory _$$_AssignedClientCopyWith(
          _$_AssignedClient value, $Res Function(_$_AssignedClient) then) =
      __$$_AssignedClientCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'clientID') String? clientID,
      @JsonKey(name: 'caregiverType') String? caregiverType});
}

/// @nodoc
class __$$_AssignedClientCopyWithImpl<$Res>
    extends _$AssignedClientCopyWithImpl<$Res>
    implements _$$_AssignedClientCopyWith<$Res> {
  __$$_AssignedClientCopyWithImpl(
      _$_AssignedClient _value, $Res Function(_$_AssignedClient) _then)
      : super(_value, (v) => _then(v as _$_AssignedClient));

  @override
  _$_AssignedClient get _value => super._value as _$_AssignedClient;

  @override
  $Res call({
    Object? clientID = freezed,
    Object? caregiverType = freezed,
  }) {
    return _then(_$_AssignedClient(
      clientID: clientID == freezed
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
      caregiverType: caregiverType == freezed
          ? _value.caregiverType
          : caregiverType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssignedClient implements _AssignedClient {
  _$_AssignedClient(
      {@JsonKey(name: 'clientID') this.clientID,
      @JsonKey(name: 'caregiverType') this.caregiverType});

  factory _$_AssignedClient.fromJson(Map<String, dynamic> json) =>
      _$$_AssignedClientFromJson(json);

  @override
  @JsonKey(name: 'clientID')
  final String? clientID;
  @override
  @JsonKey(name: 'caregiverType')
  final String? caregiverType;

  @override
  String toString() {
    return 'AssignedClient(clientID: $clientID, caregiverType: $caregiverType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssignedClient &&
            const DeepCollectionEquality().equals(other.clientID, clientID) &&
            const DeepCollectionEquality()
                .equals(other.caregiverType, caregiverType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(clientID),
      const DeepCollectionEquality().hash(caregiverType));

  @JsonKey(ignore: true)
  @override
  _$$_AssignedClientCopyWith<_$_AssignedClient> get copyWith =>
      __$$_AssignedClientCopyWithImpl<_$_AssignedClient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssignedClientToJson(
      this,
    );
  }
}

abstract class _AssignedClient implements AssignedClient {
  factory _AssignedClient(
          {@JsonKey(name: 'clientID') final String? clientID,
          @JsonKey(name: 'caregiverType') final String? caregiverType}) =
      _$_AssignedClient;

  factory _AssignedClient.fromJson(Map<String, dynamic> json) =
      _$_AssignedClient.fromJson;

  @override
  @JsonKey(name: 'clientID')
  String? get clientID;
  @override
  @JsonKey(name: 'caregiverType')
  String? get caregiverType;
  @override
  @JsonKey(ignore: true)
  _$$_AssignedClientCopyWith<_$_AssignedClient> get copyWith =>
      throw _privateConstructorUsedError;
}
