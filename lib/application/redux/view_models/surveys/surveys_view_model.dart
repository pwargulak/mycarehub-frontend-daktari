import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_response.dart';

class SurveysViewModel extends Vm {
  SurveysViewModel({
    required this.wait,
    required this.surveys,
    required this.errorFetchingSurveys,
    this.surveyResponses,
  }) : super(
          equals: <Object?>[
            surveys,
            wait,
            errorFetchingSurveys,
            surveyResponses,
          ],
        );

  final bool? errorFetchingSurveys;
  final List<SurveyResponse?>? surveyResponses;
  final List<Survey?>? surveys;
  final Wait? wait;

  static SurveysViewModel fromStore(Store<AppState> store) {
    return SurveysViewModel(
      wait: store.state.wait,
      surveys: store.state.surveyState?.surveys,
      errorFetchingSurveys: store.state.surveyState?.errorFetchingSurveys,
      surveyResponses:
          store.state.surveyState?.surveyResponseState?.surveyResponses,
    );
  }
}
