// Package imports:
import 'package:afya_moja_core/afya_moja_core.dart';
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
      staffState: state.staffState?.copyWith.call(
        id: id ?? state.staffState?.id,
        userId: userId ?? state.staffState?.userId,
        active: active ?? state.staffState?.active,
        staffNumber: staffNumber ?? state.staffState?.staffNumber,
        defaultFacility: defaultFacility ?? state.staffState?.defaultFacility,
        facilities: facilities ?? state.staffState?.facilities,
        linkedFacilities:
            linkedFacilities ?? state.staffState?.linkedFacilities,
        clientSharedDiaryEntries:
            healthDiaryEntries ?? state.staffState?.clientSharedDiaryEntries,
        notifications: notifications ?? state.staffState?.notifications,
        defaultFacilityName:
            defaultFacilityName ?? state.staffState?.defaultFacilityName,
        managedClients: managedClients ?? state.staffState?.managedClients,
        currentFacility: currentFacility ?? state.staffState?.currentFacility,
        clientCaregivers:
            clientCaregivers ?? state.staffState?.clientCaregivers,
      ),
    );

    return newState;
  }
}
