import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prohealth360_daktari/application/redux/states/search_user_response_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/search_caregiver_response_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

part 'misc_state.freezed.dart';
part 'misc_state.g.dart';

@freezed
class MiscState with _$MiscState {
  factory MiscState({
    String? initialRoute,
    String? error,
    FAQsContentState? profileFAQsContentState,
    Facility? selectedFacility,
    Organisation? selectedOrganisation,
    SearchUserResponseState? searchUserResponseState,
    String? inactiveTime,
    bool? resumeWithPin,
    bool? updateFacility,
    bool? cccNumberExists,
    SearchCaregiverResponseState? searchCaregiverResponseState,
  }) = _MiscState;

  factory MiscState.fromJson(Map<String, dynamic> json) =>
      _$MiscStateFromJson(json);

  factory MiscState.initial() => MiscState(
        initialRoute: AppRoutes.loginPage,
        profileFAQsContentState: FAQsContentState.initial(),
        selectedFacility: Facility.initial(),
        selectedOrganisation: Organisation.initial(),
        searchUserResponseState: SearchUserResponseState.initial(),
        inactiveTime: UNKNOWN,
        resumeWithPin: false,
        updateFacility: false,
        cccNumberExists: false,
        searchCaregiverResponseState: SearchCaregiverResponseState.initial(),
      );
}
