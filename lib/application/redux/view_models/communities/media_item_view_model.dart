import 'dart:typed_data';
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';

class MediaItemViewModel extends Vm {
  MediaItemViewModel({required this.images, this.wait})
      : super(equals: <Object?>[images, wait]);

  factory MediaItemViewModel.fromStore(Store<AppState> store) {
    return MediaItemViewModel(
      wait: store.state.wait,
      images: store.state.chatState?.images,
    );
  }
  final List<Map<String, Uint8List?>?>? images;
  final Wait? wait;
}
