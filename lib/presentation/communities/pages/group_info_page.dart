import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/communities_utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/fetch_room_members_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/communities/room_info_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/widgets/confirm_leave_room_dialog.dart';
import 'package:prohealth360_daktari/presentation/communities/widgets/user_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class RoomInfoPage extends StatelessWidget {
  const RoomInfoPage({super.key, required this.room});

  final Room room;

  @override
  Widget build(BuildContext context) {
    final String roomInitials = getInitials(room.name ?? noRoomNameString);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: Center(child: Text('${room.name ?? ''} info')),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
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
          Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                Text(
                  room.name ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${room.summary?.joinedMembers?.toString() ?? ''} members',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                if (room.topic?.isNotEmpty ?? false) ...<Widget>[
                  const SizedBox(height: 10),
                  Text(
                    room.topic ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            groupMembersString,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            groupMembersInstructionString,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              key: inviteUsersKey,
              onPressed: () async {
                // Search for a user and add them
                // navigate to rooms page
                Navigator.pushNamed(
                  context,
                  AppRoutes.inviteUsersPage,
                  arguments: room,
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(inviteMembersTitle),
              ),
            ),
          ),
          StoreConnector<AppState, RoomInfoViewModel>(
            onInit: (Store<AppState> store) {
              store.dispatch(
                FetchRoomMembersAction(
                  roomID: room.roomID!,
                  client: AppWrapperBase.of(context)!.graphQLClient,
                ),
              );
            },
            converter: (Store<AppState> store) {
              return RoomInfoViewModel.fromStore(store);
            },
            builder: (BuildContext context, RoomInfoViewModel vm) {
              if (vm.wait?.isWaitingFor(fetchRoomMembersFlag) ?? false) {
                return const Center(child: CircularProgressIndicator());
              }

              final List<RoomUser>? users = vm.groupInfoMembers;

              return ListView.builder(
                itemCount: users?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final RoomUser currentUser = users![index];

                  return UserListItem(
                    name: currentUser.roomUser?.displayName ?? noNameString,
                    userID: currentUser.roomUser?.userID ?? noUserIdString,
                    isModerator: currentUser.moderator,
                    isSelf: currentUser.roomUser?.userID == vm.authUserID,
                    roomID: room.roomID ?? '',
                  );
                },
              );
            },
          ),
          StoreConnector<AppState, RoomInfoViewModel>(
            converter: (Store<AppState> store) =>
                RoomInfoViewModel.fromStore(store),
            builder: (BuildContext context, RoomInfoViewModel vm) {
              if (vm.wait?.isWaitingFor(leaveRoomFlag) ?? false) {
                return const Center(child: CircularProgressIndicator());
              }
              return TextButton(
                key: leaveRoomKey,
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmLeaveRoomDialog(room: room);
                  },
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(leaveRoomString),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
