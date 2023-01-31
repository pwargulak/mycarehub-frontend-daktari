// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_identifier.freezed.dart';
part 'facility_identifier.g.dart';

@freezed
class FacilityIdentifier with _$FacilityIdentifier {
  factory FacilityIdentifier({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'value') String? value,
    @JsonKey(name: 'type') String? type,
  }) = _FacilityIdentifier;

  factory FacilityIdentifier.fromJson(Map<String, dynamic> json) =>
      _$FacilityIdentifierFromJson(json);

  factory FacilityIdentifier.initial() => FacilityIdentifier(
        id: UNKNOWN,
        value: UNKNOWN,
        type: UNKNOWN,
      );
}
