import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_assessment_respondents_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_available_facility_screening_tools_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class ResolveScreeningToolServiceRequestAction extends ReduxAction<AppState> {
  ResolveScreeningToolServiceRequestAction({
    required this.actionsTaken,
    this.comments,
    required this.client,
    this.onSuccess,
    this.onFailure,
    required this.screeningToolId,
  });

  final List<String> actionsTaken;
  final IGraphQlClient client;
  final String? comments;
  final VoidCallback? onFailure;
  final VoidCallback? onSuccess;
  final String screeningToolId;

  @override
  void after() {
    dispatch(WaitAction<AppState>.remove(resolveServiceRequestFlag));
    super.after();
  }

  @override
  void before() {
    super.before();
    dispatch(WaitAction<AppState>.add(resolveServiceRequestFlag));
  }

  @override
  Future<AppState?> reduce() async {
    final String staffId = state.userProfileState?.userProfile?.id ?? '';
    final String serviceRequestId = state.serviceRequestState
            ?.screeningToolsState?.selectedRespondent?.serviceRequestID ??
        '';

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

    final Map<String, dynamic> payLoad = client.toMap(result);
    final String? error = parseError(payLoad);

    if (error != null) {
      onFailure?.call();
      reportErrorToSentry(
        hint: resolvePINrequestsErrorString,
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
      dispatch(
        FetchAvailableFacilityScreeningToolsAction(client: client),
      );
      dispatch(
        FetchScreeningToolsRespondentsAction(
          client: client,
          screeningToolID: screeningToolId,
        ),
      );
      dispatch(FetchServiceRequestsCountAction(client: client));

      onSuccess?.call();
      return state;
    }

    onFailure?.call();
    return null;
  }
}
