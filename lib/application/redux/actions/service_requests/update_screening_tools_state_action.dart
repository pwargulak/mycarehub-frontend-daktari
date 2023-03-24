import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_question_response.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_respondent.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/screening_tool.dart';

class UpdateScreeningToolsStateAction extends ReduxAction<AppState> {
  UpdateScreeningToolsStateAction({
    this.availableTools,
    this.screeningToolRespondents,
    this.screeningToolQuestionResponses,
    this.selectedRespondent,
    this.errorFetchingScreeningTools,
  });

  List<ScreeningTool>? availableTools;
  List<ScreeningToolRespondent>? screeningToolRespondents;
  ScreeningToolRespondent? selectedRespondent;
  ScreeningToolQuestionResponses? screeningToolQuestionResponses;
  bool? errorFetchingScreeningTools;

  @override
  AppState reduce() {
    final ScreeningToolsState? screeningToolsState =
        state.serviceRequestState?.screeningToolsState?.copyWith(
      screeningToolRespondents: screeningToolRespondents ??
          state.serviceRequestState?.screeningToolsState
              ?.screeningToolRespondents,
      availableTools: availableTools ??
          state.serviceRequestState?.screeningToolsState?.availableTools,
      screeningToolQuestionResponses: screeningToolQuestionResponses ??
          state.serviceRequestState?.screeningToolsState
              ?.screeningToolQuestionResponses,
      errorFetchingScreeningTools: state.serviceRequestState
          ?.screeningToolsState?.errorFetchingScreeningTools,
      selectedRespondent: selectedRespondent ??
          state.serviceRequestState?.screeningToolsState?.selectedRespondent,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: state.serviceRequestState
          ?.copyWith(screeningToolsState: screeningToolsState),
    );

    return newState;
  }
}
