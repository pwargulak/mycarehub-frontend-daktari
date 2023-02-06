// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program.freezed.dart';
part 'program.g.dart';

@freezed
class Program with _$Program {
  factory Program({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'active', defaultValue: false) bool? active,
    @JsonKey(name: 'organisation') Organisation? organisation,
    @JsonKey(name: 'facility') List<Facility?>? facilities,
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);

  factory Program.initial() => Program(
        id: UNKNOWN,
        name: UNKNOWN,
        description: UNKNOWN,
        active: false,
        organisation: Organisation.initial(),
        facilities: <Facility>[],
      );
}
