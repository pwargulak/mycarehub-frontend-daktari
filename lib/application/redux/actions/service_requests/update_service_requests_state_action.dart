import 'package:async_redux/async_redux.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/screening_tools_state.dart';
import 'package:mycarehubpro/application/redux/states/service_requests/service_requests_state.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/pending_service_request_count.dart';
import 'package:mycarehubpro/domain/core/entities/service_requests/service_request.dart';

class UpdateServiceRequestsStateAction extends ReduxAction<AppState> {
  UpdateServiceRequestsStateAction({
    this.clientServiceRequests,
    this.errorFetchingPendingServiceRequests,
    this.staffServiceRequests,
    this.pendingServiceRequestsCount,
    this.screeningToolsState,
  });

  final List<ServiceRequest>? clientServiceRequests;
  final bool? errorFetchingPendingServiceRequests;
  final List<ServiceRequest>? staffServiceRequests;
  final PendingServiceRequestCount? pendingServiceRequestsCount;
  final ScreeningToolsState? screeningToolsState;

  @override
  Future<AppState> reduce() async {
    final ServiceRequestState? serviceRequestsState =
        state.serviceRequestState?.copyWith(
      clientServiceRequests: clientServiceRequests ??
          state.serviceRequestState?.clientServiceRequests,
      staffServiceRequests: staffServiceRequests ??
          state.serviceRequestState?.staffServiceRequests,
      errorFetchingPendingServiceRequests:
          errorFetchingPendingServiceRequests ??
              state.serviceRequestState?.errorFetchingPendingServiceRequests,
      pendingServiceRequestsCount: pendingServiceRequestsCount ??
          state.serviceRequestState?.pendingServiceRequestsCount,
      screeningToolsState:
          screeningToolsState ?? state.serviceRequestState?.screeningToolsState,
    );

    final AppState newState = state.copyWith(
      serviceRequestState: serviceRequestsState,
    );

    return newState;
  }
}
