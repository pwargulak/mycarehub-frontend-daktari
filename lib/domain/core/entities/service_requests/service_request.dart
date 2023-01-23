import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request_meta.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

part 'service_request.freezed.dart';
part 'service_request.g.dart';

@freezed
class ServiceRequest with _$ServiceRequest {
  factory ServiceRequest({
    @JsonKey(name: 'id') String? id,
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
    @JsonKey(name: 'staffContact') String? staffPhoneNumber,
  }) = _ServiceRequest;

  factory ServiceRequest.fromJson(Map<String, dynamic> json) =>
      _$ServiceRequestFromJson(json);
}
