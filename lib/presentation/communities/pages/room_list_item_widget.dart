import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/communities_utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/communities/models/room.dart';

class RoomListItemWidget extends StatelessWidget {
  const RoomListItemWidget({
    super.key,
    required this.groupName,
    required this.currentRoom,
    required this.isInvite,
    required this.groupMembers,
  });

  final String groupName;
  final Room currentRoom;
  final bool isInvite;
  final String groupMembers;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: roomListItemKey,
      onTap: () => Navigator.pushNamed(context, AppRoutes.roomPage, arguments: currentRoom),
      borderRadius: BorderRadius.circular(8),     
      highlightColor: Colors.purple.withOpacity(0.3),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.withOpacity(0.2),
              ),
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(
                  getInitials(groupName).toUpperCase(),
                  style: coloredBodyStyle(Colors.purple).copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  groupName,
                  style: TextStyle(
                    color: Colors.purple.withOpacity(0.7),
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  isInvite
                      ? youWereInvitedInstructionText
                      : '$groupMembers $membersString',
                  style: const TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
