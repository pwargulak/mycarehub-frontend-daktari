// Package imports:

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/roles_list.dart';

part 'search_user_response.freezed.dart';
part 'search_user_response.g.dart';

@freezed
class SearchUserResponse with _$SearchUserResponse {
  factory SearchUserResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'cccNumber')
        String?
            clientCCCNumber, // This is the CCCNumber if the person being searched is a client
    @JsonKey(name: 'active')
        bool?
            isActive, // This is a boolean for checking if the user was deactivated from the platform
    @JsonKey(name: 'staffNumber')
        String?
            staffNumber, // this is the staff number if the person being searched is a staff member
    @JsonKey(name: 'user') UserData? user,
    @JsonKey(name: 'defaultFacility') Facility? defaultFacility,
    @JsonKey(name: 'rolesList')
        RolesList?
            rolesList, // this is the list the user has if they are a staff member //
  }) = _SearchUserResponse;

  factory SearchUserResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUserResponseFromJson(json);

  factory SearchUserResponse.initial() => SearchUserResponse(
        id: UNKNOWN,
        clientCCCNumber: UNKNOWN,
        isActive: true,
        staffNumber: UNKNOWN,
        defaultFacility: Facility.initial(),
        user: UserData.initial(),
        rolesList: RolesList.initial(),
      );
}
