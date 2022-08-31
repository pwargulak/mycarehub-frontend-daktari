import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_graphql_client/graph_client.dart';
import 'package:http/http.dart';
import 'package:prohealth360_daktari/application/core/graphql/mutations.dart';
import 'package:prohealth360_daktari/application/core/services/analytics_service.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/service_requests/update_survey_service_requests_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/surveys/survey_respondent.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_events.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ResolveSurveyServiceRequestAction extends ReduxAction<AppState> {
  final IGraphQlClient client;
  final String serviceRequestId;
  final String? comments;
  final List<String> actionsTaken;
  final VoidCallback? onSuccess;
  final VoidCallback? onFailure;

  ResolveSurveyServiceRequestAction({
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
    final String staffId = state.staffState?.id ?? '';

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
      Sentry.captureException(
        error,
        hint: 'Error while resolving service request',
      );

      return null;
    }

    final Map<String, dynamic>? data = payLoad['data'] as Map<String, dynamic>?;

    final bool? isResolved = data?['resolveServiceRequest'] as bool?;

    if (isResolved ?? false) {
      ///A list of the [surveyRespondents] excluding the one resolved
      final List<SurveyRespondent?>? surveyRespondents = state
              .serviceRequestState
              ?.surveyServiceRequestState
              ?.surveyServiceRequestRespondentsState
              ?.surveyRespondents
              ?.where(
                (SurveyRespondent? element) =>
                    (element?.serviceRequestID ?? '') != serviceRequestId,
              )
              .toList();

      dispatch(
        UpdateSurveyServiceRequestsStateAction(
          surveyServiceRequestRespondentsState: state.serviceRequestState
              ?.surveyServiceRequestState?.surveyServiceRequestRespondentsState
              ?.copyWith(
            surveyRespondents: surveyRespondents,
          ),
        ),
      );
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
