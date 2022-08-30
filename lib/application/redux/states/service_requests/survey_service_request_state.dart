import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_item.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_respondents_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';

part 'survey_service_request_state.freezed.dart';
part 'survey_service_request_state.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class SurveyServiceRequestState with _$SurveyServiceRequestState {
  factory SurveyServiceRequestState({
    @JsonKey(name: 'getSurveyWithServiceRequest')
        List<SurveyServiceRequestItem?>? surveys,
    @JsonKey(name: 'getSurveyServiceRequestUser')
        SurveyServiceRequestRespondentsState?
            surveyServiceRequestRespondentsState,
    @JsonKey(name: 'getSurveyResponse') List<SurveyResponse>? surveyResponses,
    bool? errorFetchingSurveys,
  }) = _SurveyServiceRequestState;

  factory SurveyServiceRequestState.fromJson(Map<String, dynamic> json) =>
      _$SurveyServiceRequestStateFromJson(json);

  factory SurveyServiceRequestState.initial() => SurveyServiceRequestState(
        surveys: <SurveyServiceRequestItem>[],
        surveyServiceRequestRespondentsState:
            SurveyServiceRequestRespondentsState.initial(),
        surveyResponses: <SurveyResponse>[],
        errorFetchingSurveys: false,
      );
}
