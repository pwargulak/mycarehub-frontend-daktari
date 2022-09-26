// Package imports:
import 'package:async_redux/async_redux.dart';
// Project imports:
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/search_caregiver_response_state.dart';

class UpdateCaregiverAction extends ReduxAction<AppState> {
  UpdateCaregiverAction({
    this.caregivers,
    this.errorFetchingCaregivers,
    this.noCaregiversFound,
  });

  final List<Caregiver?>? caregivers;
  final bool? errorFetchingCaregivers;
  final bool? noCaregiversFound;

  @override
  AppState reduce() {
    final SearchCaregiverResponseState? searchCaregiverResponseState =
        state.miscState!.searchCaregiverResponseState?.copyWith(
          caregivers: caregivers ?? state.miscState?.searchCaregiverResponseState?.caregivers,
          errorFetchingCaregivers: errorFetchingCaregivers ?? state.miscState?.searchCaregiverResponseState?.errorFetchingCaregivers,
          noCaregiversFound: noCaregiversFound ?? state.miscState?.searchCaregiverResponseState?.noCaregiversFound,
        );
        
    final AppState newState = state.copyWith(
      miscState: state.miscState?.copyWith.call(
        searchCaregiverResponseState: searchCaregiverResponseState,
      ),
    );

    return newState;
  }
}
