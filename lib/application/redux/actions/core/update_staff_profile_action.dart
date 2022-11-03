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
        id: this.id ?? state.staffState?.id,
        userId: this.userId ?? state.staffState?.userId,
        active: this.active ?? state.staffState?.active,
        staffNumber: this.staffNumber ?? state.staffState?.staffNumber,
        defaultFacility:
            this.defaultFacility ?? state.staffState?.defaultFacility,
        facilities: this.facilities ?? state.staffState?.facilities,
        linkedFacilities:
            this.linkedFacilities ?? state.staffState?.linkedFacilities,
        clientSharedDiaryEntries: this.healthDiaryEntries ??
            state.staffState?.clientSharedDiaryEntries,
        notifications: this.notifications ?? state.staffState?.notifications,
        defaultFacilityName:
            this.defaultFacilityName ?? state.staffState?.defaultFacilityName,
        managedClients: this.managedClients ?? state.staffState?.managedClients,
        currentFacility:
            this.currentFacility ?? state.staffState?.currentFacility,
        clientCaregivers:
            this.clientCaregivers ?? state.staffState?.clientCaregivers,
            
      ),
    );

    return newState;
  }
}
