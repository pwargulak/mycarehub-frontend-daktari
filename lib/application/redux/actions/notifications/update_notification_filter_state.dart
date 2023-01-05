import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/notification_filter_state.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class UpdateNotificationFilterStateAction extends ReduxAction<AppState> {
  UpdateNotificationFilterStateAction({
    this.selectedFilter,
    this.notificationFilters,
  });

  final NotificationFilter? selectedFilter;
  final List<NotificationFilter>? notificationFilters;

  @override
  AppState reduce() {
    final NotificationFilterState notificationFilterState =
        NotificationFilterState(
      selectedFilter: selectedFilter ??
          state.userProfileState?.notificationFilterState?.selectedFilter,
      notificationFilters: notificationFilters ??
          state.userProfileState?.notificationFilterState?.notificationFilters,
    );

    final AppState newState = state.copyWith.call(
      userProfileState: state.userProfileState?.copyWith
          .call(notificationFilterState: notificationFilterState),
    );

    return newState;
  }
}
