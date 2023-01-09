// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_user_programs_response.freezed.dart';
part 'list_user_programs_response.g.dart';

@freezed
class ListUserProgramsResponse with _$ListUserProgramsResponse {
  factory ListUserProgramsResponse({
    @JsonKey(name: 'count') int? count,
    @JsonKey(name: 'programs') List<Program>? programs,
  }) = _ListUserProgramsResponse;

  factory ListUserProgramsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserProgramsResponseFromJson(json);
}
