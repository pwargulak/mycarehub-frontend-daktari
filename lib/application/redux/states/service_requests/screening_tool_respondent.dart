import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'screening_tool_respondent.freezed.dart';
part 'screening_tool_respondent.g.dart';

@freezed
class ScreeningToolRespondent with _$ScreeningToolRespondent {
  factory ScreeningToolRespondent({
    @JsonKey(name: 'clientID') String? clientID,
    @JsonKey(name: 'screeningToolResponseID') String? screeningToolResponseID,
    @JsonKey(name: 'serviceRequestID') String? serviceRequestID,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'serviceRequest') String? serviceRequest,
  }) = _ScreeningToolRespondent;

  factory ScreeningToolRespondent.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolRespondentFromJson(json);

  factory ScreeningToolRespondent.initial() => ScreeningToolRespondent(
        name: UNKNOWN,
        clientID: UNKNOWN,
        screeningToolResponseID: UNKNOWN,
        serviceRequest: UNKNOWN,
        serviceRequestID: UNKNOWN,
      );
}
