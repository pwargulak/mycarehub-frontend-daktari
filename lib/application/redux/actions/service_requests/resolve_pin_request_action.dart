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
import 'package:sentry_flutter/sentry_flutter.dart';

class ResolvePinRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient httpClient;
  final String serviceRequestId;
  final bool physicalIdentityVerified;
  final PinResetState pinResetState;
  final VoidCallback? onPinVerified;
  final VoidCallback? onDone;

  ResolvePinRequestAction({
    required this.serviceRequestId,
    required this.physicalIdentityVerified,
    required this.httpClient,
    required this.pinResetState,
    this.onPinVerified,
    this.onDone,
  });

  @override
  void before() {
    super.before();
    dispatch(
      WaitAction<AppState>.add(
        '${pinResetRequestFlag}_${serviceRequestId}_$pinResetState',
      ),
    );
  }

  @override
  void after() {
    dispatch(
      WaitAction<AppState>.remove(
        '${pinResetRequestFlag}_${serviceRequestId}_$pinResetState',
      ),
    );
    onDone?.call();
    super.after();
  }

  @override
  Future<AppState?> reduce() async {
    final Map<String, dynamic> variables = <String, dynamic>{
      'serviceRequestID': serviceRequestId,
      'physicalIdentityVerified': physicalIdentityVerified,
      'status': pinResetState.name,
    };

    final Response result = await httpClient.query(
      verifyClientPinResetServiceRequestMutation,
      variables,
    );

    final ProcessedResponse processedResponse = processHttpResponse(result);
    httpClient.close();

    final String acceptOrRejectText =
        pinResetState == PinResetState.APPROVED ? 'accepting' : 'rejecting';
    final String sentryHint = 'Error while $acceptOrRejectText pin request';

    if (processedResponse.ok) {
      final Map<String, dynamic> body =
          httpClient.toMap(processedResponse.response);

      final String? error = httpClient.parseError(body);

      if (error != null) {
        reportErrorToSentry(
          hint: sentryHint,
          query: verifyClientPinResetServiceRequestMutation,
          response: result,
          state: state,
          variables: variables,
        );
        throw UserException(getErrorMessage());
      }

      final Map<String, dynamic>? data = body['data'] as Map<String, dynamic>?;

      final bool isRequestApproved =
          data?['verifyClientPinResetServiceRequest'] as bool? ?? false;

      if (isRequestApproved) {
        final List<ServiceRequest>? serviceRequests =
            state.serviceRequestState?.clientServiceRequests;

        if (serviceRequests != null) {
          final List<ServiceRequest> removed = serviceRequests
              .where(
                (ServiceRequest request) => request.id != serviceRequestId,
              )
              .toList();

          dispatch(
            UpdateServiceRequestsStateAction(
              clientServiceRequests: removed,
            ),
          );

          dispatch(FetchServiceRequestsCountAction(client: httpClient));
        }
        onPinVerified?.call();
        await AnalyticsService().logEvent(
          name: resolvePinRequest,
          eventType: AnalyticsEventType.INTERACTION,
          parameters: <String, dynamic>{
            'serviceRequestID': serviceRequestId,
          },
        );
      }
    } else {
      reportErrorToSentry(
        hint: sentryHint,
        query: verifyClientPinResetServiceRequestMutation,
        response: result,
        state: state,
        variables: variables,
      );
      throw UserException(getErrorMessage());
    }

    return state;
  }

  @override
  Object? wrapError(dynamic error) {
    if (error.runtimeType == UserException) {
      return error;
    }

    Sentry.captureException(error);
    return UserException(getErrorMessage());
  }
}
