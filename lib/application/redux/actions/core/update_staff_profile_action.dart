// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/health_diary/health_diary_entry.dart';

class UpdateStaffProfileAction extends ReduxAction<AppState> {
  UpdateStaffProfileAction({
    this.id,
    this.userId,
    this.active,
    this.staffNumber,
    this.defaultFacility,
    this.facilities,
    this.linkedFacilities,
    this.healthDiaryEntries,
    this.defaultFacilityName,
    this.notifications,
    this.managedClients,
    this.currentFacility,
    this.clientCaregivers,
  });

  final bool? active;
  final String? defaultFacility;
  final String? defaultFacilityName;
  final List<Facility>? facilities;
  final List<Facility>? linkedFacilities;
  final List<ManagedClient>? managedClients;
  final List<HealthDiaryEntry?>? healthDiaryEntries;
  final String? id;
  final List<NotificationDetails?>? notifications;
  final List<Caregiver?>? clientCaregivers;
  final String? staffNumber;
  final String? userId;
  final Facility? currentFacility;

  @override
  AppState reduce() {
    final AppState newState = state.copyWith(
      userProfileState: state.userProfileState?.copyWith.call(
        id: id ?? state.userProfileState?.id,
        userId: userId ?? state.userProfileState?.userId,
        active: active ?? state.userProfileState?.active,
        staffNumber: staffNumber ?? state.userProfileState?.staffNumber,
        defaultFacility:
            defaultFacility ?? state.userProfileState?.defaultFacility,
        facilities: facilities ?? state.userProfileState?.facilities,
        linkedFacilities:
            linkedFacilities ?? state.userProfileState?.linkedFacilities,
        clientSharedDiaryEntries: healthDiaryEntries ??
            state.userProfileState?.clientSharedDiaryEntries,
        notifications: notifications ?? state.userProfileState?.notifications,
        defaultFacilityName:
            defaultFacilityName ?? state.userProfileState?.defaultFacilityName,
        managedClients:
            managedClients ?? state.userProfileState?.managedClients,
        currentFacility:
            currentFacility ?? state.userProfileState?.currentFacility,
        clientCaregivers:
            clientCaregivers ?? state.userProfileState?.clientCaregivers,
      ),
    );

    return newState;
  }
}
