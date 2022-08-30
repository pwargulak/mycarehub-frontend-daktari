import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';

part 'survey_service_request_respondents_state.freezed.dart';
part 'survey_service_request_respondents_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SurveyServiceRequestRespondentsState with _$SurveyServiceRequestRespondentsState {
  factory SurveyServiceRequestRespondentsState({
    @JsonKey(name: 'users') List<SurveyRespondent?>? surveyRespondents,
    bool? errorFetchingSurveys,
  }) = _SurveyServiceRequestRespondentsState;

  factory SurveyServiceRequestRespondentsState.fromJson(Map<String, dynamic> json) =>
      _$SurveyServiceRequestRespondentsStateFromJson(json);

  factory SurveyServiceRequestRespondentsState.initial() => SurveyServiceRequestRespondentsState(
        surveyRespondents: <SurveyRespondent>[],
      );
}
