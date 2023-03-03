import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class MessageOptionsViewModel extends Vm {
  MessageOptionsViewModel({required this.isDeletingMessage})
      : super(equals: <Object?>[isDeletingMessage]);

  factory MessageOptionsViewModel.fromStore(Store<AppState> store) {
    return MessageOptionsViewModel(
      isDeletingMessage:
          store.state.wait?.isWaitingFor(deleteMessageFlag) ?? false,
    );
  }

  final bool isDeletingMessage;
}
