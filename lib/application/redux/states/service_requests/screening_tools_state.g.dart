// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'screening_tools_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScreeningToolsState _$$_ScreeningToolsStateFromJson(
        Map<String, dynamic> json) =>
    _$_ScreeningToolsState(
      availableTools: (json['availableTools'] as List<dynamic>?)
          ?.map((e) => ScreeningTool.fromJson(e as Map<String, dynamic>))
          .toList(),
      screeningToolRespondents:
          (json['screeningToolRespondents'] as List<dynamic>?)
              ?.map((e) =>
                  ScreeningToolRespondent.fromJson(e as Map<String, dynamic>))
              .toList(),
      selectedRespondent: json['selectedRespondent'] == null
          ? null
          : ScreeningToolRespondent.fromJson(
              json['selectedRespondent'] as Map<String, dynamic>),
      screeningToolQuestionResponses: json['screeningToolQuestionResponses'] ==
              null
          ? null
          : ScreeningToolQuestionResponses.fromJson(
              json['screeningToolQuestionResponses'] as Map<String, dynamic>),
      errorFetchingScreeningTools: json['errorFetchingScreeningTools'] as bool?,
    );

Map<String, dynamic> _$$_ScreeningToolsStateToJson(
        _$_ScreeningToolsState instance) =>
    <String, dynamic>{
      'availableTools': instance.availableTools,
      'screeningToolRespondents': instance.screeningToolRespondents,
      'selectedRespondent': instance.selectedRespondent,
      'screeningToolQuestionResponses': instance.screeningToolQuestionResponses,
      'errorFetchingScreeningTools': instance.errorFetchingScreeningTools,
    };
