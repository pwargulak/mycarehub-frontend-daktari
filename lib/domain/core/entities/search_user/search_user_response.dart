import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:sghi_core/afya_moja_core/src/domain/core/entities/identifier.dart';

part 'search_user_response.freezed.dart';
part 'search_user_response.g.dart';

@freezed
class SearchUserResponse with _$SearchUserResponse {
  factory SearchUserResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'identifiers')
        List<Identifier>?
            identifiers, // This is the CCCNumber if the person being searched is a client
    @JsonKey(name: 'active')
        bool?
            isActive, // This is a boolean for checking if the user was deactivated from the platform
    @JsonKey(name: 'staffNumber')
        String?
            staffNumber, // this is the staff number if the person being searched is a staff member
    @JsonKey(name: 'user') UserData? user,
    @JsonKey(name: 'defaultFacility') Facility? defaultFacility,// this is the list the user has if they are a staff member //
  }) = _SearchUserResponse;

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseFromJson(json);

  factory SearchUserResponse.initial() => SearchUserResponse(
        id: UNKNOWN,
        identifiers: <Identifier>[],
        isActive: true,
        staffNumber: UNKNOWN,
        defaultFacility: Facility.initial(),
        user: UserData.initial(),
      );
}
