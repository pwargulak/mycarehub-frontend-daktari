import 'dart:async';

import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/queries.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/notifications/read_notifications_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/notification/notifications_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class FetchNotificationsAction extends ReduxAction<AppState> {
  FetchNotificationsAction({
    required this.client,
    this.filters,
    this.isRead = true,
  });

  final IGraphQlClient client;
  // any filters that may be needed to be applied
  final String? filters;

  // if to only fetch Read notifications and defaults to false
  final bool? isRead;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(fetchNotificationsFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(UpdateUserProfileAction(notifications: <NotificationDetails>[]));
    dispatch(WaitAction<AppState>.add(fetchNotificationsFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String userID =
        state.userProfileState?.userProfile?.user?.userId ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'userID': userID,
      'flavour': Flavour.pro.name,
      'paginationInput': <String, dynamic>{'limit': 10, 'currentPage': 1},
      'filters': <String, dynamic>{
        'notificationTypes': filters,
        'isRead': isRead,
      }
    };

    final Response response =
        await client.query(listNotificationsQuery, variables);

    final ProcessedResponse processedResponse = processHttpResponse(response);

    if (processedResponse.ok) {
      final Map<String, dynamic> body = client.toMap(response);

      final String? errors = client.parseError(body);

      if (errors != null) {
        reportErrorToSentry(
          hint: fetchNotificationsErrorString,
          query: listNotificationsQuery,
          response: response,
          state: state,
          variables: variables,
        );
        throw UserException(getErrorMessage('fetching notifications'));
      }

      final NotificationsResponse notificationsResponse =
          NotificationsResponse.fromJson(
        body['data'] as Map<String, dynamic>,
      );

      final List<NotificationDetails> notifications =
          notificationsResponse.data.notifications;

      if (notifications.isNotEmpty) {
        dispatch(
          UpdateUserProfileAction(
            notifications: notifications,
          ),
        );
        final List<String?> ids = <String?>[];

        for (int i = 0; i < notifications.length; i++) {
          final bool isRead = notifications[i].isRead ?? false;
          if (!isRead) {
            ids.add(notifications[i].id);
          }
        }

        if (ids.isNotEmpty) {
          dispatch(
            ReadNotificationsAction(
              client: client,
              ids: ids,
            ),
          );
        }
        return state;
      }
    } else {
      throw UserException(processedResponse.message);
    }

    return null;
  }
}
