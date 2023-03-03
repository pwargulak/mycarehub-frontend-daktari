import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/communities_utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/join_room_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/communities/room_info_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_list_page.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';

class ReviewInviteWidget extends StatelessWidget {
  const ReviewInviteWidget({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final String roomInitials = getInitials(room.name ?? noRoomNameString);
    final String roomName = room.name ?? '';

    return StoreConnector<AppState, RoomInfoViewModel>(
      converter: (Store<AppState> store) => RoomInfoViewModel.fromStore(store),
      builder: (BuildContext context, RoomInfoViewModel vm) {
        return ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.4),
              ),
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Text(
                  roomInitials.toUpperCase(),
                  style: coloredTitleStyle(Colors.purple),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                roomName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                '$youHaveBeenInvitedToJoinString $roomName $groupString. $tapTheOptionsBelowToDeclineText',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 30),
            if (vm.wait?.isWaitingFor(joinRoomFlag) ?? false)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),
              )
            else ...<Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  key: acceptInviteKey,
                  onPressed: () async {
                    // Accept invite here
                    StoreProvider.dispatch<AppState>(
                      context,
                      JoinRoomAction(
                        roomID: room.roomID!,
                        onSuccess: () {
                          /// Do something nice here
                          Navigator.of(context).push(
                            MaterialPageRoute<bool>(
                              builder: (BuildContext context) =>
                                  const RoomListPage(),
                            ),
                          );
                        },
                        client: AppWrapperBase.of(context)!.graphQLClient,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      joinGroup,
                      style: coloredBodyStyle(Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  key: declineInviteKey,
                  onPressed: () async {
                    // Decline invite here
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      declineInvite,
                      style: coloredBodyStyle(Colors.red),
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
