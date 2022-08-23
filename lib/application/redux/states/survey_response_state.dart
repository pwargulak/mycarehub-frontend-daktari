import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';

part 'survey_response_state.freezed.dart';
part 'survey_response_state.g.dart';

@freezed
class SurveyResponseState with _$SurveyResponseState {
  factory SurveyResponseState({
    @JsonKey(name: 'listSurveyResponses')
        List<SurveyResponse?>? surveyResponses,
    bool? errorOccurred,
    bool? timeOutOccurred,
  }) = _SurveyResponseState;

  factory SurveyResponseState.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseStateFromJson(json);

  factory SurveyResponseState.initial() => SurveyResponseState(
        surveyResponses: <SurveyResponse>[],
        errorOccurred: false,
        timeOutOccurred: false,
      );
}
