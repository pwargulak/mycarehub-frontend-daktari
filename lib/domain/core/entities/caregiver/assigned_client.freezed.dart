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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssignedClientCopyWith<AssignedClient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignedClientCopyWith<$Res> {
  factory $AssignedClientCopyWith(
          AssignedClient value, $Res Function(AssignedClient) then) =
      _$AssignedClientCopyWithImpl<$Res, AssignedClient>;
  @useResult
  $Res call({@JsonKey(name: 'clientID') String? clientID});
}

/// @nodoc
class _$AssignedClientCopyWithImpl<$Res, $Val extends AssignedClient>
    implements $AssignedClientCopyWith<$Res> {
  _$AssignedClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientID = freezed,
  }) {
    return _then(_value.copyWith(
      clientID: freezed == clientID
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AssignedClientCopyWith<$Res>
    implements $AssignedClientCopyWith<$Res> {
  factory _$$_AssignedClientCopyWith(
          _$_AssignedClient value, $Res Function(_$_AssignedClient) then) =
      __$$_AssignedClientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'clientID') String? clientID});
}

/// @nodoc
class __$$_AssignedClientCopyWithImpl<$Res>
    extends _$AssignedClientCopyWithImpl<$Res, _$_AssignedClient>
    implements _$$_AssignedClientCopyWith<$Res> {
  __$$_AssignedClientCopyWithImpl(
      _$_AssignedClient _value, $Res Function(_$_AssignedClient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientID = freezed,
  }) {
    return _then(_$_AssignedClient(
      clientID: freezed == clientID
          ? _value.clientID
          : clientID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AssignedClient implements _AssignedClient {
  _$_AssignedClient({@JsonKey(name: 'clientID') this.clientID});

  factory _$_AssignedClient.fromJson(Map<String, dynamic> json) =>
      _$$_AssignedClientFromJson(json);

  @override
  @JsonKey(name: 'clientID')
  final String? clientID;

  @override
  String toString() {
    return 'AssignedClient(clientID: $clientID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AssignedClient &&
            (identical(other.clientID, clientID) ||
                other.clientID == clientID));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clientID);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
  factory _AssignedClient({@JsonKey(name: 'clientID') final String? clientID}) =
      _$_AssignedClient;

  factory _AssignedClient.fromJson(Map<String, dynamic> json) =
      _$_AssignedClient.fromJson;

  @override
  @JsonKey(name: 'clientID')
  String? get clientID;
  @override
  @JsonKey(ignore: true)
  _$$_AssignedClientCopyWith<_$_AssignedClient> get copyWith =>
      throw _privateConstructorUsedError;
}
