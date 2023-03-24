import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_question_response.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_respondent.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/screening_tool.dart';

class ScreeningToolsViewModel extends Vm {
  ScreeningToolsViewModel({
    required this.wait,
    this.screeningToolRespondents,
    this.errorFetchingScreeningTools,
    this.screeningToolQuestionResponses,
    this.availableTools,
    this.selectedRespondent,
  }) : super(
          equals: <Object?>[
            wait,
            screeningToolRespondents,
            errorFetchingScreeningTools,
            screeningToolQuestionResponses,
            selectedRespondent,
          ],
        );

  factory ScreeningToolsViewModel.fromStore(Store<AppState> store) {
    return ScreeningToolsViewModel(
      wait: store.state.wait!,
      screeningToolRespondents: store.state.serviceRequestState
          ?.screeningToolsState?.screeningToolRespondents,
      errorFetchingScreeningTools: store.state.serviceRequestState
          ?.screeningToolsState?.errorFetchingScreeningTools,
      availableTools:
          store.state.serviceRequestState?.screeningToolsState?.availableTools,
      screeningToolQuestionResponses: store.state.serviceRequestState
          ?.screeningToolsState?.screeningToolQuestionResponses,
    );
  }

  final bool? errorFetchingScreeningTools;
  final Wait wait;
  final List<ScreeningTool>? availableTools;
  final List<ScreeningToolRespondent>? screeningToolRespondents;
  final ScreeningToolRespondent? selectedRespondent;
  final ScreeningToolQuestionResponses? screeningToolQuestionResponses;
}
