import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class SignInViewModel extends Vm {
  SignInViewModel({this.wait}) : super(equals: <Object?>[wait]);

  factory SignInViewModel.fromStore(Store<AppState> store) {
    return SignInViewModel(wait: store.state.wait);
  }
  final Wait? wait;
}
