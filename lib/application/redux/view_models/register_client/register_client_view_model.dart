import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class RegisterClientViewModel extends Vm {
  RegisterClientViewModel({required this.wait, this.hasConnection = false, required this.cccNumberExists})
      : super(equals: <Object?>[wait, hasConnection]);

  final Wait wait;
  final bool hasConnection;
  final bool cccNumberExists;

  factory RegisterClientViewModel.fromStore(Store<AppState> store) {
    return RegisterClientViewModel(
      wait: store.state.wait!,
      hasConnection: store.state.connectivityState?.isConnected ?? false,
      cccNumberExists: store.state.miscState?.cccNumberExists ?? false,
    );
  }
}
