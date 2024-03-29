// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service_request_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServiceRequestResponse _$ServiceRequestResponseFromJson(
    Map<String, dynamic> json) {
  return _ServiceRequestResponse.fromJson(json);
}

/// @nodoc
mixin _$ServiceRequestResponse {
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequest>? get serviceRequests =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'getPendingServiceRequestsCount')
  PendingServiceRequestCount? get pendingServiceRequests =>
      throw _privateConstructorUsedError;
  bool? get errorFetchingServiceRequests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceRequestResponseCopyWith<ServiceRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceRequestResponseCopyWith<$Res> {
  factory $ServiceRequestResponseCopyWith(ServiceRequestResponse value,
          $Res Function(ServiceRequestResponse) then) =
      _$ServiceRequestResponseCopyWithImpl<$Res, ServiceRequestResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequestCount? pendingServiceRequests,
      bool? errorFetchingServiceRequests});

  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequests;
}

/// @nodoc
class _$ServiceRequestResponseCopyWithImpl<$Res,
        $Val extends ServiceRequestResponse>
    implements $ServiceRequestResponseCopyWith<$Res> {
  _$ServiceRequestResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRequests = freezed,
    Object? pendingServiceRequests = freezed,
    Object? errorFetchingServiceRequests = freezed,
  }) {
    return _then(_value.copyWith(
      serviceRequests: freezed == serviceRequests
          ? _value.serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      pendingServiceRequests: freezed == pendingServiceRequests
          ? _value.pendingServiceRequests
          : pendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequestCount?,
      errorFetchingServiceRequests: freezed == errorFetchingServiceRequests
          ? _value.errorFetchingServiceRequests
          : errorFetchingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequests {
    if (_value.pendingServiceRequests == null) {
      return null;
    }

    return $PendingServiceRequestCountCopyWith<$Res>(
        _value.pendingServiceRequests!, (value) {
      return _then(_value.copyWith(pendingServiceRequests: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceRequestResponseCopyWith<$Res>
    implements $ServiceRequestResponseCopyWith<$Res> {
  factory _$$_ServiceRequestResponseCopyWith(_$_ServiceRequestResponse value,
          $Res Function(_$_ServiceRequestResponse) then) =
      __$$_ServiceRequestResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'getServiceRequests')
          List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          PendingServiceRequestCount? pendingServiceRequests,
      bool? errorFetchingServiceRequests});

  @override
  $PendingServiceRequestCountCopyWith<$Res>? get pendingServiceRequests;
}

/// @nodoc
class __$$_ServiceRequestResponseCopyWithImpl<$Res>
    extends _$ServiceRequestResponseCopyWithImpl<$Res,
        _$_ServiceRequestResponse>
    implements _$$_ServiceRequestResponseCopyWith<$Res> {
  __$$_ServiceRequestResponseCopyWithImpl(_$_ServiceRequestResponse _value,
      $Res Function(_$_ServiceRequestResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? serviceRequests = freezed,
    Object? pendingServiceRequests = freezed,
    Object? errorFetchingServiceRequests = freezed,
  }) {
    return _then(_$_ServiceRequestResponse(
      serviceRequests: freezed == serviceRequests
          ? _value._serviceRequests
          : serviceRequests // ignore: cast_nullable_to_non_nullable
              as List<ServiceRequest>?,
      pendingServiceRequests: freezed == pendingServiceRequests
          ? _value.pendingServiceRequests
          : pendingServiceRequests // ignore: cast_nullable_to_non_nullable
              as PendingServiceRequestCount?,
      errorFetchingServiceRequests: freezed == errorFetchingServiceRequests
          ? _value.errorFetchingServiceRequests
          : errorFetchingServiceRequests // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceRequestResponse implements _ServiceRequestResponse {
  _$_ServiceRequestResponse(
      {@JsonKey(name: 'getServiceRequests')
          final List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          this.pendingServiceRequests,
      this.errorFetchingServiceRequests})
      : _serviceRequests = serviceRequests;

  factory _$_ServiceRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceRequestResponseFromJson(json);

  final List<ServiceRequest>? _serviceRequests;
  @override
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequest>? get serviceRequests {
    final value = _serviceRequests;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'getPendingServiceRequestsCount')
  final PendingServiceRequestCount? pendingServiceRequests;
  @override
  final bool? errorFetchingServiceRequests;

  @override
  String toString() {
    return 'ServiceRequestResponse(serviceRequests: $serviceRequests, pendingServiceRequests: $pendingServiceRequests, errorFetchingServiceRequests: $errorFetchingServiceRequests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceRequestResponse &&
            const DeepCollectionEquality()
                .equals(other._serviceRequests, _serviceRequests) &&
            (identical(other.pendingServiceRequests, pendingServiceRequests) ||
                other.pendingServiceRequests == pendingServiceRequests) &&
            (identical(other.errorFetchingServiceRequests,
                    errorFetchingServiceRequests) ||
                other.errorFetchingServiceRequests ==
                    errorFetchingServiceRequests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_serviceRequests),
      pendingServiceRequests,
      errorFetchingServiceRequests);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceRequestResponseCopyWith<_$_ServiceRequestResponse> get copyWith =>
      __$$_ServiceRequestResponseCopyWithImpl<_$_ServiceRequestResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceRequestResponseToJson(
      this,
    );
  }
}

abstract class _ServiceRequestResponse implements ServiceRequestResponse {
  factory _ServiceRequestResponse(
      {@JsonKey(name: 'getServiceRequests')
          final List<ServiceRequest>? serviceRequests,
      @JsonKey(name: 'getPendingServiceRequestsCount')
          final PendingServiceRequestCount? pendingServiceRequests,
      final bool? errorFetchingServiceRequests}) = _$_ServiceRequestResponse;

  factory _ServiceRequestResponse.fromJson(Map<String, dynamic> json) =
      _$_ServiceRequestResponse.fromJson;

  @override
  @JsonKey(name: 'getServiceRequests')
  List<ServiceRequest>? get serviceRequests;
  @override
  @JsonKey(name: 'getPendingServiceRequestsCount')
  PendingServiceRequestCount? get pendingServiceRequests;
  @override
  bool? get errorFetchingServiceRequests;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceRequestResponseCopyWith<_$_ServiceRequestResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
