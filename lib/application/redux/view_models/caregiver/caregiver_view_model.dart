import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';

class CaregiverViewModel extends Vm {
  final Wait wait;
  final List<Caregiver?>? caregivers;
  final bool errorFetchingCaregivers;
  final bool noCaregiversFound;

  CaregiverViewModel({
    required this.wait,
    this.caregivers,
    required this.errorFetchingCaregivers,
    required this.noCaregiversFound,
  }) : super(
          equals: <Object?>[
            wait,
            caregivers,
            errorFetchingCaregivers,
            noCaregiversFound
          ],
        );

  factory CaregiverViewModel.fromStore(Store<AppState> store) {
    return CaregiverViewModel(
      wait: store.state.wait!,
      caregivers:
          store.state.miscState?.searchCaregiverResponseState?.caregivers,
      errorFetchingCaregivers: store.state.miscState
              ?.searchCaregiverResponseState?.errorFetchingCaregivers ??
          false,
      noCaregiversFound: store.state.miscState?.searchCaregiverResponseState
              ?.noCaregiversFound ??
          false,
    );
  }
}
