import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_respondent.freezed.dart';
part 'survey_respondent.g.dart';

@freezed
class SurveyRespondent with _$SurveyRespondent {
  factory SurveyRespondent({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'projectID') int? projectID,
    @JsonKey(name: 'submitterID') int? submitterID,
    @JsonKey(name: 'formID') String? formID,
  }) = _SurveyRespondent;

  factory SurveyRespondent.fromJson(Map<String, dynamic> json) =>
      _$SurveyRespondentFromJson(json);

  factory SurveyRespondent.initial() => SurveyRespondent(
        name: UNKNOWN,
        formID: UNKNOWN,
        id: UNKNOWN,
        projectID: 0,
        submitterID: 0,
      );
}
