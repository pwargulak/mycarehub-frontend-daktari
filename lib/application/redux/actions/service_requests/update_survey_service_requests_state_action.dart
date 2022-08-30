import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_item.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_respondents_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';

class UpdateSurveyServiceRequestsStateAction extends ReduxAction<AppState> {
  UpdateSurveyServiceRequestsStateAction({
    this.surveys,
    this.errorFetchingSurveys,
    this.surveyResponses,
    this.surveyServiceRequestRespondentsState,
  });

  List<SurveyServiceRequestItem?>? surveys;

  List<SurveyResponse>? surveyResponses;
  SurveyServiceRequestRespondentsState? surveyServiceRequestRespondentsState;
  bool? errorFetchingSurveys;

  @override
  AppState reduce() {
    final SurveyServiceRequestState? surveyServiceRequestsState =
        state.serviceRequestState?.surveyServiceRequestState?.copyWith(
      surveys: surveys ??
          state.serviceRequestState?.surveyServiceRequestState?.surveys,
      errorFetchingSurveys: errorFetchingSurveys ??
          state.serviceRequestState?.surveyServiceRequestState
              ?.errorFetchingSurveys,
      surveyServiceRequestRespondentsState:
          surveyServiceRequestRespondentsState ??
              state.serviceRequestState?.surveyServiceRequestState
                  ?.surveyServiceRequestRespondentsState,
      surveyResponses: surveyResponses ??
          state.serviceRequestState?.surveyServiceRequestState?.surveyResponses,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: state.serviceRequestState?.copyWith(
        surveyServiceRequestState: surveyServiceRequestsState,
      ),
    );

    return newState;
  }
}
