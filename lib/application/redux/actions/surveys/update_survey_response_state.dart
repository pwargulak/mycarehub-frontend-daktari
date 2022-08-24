import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_respondents_state.dart';
import 'package:prohealth360_daktari/application/redux/states/survey_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';

class UpdateSurveyRespondentsStateAction extends ReduxAction<AppState> {
  final List<SurveyRespondent?>? surveyRespondents;
  final bool? errorOccurred;

  UpdateSurveyRespondentsStateAction({
    this.surveyRespondents,
    this.errorOccurred,
  });

  @override
  Future<AppState> reduce() async {
    final SurveyRespondentsState? newSurveyRespondentsState =
        state.surveyState?.surveyRespondentsState?.copyWith(
      surveyRespondents: surveyRespondents ??
          state.surveyState?.surveyRespondentsState?.surveyRespondents,
      errorOccurred: errorOccurred ??
          state.surveyState?.surveyRespondentsState?.errorOccurred,
    );

    final SurveyState? surveyState = state.surveyState?.copyWith(
      surveyRespondentsState: newSurveyRespondentsState,
    );

    final AppState newState = state.copyWith(
      surveyState: surveyState,
    );

    return newState;
  }
}
