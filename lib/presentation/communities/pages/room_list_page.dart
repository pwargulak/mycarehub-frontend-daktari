import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/communities/room_list_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/room_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/communities/models/room.dart';

class RoomListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: conversationsTitle,
        showBackButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: StoreConnector<AppState, RoomListViewModel>(
                converter: (Store<AppState> store) {
                  return RoomListViewModel.fromStore(store);
                },
                builder: (BuildContext context, RoomListViewModel vm) {
                  if (vm.wait?.isWaitingFor(syncingEventsFlag) ?? false) {
                    return Center(
                      child: Column(
                        children: const <Widget>[
                          Text(fetchingYourMessagesString),
                          SizedBox(height: 20),
                          CircularProgressIndicator(),
                        ],
                      ),
                    );
                  }

                  final List<Room>? invitedRooms =
                      vm.invitedRooms?.values.toList();

                  final List<Room>? joinedRooms =
                      vm.joinedRooms?.values.toList();

                  final List<Room> allRooms = <Room>[
                    ...?invitedRooms,
                    ...?joinedRooms
                  ];

                  if (allRooms.isEmpty) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          const Text(
                            roomsZeroStateDescriptionText,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: TextButton(
                              key: emptyChatsNewRoomKey,
                              onPressed: () => Navigator.pushNamed(
                                context,
                                AppRoutes.createRoomPage,
                              ),
                              child: const Text(createARoom),
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: allRooms.length,
                    itemBuilder: (BuildContext context, int i) {
                      final Room currentRoom = allRooms[i];
                      final String groupName = currentRoom.name ?? noNameString;
                      final String groupMembers =
                          currentRoom.summary?.joinedMembers.toString() ??
                              noString.toLowerCase();
                      final bool isInvite = currentRoom.invite ?? false;

                      return RoomListItemWidget(
                        groupName: groupName,
                        currentRoom: currentRoom,
                        isInvite: isInvite,
                        groupMembers: groupMembers,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: BottomNavIndex.communities.index,
      ),
    );
  }
}
