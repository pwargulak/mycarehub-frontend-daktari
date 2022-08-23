import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_respondent.freezed.dart';
part 'survey_respondent.g.dart';

@freezed
class SurveyRespondent with _$SurveyRespondent {
  factory SurveyRespondent({
    // name of the respondent
    @JsonKey(name: 'name') String? name,
  }) = _SurveyRespondent;

  factory SurveyRespondent.fromJson(Map<String, dynamic> json) =>
      _$SurveyRespondentFromJson(json);

  factory SurveyRespondent.initial() => SurveyRespondent(
        name: UNKNOWN,
      );
}
