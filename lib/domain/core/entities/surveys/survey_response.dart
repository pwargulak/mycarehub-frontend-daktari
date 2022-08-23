import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_response.freezed.dart';
part 'survey_response.g.dart';

@freezed
class SurveyResponse with _$SurveyResponse {
  factory SurveyResponse({
    // name of the respondent
    @JsonKey(name: 'name') String? name,
  }) = _SurveyResponse;

  factory SurveyResponse.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseFromJson(json);

  factory SurveyResponse.initial() => SurveyResponse(
        name: UNKNOWN,
      );
}
