import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';

part 'survey_response.freezed.dart';
part 'survey_response.g.dart';

@freezed
class SurveyResponse with _$SurveyResponse {
  factory SurveyResponse({
    @JsonKey(name: 'question') String? question,
    @JsonKey(name: 'answers') List<String>? answers,
    @JsonKey(name: 'questionType') QuestionType? questionType,
  }) = _SurveyResponse;

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);

  factory SurveyResponse.initial() => SurveyResponse(
        question: UNKNOWN,
        answers: <String>[],
        questionType: QuestionType.UNKNOWN,
      );
}
