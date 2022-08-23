import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_response_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';

class UpdateSurveyResponseStateAction extends ReduxAction<AppState> {
  final List<SurveyResponse?>? surveyResponses;
  final bool? errorOccurred;
  final bool? timeOutOccurred;

  UpdateSurveyResponseStateAction({
    this.surveyResponses,
    this.errorOccurred,
    this.timeOutOccurred,
  });

  @override
  Future<AppState> reduce() async {
    final SurveyResponseState? newSurveyResponseState =
        state.surveyState?.surveyResponseState?.copyWith(
      surveyResponses: surveyResponses ??
          state.surveyState?.surveyResponseState?.surveyResponses,
      errorOccurred: errorOccurred ??
          state.surveyState?.surveyResponseState?.errorOccurred,
      timeOutOccurred: timeOutOccurred ??
          state.surveyState?.surveyResponseState?.timeOutOccurred,
    );

    final SurveyState? surveyState = state.surveyState?.copyWith(
      surveyResponseState: newSurveyResponseState,
    );

    final AppState newState = state.copyWith(
      surveyState: surveyState,
    );

    return newState;
  }
}
