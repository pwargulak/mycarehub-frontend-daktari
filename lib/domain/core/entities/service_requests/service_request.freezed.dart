// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequest _$ServiceRequestFromJson(Map<String, dynamic> json) {
  return _ServiceRequest.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequest {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'request')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'requestType')
  ServiceRequestType? get serviceRequestType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'clientID')
  String? get clientId => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientName')
  String? get clientName => throw _privateConstructorUsedError;
  @JsonKey(name: 'clientContact')
  String? get clientPhoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  RequestStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolvedAt')
  String? get resolvedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolvedBy')
  String? get resolvedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolvedByName')
  String? get resolvedByName => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'meta')
  ServiceRequestMeta? get meta => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffID')
  String? get staffId => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffName')
  String? get staffName => throw _privateConstructorUsedError;
  @JsonKey(name: 'staffContact')
  String? get staffPhoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestCopyWith<ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestCopyWith<$Res> {
  factory $ServiceRequestCopyWith(
          ServiceRequest value, $Res Function(ServiceRequest) then) =
      _$ServiceRequestCopyWithImpl<$Res, ServiceRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'request') String? description,
      @JsonKey(name: 'requestType') ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'clientID') String? clientId,
      @JsonKey(name: 'clientName') String? clientName,
      @JsonKey(name: 'clientContact') String? clientPhoneNumber,
      @JsonKey(name: 'status') RequestStatus? status,
      @JsonKey(name: 'resolvedAt') String? resolvedTime,
      @JsonKey(name: 'resolvedBy') String? resolvedBy,
      @JsonKey(name: 'resolvedByName') String? resolvedByName,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'meta') ServiceRequestMeta? meta,
      @JsonKey(name: 'staffID') String? staffId,
      @JsonKey(name: 'staffName') String? staffName,
      @JsonKey(name: 'staffContact') String? staffPhoneNumber});

  $ServiceRequestMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ServiceRequestCopyWithImpl<$Res, $Val extends ServiceRequest>
    implements $ServiceRequestCopyWith<$Res> {
  _$ServiceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? serviceRequestType = freezed,
    Object? clientId = freezed,
    Object? clientName = freezed,
    Object? clientPhoneNumber = freezed,
    Object? status = freezed,
    Object? resolvedTime = freezed,
    Object? resolvedBy = freezed,
    Object? resolvedByName = freezed,
    Object? createdAt = freezed,
    Object? meta = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? staffPhoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceRequestType: freezed == serviceRequestType
          ? _value.serviceRequestType
          : serviceRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhoneNumber: freezed == clientPhoneNumber
          ? _value.clientPhoneNumber
          : clientPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      resolvedTime: freezed == resolvedTime
          ? _value.resolvedTime
          : resolvedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedByName: freezed == resolvedByName
          ? _value.resolvedByName
          : resolvedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ServiceRequestMeta?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      staffPhoneNumber: freezed == staffPhoneNumber
          ? _value.staffPhoneNumber
          : staffPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceRequestMetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $ServiceRequestMetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRequestCopyWith<$Res>
    implements $ServiceRequestCopyWith<$Res> {
  factory _$$_ServiceRequestCopyWith(
          _$_ServiceRequest value, $Res Function(_$_ServiceRequest) then) =
      __$$_ServiceRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'request') String? description,
      @JsonKey(name: 'requestType') ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'clientID') String? clientId,
      @JsonKey(name: 'clientName') String? clientName,
      @JsonKey(name: 'clientContact') String? clientPhoneNumber,
      @JsonKey(name: 'status') RequestStatus? status,
      @JsonKey(name: 'resolvedAt') String? resolvedTime,
      @JsonKey(name: 'resolvedBy') String? resolvedBy,
      @JsonKey(name: 'resolvedByName') String? resolvedByName,
      @JsonKey(name: 'createdAt') String? createdAt,
      @JsonKey(name: 'meta') ServiceRequestMeta? meta,
      @JsonKey(name: 'staffID') String? staffId,
      @JsonKey(name: 'staffName') String? staffName,
      @JsonKey(name: 'staffContact') String? staffPhoneNumber});

  @override
  $ServiceRequestMetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$_ServiceRequestCopyWithImpl<$Res>
    extends _$ServiceRequestCopyWithImpl<$Res, _$_ServiceRequest>
    implements _$$_ServiceRequestCopyWith<$Res> {
  __$$_ServiceRequestCopyWithImpl(
      _$_ServiceRequest _value, $Res Function(_$_ServiceRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? description = freezed,
    Object? serviceRequestType = freezed,
    Object? clientId = freezed,
    Object? clientName = freezed,
    Object? clientPhoneNumber = freezed,
    Object? status = freezed,
    Object? resolvedTime = freezed,
    Object? resolvedBy = freezed,
    Object? resolvedByName = freezed,
    Object? createdAt = freezed,
    Object? meta = freezed,
    Object? staffId = freezed,
    Object? staffName = freezed,
    Object? staffPhoneNumber = freezed,
  }) {
    return _then(_$_ServiceRequest(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceRequestType: freezed == serviceRequestType
          ? _value.serviceRequestType
          : serviceRequestType // ignore: cast_nullable_to_non_nullable
              as ServiceRequestType?,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      clientName: freezed == clientName
          ? _value.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String?,
      clientPhoneNumber: freezed == clientPhoneNumber
          ? _value.clientPhoneNumber
          : clientPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestStatus?,
      resolvedTime: freezed == resolvedTime
          ? _value.resolvedTime
          : resolvedTime // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedBy: freezed == resolvedBy
          ? _value.resolvedBy
          : resolvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      resolvedByName: freezed == resolvedByName
          ? _value.resolvedByName
          : resolvedByName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ServiceRequestMeta?,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      staffName: freezed == staffName
          ? _value.staffName
          : staffName // ignore: cast_nullable_to_non_nullable
              as String?,
      staffPhoneNumber: freezed == staffPhoneNumber
          ? _value.staffPhoneNumber
          : staffPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequest implements _ServiceRequest {
  _$_ServiceRequest(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'request') this.description,
      @JsonKey(name: 'requestType') this.serviceRequestType,
      @JsonKey(name: 'clientID') this.clientId,
      @JsonKey(name: 'clientName') this.clientName,
      @JsonKey(name: 'clientContact') this.clientPhoneNumber,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'resolvedAt') this.resolvedTime,
      @JsonKey(name: 'resolvedBy') this.resolvedBy,
      @JsonKey(name: 'resolvedByName') this.resolvedByName,
      @JsonKey(name: 'createdAt') this.createdAt,
      @JsonKey(name: 'meta') this.meta,
      @JsonKey(name: 'staffID') this.staffId,
      @JsonKey(name: 'staffName') this.staffName,
      @JsonKey(name: 'staffContact') this.staffPhoneNumber});

  factory _$_ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'request')
  final String? description;
  @override
  @JsonKey(name: 'requestType')
  final ServiceRequestType? serviceRequestType;
  @override
  @JsonKey(name: 'clientID')
  final String? clientId;
  @override
  @JsonKey(name: 'clientName')
  final String? clientName;
  @override
  @JsonKey(name: 'clientContact')
  final String? clientPhoneNumber;
  @override
  @JsonKey(name: 'status')
  final RequestStatus? status;
  @override
  @JsonKey(name: 'resolvedAt')
  final String? resolvedTime;
  @override
  @JsonKey(name: 'resolvedBy')
  final String? resolvedBy;
  @override
  @JsonKey(name: 'resolvedByName')
  final String? resolvedByName;
  @override
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: 'meta')
  final ServiceRequestMeta? meta;
  @override
  @JsonKey(name: 'staffID')
  final String? staffId;
  @override
  @JsonKey(name: 'staffName')
  final String? staffName;
  @override
  @JsonKey(name: 'staffContact')
  final String? staffPhoneNumber;

  @override
  String toString() {
    return 'ServiceRequest(id: $id, description: $description, serviceRequestType: $serviceRequestType, clientId: $clientId, clientName: $clientName, clientPhoneNumber: $clientPhoneNumber, status: $status, resolvedTime: $resolvedTime, resolvedBy: $resolvedBy, resolvedByName: $resolvedByName, createdAt: $createdAt, meta: $meta, staffId: $staffId, staffName: $staffName, staffPhoneNumber: $staffPhoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.serviceRequestType, serviceRequestType) ||
                other.serviceRequestType == serviceRequestType) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.clientPhoneNumber, clientPhoneNumber) ||
                other.clientPhoneNumber == clientPhoneNumber) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.resolvedTime, resolvedTime) ||
                other.resolvedTime == resolvedTime) &&
            (identical(other.resolvedBy, resolvedBy) ||
                other.resolvedBy == resolvedBy) &&
            (identical(other.resolvedByName, resolvedByName) ||
                other.resolvedByName == resolvedByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.meta, meta) || other.meta == meta) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.staffName, staffName) ||
                other.staffName == staffName) &&
            (identical(other.staffPhoneNumber, staffPhoneNumber) ||
                other.staffPhoneNumber == staffPhoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      description,
      serviceRequestType,
      clientId,
      clientName,
      clientPhoneNumber,
      status,
      resolvedTime,
      resolvedBy,
      resolvedByName,
      createdAt,
      meta,
      staffId,
      staffName,
      staffPhoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      __$$_ServiceRequestCopyWithImpl<_$_ServiceRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestToJson(
      this,
    );
  }
}

abstract class _ServiceRequest implements ServiceRequest {
  factory _ServiceRequest(
      {@JsonKey(name: 'id')
          final String? id,
      @JsonKey(name: 'request')
          final String? description,
      @JsonKey(name: 'requestType')
          final ServiceRequestType? serviceRequestType,
      @JsonKey(name: 'clientID')
          final String? clientId,
      @JsonKey(name: 'clientName')
          final String? clientName,
      @JsonKey(name: 'clientContact')
          final String? clientPhoneNumber,
      @JsonKey(name: 'status')
          final RequestStatus? status,
      @JsonKey(name: 'resolvedAt')
          final String? resolvedTime,
      @JsonKey(name: 'resolvedBy')
          final String? resolvedBy,
      @JsonKey(name: 'resolvedByName')
          final String? resolvedByName,
      @JsonKey(name: 'createdAt')
          final String? createdAt,
      @JsonKey(name: 'meta')
          final ServiceRequestMeta? meta,
      @JsonKey(name: 'staffID')
          final String? staffId,
      @JsonKey(name: 'staffName')
          final String? staffName,
      @JsonKey(name: 'staffContact')
          final String? staffPhoneNumber}) = _$_ServiceRequest;

  factory _ServiceRequest.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequest.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'request')
  String? get description;
  @override
  @JsonKey(name: 'requestType')
  ServiceRequestType? get serviceRequestType;
  @override
  @JsonKey(name: 'clientID')
  String? get clientId;
  @override
  @JsonKey(name: 'clientName')
  String? get clientName;
  @override
  @JsonKey(name: 'clientContact')
  String? get clientPhoneNumber;
  @override
  @JsonKey(name: 'status')
  RequestStatus? get status;
  @override
  @JsonKey(name: 'resolvedAt')
  String? get resolvedTime;
  @override
  @JsonKey(name: 'resolvedBy')
  String? get resolvedBy;
  @override
  @JsonKey(name: 'resolvedByName')
  String? get resolvedByName;
  @override
  @JsonKey(name: 'createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: 'meta')
  ServiceRequestMeta? get meta;
  @override
  @JsonKey(name: 'staffID')
  String? get staffId;
  @override
  @JsonKey(name: 'staffName')
  String? get staffName;
  @override
  @JsonKey(name: 'staffContact')
  String? get staffPhoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestCopyWith<_$_ServiceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
