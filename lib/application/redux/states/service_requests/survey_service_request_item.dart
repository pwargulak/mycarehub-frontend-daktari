import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_service_request_item.freezed.dart';
part 'survey_service_request_item.g.dart';

@freezed
class SurveyServiceRequestItem with _$SurveyServiceRequestItem {
  factory SurveyServiceRequestItem({
    @JsonKey(name: 'projectID') int? projectId,
    @JsonKey(name: 'formID') String? xmlFormId,
    @JsonKey(name: 'title') String? name,
  }) = _SurveyServiceRequestItem;

  factory SurveyServiceRequestItem.fromJson(Map<String, dynamic> json) => _$SurveyServiceRequestItemFromJson(json);

  factory SurveyServiceRequestItem.initial() => SurveyServiceRequestItem(
        projectId: 0,
        name: UNKNOWN,
        xmlFormId: UNKNOWN,
      );
}
