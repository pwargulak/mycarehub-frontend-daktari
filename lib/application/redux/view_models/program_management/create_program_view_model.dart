import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class CreateProgramViewModel extends Vm {
  CreateProgramViewModel({
    required this.wait,
    this.hasConnection = false,
  }) : super(equals: <Object?>[wait, hasConnection]);

  final Wait wait;
  final bool hasConnection;

  factory CreateProgramViewModel.fromStore(Store<AppState> store) {
    return CreateProgramViewModel(
      wait: store.state.wait!,
      hasConnection: store.state.connectivityState?.isConnected ?? false,
    );
  }
}
