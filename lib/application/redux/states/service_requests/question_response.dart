import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:sghi_core/communities/models/strings.dart';

part 'question_response.freezed.dart';
part 'question_response.g.dart';

@freezed
class QuestionResponse with _$QuestionResponse {
  factory QuestionResponse({
    @JsonKey(name: 'questionType') QuestionType? questionType,
    @JsonKey(name: 'selectMultiple') bool? selectMultiple,
    @JsonKey(name: 'responseValueType') String? responseValueType,
    @JsonKey(name: 'sequence') int? sequence,
    @JsonKey(name: 'questionText') String? questionText,
    @JsonKey(name: 'normalizedResponse')
        Map<String, dynamic>? normalizedResponse,
  }) = _QuestionResponse;

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  factory QuestionResponse.initial() => QuestionResponse(
        selectMultiple: false,
        questionText: UNKNOWN,
        responseValueType: UNKNOWN,
        sequence: 0,
        normalizedResponse: <String, dynamic>{},
      );
}
