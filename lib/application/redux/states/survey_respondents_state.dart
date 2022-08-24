import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';

part 'survey_respondents_state.freezed.dart';
part 'survey_respondents_state.g.dart';

@freezed
class SurveyRespondentsState with _$SurveyRespondentsState {
  factory SurveyRespondentsState({
    @JsonKey(name: 'surveyRespondents')
        List<SurveyRespondent?>? surveyRespondents,
    bool? errorOccurred,
  }) = _SurveyRespondentsState;

  factory SurveyRespondentsState.fromJson(Map<String, dynamic> json) =>
      _$SurveyRespondentsStateFromJson(json);

  factory SurveyRespondentsState.initial() => SurveyRespondentsState(
        surveyRespondents: <SurveyRespondent>[],
        errorOccurred: false,
      );
}
