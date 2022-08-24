import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_respondents_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';

part 'survey_state.freezed.dart';
part 'survey_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SurveyState with _$SurveyState {
  factory SurveyState({
    @JsonKey(name: 'listSurveys') List<Survey?>? surveys,
    @JsonKey(name: 'listSurveyRespondents')
        SurveyRespondentsState? surveyRespondentsState,
    @JsonKey(name: 'getSurveyResponse') List<SurveyResponse>? surveyResponses,
    bool? errorFetchingSurveys,
  }) = _SurveyState;

  factory SurveyState.fromJson(Map<String, dynamic> json) =>
      _$SurveyStateFromJson(json);

  factory SurveyState.initial() => SurveyState(
        surveys: <Survey>[],
        surveyRespondentsState: SurveyRespondentsState.initial(),
        surveyResponses: <SurveyResponse>[],
        errorFetchingSurveys: false,
      );
}
