// Package imports:
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';

/// [BatchUpdateMiscStateAction] is the ONLY action that should be called to update [miscState]
/// with the exception of [IncrementUserVisitCountAction]
/// This action should be called in the following scenarios;
/// - creating an account
/// - logging in a user
/// - resetting PIN
class BatchUpdateMiscStateAction extends ReduxAction<AppState> {
  final String? initialRoute;
  final String? error;
  final List<Member>? communityMembers;
  final String? inactiveTime;
  final bool? resumeWithPin;
  final Facility? selectedFacility;
  final Organisation? selectedOrganisation;
  final bool? updateFacility;
  final bool? userExists;

  BatchUpdateMiscStateAction({
    this.initialRoute,
    this.error,
    this.communityMembers,
    this.inactiveTime,
    this.resumeWithPin,
    this.selectedFacility,
    this.selectedOrganisation,
    this.updateFacility,
    this.userExists,
  });

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      miscState: state.miscState!.copyWith(
        error: error ?? state.miscState?.error,
        initialRoute: initialRoute ?? state.miscState?.initialRoute,
        inactiveTime: inactiveTime ?? state.miscState?.inactiveTime,
        resumeWithPin: resumeWithPin ?? state.miscState?.resumeWithPin,
        selectedFacility: selectedFacility ?? state.miscState?.selectedFacility,
        updateFacility: updateFacility ?? state.miscState?.updateFacility,
        selectedOrganisation:
            selectedOrganisation ?? state.miscState?.selectedOrganisation,
        userExists: userExists ?? state.miscState?.userExists,
      ),
    );

    return newState;
  }
}
