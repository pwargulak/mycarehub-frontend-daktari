import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_question_response.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tool_respondent.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/screening_tool.dart';

part 'screening_tools_state.g.dart';
part 'screening_tools_state.freezed.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ScreeningToolsState with _$ScreeningToolsState {
  factory ScreeningToolsState({
    List<ScreeningTool>? availableTools,
    List<ScreeningToolRespondent>? screeningToolRespondents,
    ScreeningToolRespondent? selectedRespondent,
    ScreeningToolQuestionResponses? screeningToolQuestionResponses,
    bool? errorFetchingScreeningTools,
  }) = _ScreeningToolsState;

  factory ScreeningToolsState.fromJson(Map<String, dynamic> json) =>
      _$ScreeningToolsStateFromJson(json);

  factory ScreeningToolsState.initial() => ScreeningToolsState(
        screeningToolRespondents: <ScreeningToolRespondent>[],
        availableTools: <ScreeningTool>[],
        screeningToolQuestionResponses:
            ScreeningToolQuestionResponses.initial(),
        errorFetchingScreeningTools: false,
      );
}
