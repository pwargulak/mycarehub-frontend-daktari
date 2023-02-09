import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_program_payload.freezed.dart';
part 'create_program_payload.g.dart';

@freezed
class CreateProgramPayload with _$CreateProgramPayload {
  @JsonSerializable(explicitToJson: true)
  factory CreateProgramPayload({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'organisationID') String? organisationID,
  }) = _CreateProgramPayload;

  factory CreateProgramPayload.fromJson(Map<String, dynamic> json) =>
      _$CreateProgramPayloadFromJson(json);
}
