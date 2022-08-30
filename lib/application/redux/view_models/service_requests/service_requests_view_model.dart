import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:prohealth360_daktari/application/redux/states/service_requests/survey_service_request_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:prohealth360_daktari/domain/core/entities/service_requests/service_request.dart';

class ServiceRequestsViewModel extends Vm {
  final Wait wait;
  final List<ServiceRequest>? clientServiceRequests;

  final List<ServiceRequest>? staffServiceRequests;

  final List<ServiceRequest>? resolvedServiceRequests;

  final PendingServiceRequestCount? pendingServiceRequestCount;

  final ScreeningToolsState? screeningToolsState;

  final SurveyServiceRequestState? surveyServiceRequestState;

  final bool? errorFetchingServiceRequests;
  ServiceRequestsViewModel({
    required this.wait,
    this.clientServiceRequests,
    this.staffServiceRequests,
    this.resolvedServiceRequests,
    this.pendingServiceRequestCount,
    this.screeningToolsState,
    this.surveyServiceRequestState,
    this.errorFetchingServiceRequests,
  }) : super(
          equals: <Object?>[
            wait,
            clientServiceRequests,
            staffServiceRequests,
            resolvedServiceRequests,
            pendingServiceRequestCount,
            screeningToolsState,
            surveyServiceRequestState,
            errorFetchingServiceRequests,
          ],
        );

  factory ServiceRequestsViewModel.fromStore(Store<AppState> store) {
    return ServiceRequestsViewModel(
      wait: store.state.wait!,
      clientServiceRequests:
          store.state.serviceRequestState?.clientServiceRequests,
      staffServiceRequests:
          store.state.serviceRequestState?.staffServiceRequests,
      resolvedServiceRequests:
          store.state.serviceRequestState?.resolvedServiceRequests,
      pendingServiceRequestCount:
          store.state.serviceRequestState?.pendingServiceRequestsCount,
      screeningToolsState: store.state.serviceRequestState?.screeningToolsState,
      surveyServiceRequestState: store.state.serviceRequestState?.surveyServiceRequestState,
      errorFetchingServiceRequests:
          store.state.serviceRequestState?.errorFetchingPendingServiceRequests,
    );
  }
}
