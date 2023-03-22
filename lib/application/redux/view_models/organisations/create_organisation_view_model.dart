import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/states/user_profile/programs_state.dart';

class CreateOrganisationViewModel extends Vm {
  CreateOrganisationViewModel({
    required this.isConnected,
    required this.wait,
    this.programsState,
    required this.programsPayload,
  }) : super(
          equals: <Object?>[
            isConnected,
            wait,
            programsState,
            programsPayload,
          ],
        );

  final bool isConnected;
  final Wait wait;
  final ProgramsState? programsState;
  final List<Map<String, dynamic>> programsPayload;
  factory CreateOrganisationViewModel.fromStore(Store<AppState> store) {
    return CreateOrganisationViewModel(
      wait: store.state.wait ?? Wait(),
      isConnected: store.state.connectivityState?.isConnected ?? false,
      programsState: store.state.userProfileState?.programsState,
      programsPayload:
          store.state.userProfileState?.organizationState?.programsPayload ?? <Map<String, dynamic>>[],
    );
  }
}
