// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/entities/health_diary/health_diary_entry.dart';

class UpdateUserProfileAction extends ReduxAction<AppState> {
  UpdateUserProfileAction({
    this.id,
    this.userId,
    this.active,
    this.staffNumber,
    this.defaultFacility,
    this.facilities,
    this.linkedFacilities,
    this.healthDiaryEntries,
    this.notifications,
    this.managedClients,
    this.currentFacility,
    this.clientCaregivers,
  });

  final bool? active;
  final Facility? defaultFacility;
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
        userProfile: state.userProfileState?.userProfile?.copyWith.call(
          id: id ?? state.userProfileState?.userProfile?.id,
          userId: userId ?? state.userProfileState?.userProfile?.userId,
          active: active ?? state.userProfileState?.userProfile?.active,
          staffNumber:
              staffNumber ?? state.userProfileState?.userProfile?.staffNumber,
          defaultFacility: defaultFacility ??
              state.userProfileState?.userProfile?.defaultFacility,
          facilities:
              facilities ?? state.userProfileState?.userProfile?.facilities,
          linkedFacilities: linkedFacilities ??
              state.userProfileState?.userProfile?.linkedFacilities,
          clientSharedDiaryEntries: healthDiaryEntries ??
              state.userProfileState?.userProfile?.clientSharedDiaryEntries,
          notifications: notifications ??
              state.userProfileState?.userProfile?.notifications,
          managedClients: managedClients ??
              state.userProfileState?.userProfile?.managedClients,
          currentFacility: currentFacility ??
              state.userProfileState?.userProfile?.currentFacility,
          clientCaregivers: clientCaregivers ??
              state.userProfileState?.userProfile?.clientCaregivers,
        ),
      ),
    );

    return newState;
  }
}
