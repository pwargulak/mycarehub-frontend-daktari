// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregivers_list.dart';

part 'client_caregivers_response.freezed.dart';
part 'client_caregivers_response.g.dart';

@freezed
class ClientCaregiversResponse with _$ClientCaregiversResponse {
  factory ClientCaregiversResponse({
    @JsonKey(name: 'listClientsCaregivers') CaregiversList? caregiversList,
  }) = _ClientCaregiversResponse;

  factory ClientCaregiversResponse.fromJson(Map<String, dynamic> json) =>
      _$ClientCaregiversResponseFromJson(json);
}
