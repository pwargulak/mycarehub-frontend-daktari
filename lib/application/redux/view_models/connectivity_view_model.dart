import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class ConnectivityViewModel extends Vm {
  ConnectivityViewModel({required this.isConnected, required this.wait})
      : super(equals: <Object?>[isConnected, wait]);

  final bool isConnected;
  final Wait wait;
  factory ConnectivityViewModel.fromStore(Store<AppState> store) {
    return ConnectivityViewModel(
      wait: store.state.wait ?? Wait(),
      isConnected: store.state.connectivityState?.isConnected ?? false,
    );
  }
}
