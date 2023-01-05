import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_assessment_responses_by_tool_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_available_facility_screening_tools_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/fetch_service_request_count_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/error_strings.dart';

class ResolveScreeningToolServiceRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String serviceRequestId;
  final String? comments;
  final List<String> actionsTaken;
  final ScreeningToolsType screeningToolsType;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  ResolveScreeningToolServiceRequestAction({
    required this.serviceRequestId,
    required this.actionsTaken,
    this.comments,
    required this.client,
    required this.screeningToolsType,
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
        hint: resolvePINrequestsErrorString,
        query: verifyClientPinResetServiceRequestQuery,
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
        FetchAvailableFacilityScreeningToolsAction(
          client: client,
        ),
      );
      dispatch(
        FetchAssessmentResponsesByToolAction(
          client: client,
          toolsType: screeningToolsType,
        ),
      );
      dispatch(
        FetchServiceRequestsCountAction(
          client: client,
        ),
      );

      onSuccess?.call();
      return state;
    }

    onFailure?.call();
    return null;
  }
}
