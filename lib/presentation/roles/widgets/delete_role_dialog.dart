import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class DeleteRoleDialog extends StatelessWidget {
  const DeleteRoleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 1,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              areYouReallySureTitle,
              style: veryBoldSize18Text(
                AppColors.warningColor,
              ),
            ),
            size15VerticalSizedBox,
            RichText(
              text: TextSpan(
                text: confirmDeletionSting,
                style: normalSize14Text(
                  AppColors.greyTextColor,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '$clientManagementString role',
                    style: veryBoldSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                  const TextSpan(
                    text: '?\n\n',
                  ),
                  const TextSpan(
                    text: pleaseTypeWordSting,
                  ),
                  TextSpan(
                    text: ' "$deleteSting" ',
                    style: veryBoldSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                  const TextSpan(
                    text: belowSting,
                  ),
                ],
              ),
            ),
            smallVerticalSizedBox,
            SizedBox(
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8.0),
                ),
                style: const TextStyle(
                  color: AppColors.greyTextColor,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
              ),
            ),
            smallVerticalSizedBox,
            const SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                text: deleteRoleString,
                buttonKey: deleteRoleButtonKey,
                buttonColor: AppColors.warningColor,
                borderColor: Colors.transparent,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonKey: cancelButtonKey,
                text: cancelString,
                textColor: AppColors.greenHappyColor,
                buttonColor: AppColors.greenHappyColor.withOpacity(0.1),
                borderColor: Colors.transparent,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
