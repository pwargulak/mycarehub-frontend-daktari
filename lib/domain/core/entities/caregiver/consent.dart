// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

part 'consent.freezed.dart';
part 'consent.g.dart';

@freezed
class Consent with _$Consent {
  factory Consent({
    @JsonKey(name: 'consentStatus') ConsentStatus? consentStatus,
  }) = _Consent;

  factory Consent.fromJson(Map<String, dynamic> json) =>
      _$ConsentFromJson(json);

  factory Consent.initial() => Consent(
        consentStatus: ConsentStatus.UNKNOWN,
      );
}
