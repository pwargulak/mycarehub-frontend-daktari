import 'package:flutter/material.dart';
import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/notifications/fetch_notifications_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/notifications/fetch_notifications_filters_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/notifications/notifications_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:prohealth360_daktari/presentation/notifications/notification_list_item.dart'
    as pro;
import 'package:prohealth360_daktari/presentation/notifications/widgets/notifications_filter_widget.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const CustomAppBar(title: notificationsText, showBackButton: false),
      backgroundColor: AppColors.whiteColor,
      body: StoreConnector<AppState, NotificationsViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            FetchNotificationFiltersAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
          store.dispatch(
            FetchNotificationsAction(
              client: AppWrapperBase.of(context)!.graphQLClient,
            ),
          );
        },
        converter: (Store<AppState> store) =>
            NotificationsViewModel.fromStore(store),
        builder: (BuildContext context, NotificationsViewModel vm) {
          final List<NotificationDetails?> notifications = vm.notifications;
          final List<Widget> notificationsWidgetList = <Widget>[];
          if (notifications.isNotEmpty) {
            notifications
                .map(
                  (NotificationDetails? notification) =>
                      notificationsWidgetList.add(
                    pro.NotificationListItem(
                      notificationDetails: notification,
                    ),
                  ),
                )
                .toList();
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                NotificationsFilterWidget(vm: vm),
                Flexible(
                  child: RefreshIndicator(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      key: notificationsListViewKey,
                      child: Column(
                        children: <Widget>[
                          if (vm.wait.isWaitingFor(fetchNotificationsFlag))
                            Container(
                              height: 300,
                              padding: const EdgeInsets.all(20),
                              child: const PlatformLoader(),
                            )
                          else if (notifications.isEmpty)
                            GenericErrorWidget(
                              actionKey: helpNoDataWidgetKey,
                              recoverCallback: () async {
                                // check the active filter first and apply it as a param to
                                // the fetch action
                                final NotificationFilter? selectedFilter =
                                    vm.notificationFilterState?.selectedFilter;
                                bool isRead = false;
                                if ((vm.notificationFilterState?.selectedFilter
                                                ?.type?.name ??
                                            '')
                                        .compareTo(unread) !=
                                    0) {
                                  isRead = true;
                                }
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  FetchNotificationsAction(
                                    filters: selectedFilter?.type?.name,
                                    isRead: isRead,
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                  ),
                                );
                              },
                              headerIconSvgUrl: noNotificationsImageSvgPath,
                              messageTitle: noNotificationsTitle,
                              messageBody: <TextSpan>[
                                TextSpan(
                                  text: noNotificationsDescription,
                                  style: normalSize16Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ],
                            )
                          else
                            ...notificationsWidgetList
                        ],
                      ),
                    ),
                    onRefresh: () async {
                      final NotificationFilter? selectedFilter =
                          vm.notificationFilterState?.selectedFilter;
                      bool isRead = false;
                      if ((vm.notificationFilterState?.selectedFilter?.type
                                      ?.name ??
                                  '')
                              .compareTo(unread) !=
                          0) {
                        isRead = true;
                      }
                      StoreProvider.dispatch<AppState>(
                        context,
                        FetchNotificationsAction(
                          filters: selectedFilter?.type?.name,
                          isRead: isRead,
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: BottomNavIndex.notifications.index,
      ),
    );
  }
}
