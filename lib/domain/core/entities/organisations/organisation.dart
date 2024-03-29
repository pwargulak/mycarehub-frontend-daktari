import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'organisation.freezed.dart';
part 'organisation.g.dart';

@freezed
class Organisation with _$Organisation {
  factory Organisation({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'programs') List<Program?>? programs,
  }) = _Organization;

  factory Organisation.fromJson(Map<String, dynamic> json) =>
      _$OrganisationFromJson(json);

  factory Organisation.initial() => Organisation(
        id: UNKNOWN,
        name: UNKNOWN,
        description: UNKNOWN,
        programs: <Program>[],
      );
}
