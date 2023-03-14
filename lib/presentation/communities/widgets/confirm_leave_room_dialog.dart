import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/leave_room_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';

class ConfirmLeaveRoomDialog extends StatelessWidget {
  const ConfirmLeaveRoomDialog({
    super.key,
    required this.room,
  });

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              leaveGroupTitle,
              style: heavySize16Text(AppColors.redColor),
              textAlign: TextAlign.left,
            ),
            smallVerticalSizedBox,
            Text(
              leaveGroupDescriptionText,
              style: normalSize14Text(
                AppColors.unSelectedReactionIconColor,
              ),
              textAlign: TextAlign.left,
            ),
            mediumVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonKey: confirmLeaveRoomKey,
                buttonColor: Colors.red,
                text: leaveGroupString,
                textStyle: boldSize16Text(AppColors.whiteColor),
                textColor: AppColors.whiteColor,
                onPressed: () {
                  StoreProvider.dispatch<AppState>(
                    context,
                    LeaveRoomAction(
                      roomID: room.roomID!,
                      onSuccess: () {
                        Navigator.of(context).pushNamed(AppRoutes.roomListPage);
                      },
                      client: AppWrapperBase.of(context)!.graphQLClient,
                    ),
                  );
                },
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                borderColor: Colors.transparent,
                buttonKey: cancelLeaveRoomKey,
                buttonColor: AppColors.malachiteColor.withOpacity(0.2),
                text: cancelString,
                textStyle: boldSize16Text(AppColors.malachiteColor),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
