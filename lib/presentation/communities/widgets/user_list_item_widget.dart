// ignore_for_file: avoid_dynamic_calls

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/services/communities_utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/kick_user_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/pages/normal_message_item.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.name,
    required this.userID,
    required this.roomID,
    this.onTap,
    this.isModerator = false,
    this.isSelf = false,
    this.onLongPress,
  });

  final String name;
  final String userID;

  final String roomID;
  // final Function? onLongPress;
  final Function? onTap;
  final bool? isModerator;

  /// You can't perform moderation actions on yourself
  final bool? isSelf;

  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final String roomInitials = getInitials(name);

    return InkWell(
      onTap: () {
        if (onTap != null) onTap?.call();
      },
      onLongPress: (isSelf ?? false || onLongPress == null)
          ? null
          : () async {
              await showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        const Text(actionsText, style: titleStyle),
                        const SizedBox(height: 10),
                        MessageReactionItem(
                          buttonKey: promoteToModKey,
                          title: promoteToModeratorText,
                          onTap: () {},
                          iconData: Icons.add_task_rounded,
                          iconColor: Colors.greenAccent,
                        ),
                        MessageReactionItem(
                          buttonKey: removeFromGroupKey,
                          title: removeFromGroupString,
                          onTap: () {
                            StoreProvider.dispatch<AppState>(
                              context,
                              KickUserAction(
                                roomID: roomID,
                                userID: userID,
                                client:
                                    AppWrapperBase.of(context)!.graphQLClient,
                                onSuccess: () {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          userRemovedSuccessText,
                                        ),
                                      ),
                                    );
                                },
                              ),
                            );
                          },
                          textColor: Colors.redAccent,
                          iconData: Icons.remove,
                          iconColor: Colors.redAccent,
                        ),
                        MessageReactionItem(
                          buttonKey: banUserKey,
                          title: banThisUserString,
                          onTap: () {},
                          textColor: Colors.redAccent,
                          iconData: Icons.block,
                          iconColor: Colors.redAccent,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.purple.withOpacity(0.4),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Center(
                    child: Text(
                      roomInitials.toUpperCase(),
                      style: coloredTitleStyle(Colors.purple),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  name,
                  style: bodyStyle,
                ),
              ],
            ),
            if (isModerator ?? false)
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: const Color(0xff00BE33).withOpacity(.1),
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                ),
                child: Text(
                  moderatorText,
                  style: bodyStyle.copyWith(
                    color: const Color(0xff00BE33),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
