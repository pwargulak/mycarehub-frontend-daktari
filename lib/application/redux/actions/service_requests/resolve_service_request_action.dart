import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class ResolveServiceRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String serviceRequestId;
  final String? comments;
  final List<String> actionsTaken;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  ResolveServiceRequestAction({
    required this.serviceRequestId,
    required this.client,
    required this.actionsTaken,
    this.comments,
    this.onSuccess,
    this.onFailure,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add(
        resolveServiceRequestFlag,
      ),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        resolveServiceRequestFlag,
      ),
    );
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final String staffId = state.userProfileState?.id ?? '';

    final Map<String, dynamic> variables = <String, dynamic>{
      'staffID': staffId,
      'requestID': serviceRequestId,
      'comment': comments ?? '',
      'action': actionsTaken,
    };

    final Response result = await client.query(
      resolveServiceRequestMutation,
      variables,
    );

    client.close();

    final Map<String, dynamic> payLoad = client.toMap(result);
    final String? error = parseError(payLoad);

    if (error != null) {
      onFailure?.call();

      reportErrorToSentry(
        hint: serviceRequestResolvingErrorString,
        query: resolveServiceRequestMutation,
        response: result,
        state: state,
        variables: variables,
      );

      return null;
    }

    final Map<String, dynamic>? data = payLoad['data'] as Map<String, dynamic>?;

    final bool? isResolved = data?['resolveServiceRequest'] as bool?;

    if (isResolved ?? false) {
      ///A list of the [clientServiceRequests] excluding the one resolved
      final List<ServiceRequest>? clientServiceRequests = state
          .serviceRequestState?.clientServiceRequests
          ?.where((ServiceRequest element) => element.id != serviceRequestId)
          .toList();

      dispatch(
        UpdateServiceRequestsStateAction(
          clientServiceRequests: clientServiceRequests,
        ),
      );

      dispatch(FetchServiceRequestsCountAction(client: client));

      onSuccess?.call();
      await AnalyticsService().logEvent(
        name: resolveServiceRequest,
        eventType: AnalyticsEventType.INTERACTION,
        parameters: <String, dynamic>{
          'staffID': staffId,
          'requestID': serviceRequestId,
        },
      );
      return state;
    }

    onFailure?.call();
    return null;
  }
}
