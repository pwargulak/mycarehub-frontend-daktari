import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class CreateRoomViewModel extends Vm {
  CreateRoomViewModel({required this.isCreatingRoom})
      : super(equals: <Object?>[isCreatingRoom]);

  factory CreateRoomViewModel.fromStore(Store<AppState> store) {
    return CreateRoomViewModel(
      isCreatingRoom: store.state.wait?.isWaitingFor(createRoomFlag) ?? false,
    );
  }

  final bool isCreatingRoom;
}
