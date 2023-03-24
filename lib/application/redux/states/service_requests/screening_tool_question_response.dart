import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/question_response.dart';

part 'screening_tool_question_response.freezed.dart';
part 'screening_tool_question_response.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ScreeningToolQuestionResponses with _$ScreeningToolQuestionResponses {
  factory ScreeningToolQuestionResponses({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'screeningToolID') String? screeningToolId,
    @JsonKey(name: 'facilityID') String? facilityId,
    @JsonKey(name: 'clientID') String? clientId,
    @JsonKey(name: 'questionResponses')
        List<QuestionResponse>? questionResponses,
  }) = _ScreeningToolQuestionResponses;

  factory ScreeningToolQuestionResponses.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolQuestionResponsesFromJson(json);

  factory ScreeningToolQuestionResponses.initial() =>
      ScreeningToolQuestionResponses(
        id: UNKNOWN,
        screeningToolId: UNKNOWN,
        questionResponses: <QuestionResponse>[],
      );
}
