import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/permission_item_widget.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/revoke_role_dialog.dart';

class RoleDetailsPage extends StatelessWidget {
  const RoleDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> permissionWidgets = <Widget>[];

    for (int i = 0; i < permissions.length; i++) {
      permissionWidgets.add(
        Column(
          children: <Widget>[
            mediumVerticalSizedBox,
            PermissionItemWidget(
              updateRole: false,
              description: permissions[i]['description'] ?? '',
              question: permissions[i]['title'] ?? '',
              index: i,
              isAssigned: i.isOdd,
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: const CustomAppBar(
        title: clientManagementString,
        showNotificationIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                permissionsString,
                style: boldSize18Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: userAssignedString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: ' ${clientManagement.toLowerCase()} ',
                      style: veryBoldSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: whatUserCanPerformString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              ...permissionWidgets,
              veryLargeVerticalSizedBox,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppColors.warningColor.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.warningColor.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      revokeRole,
                      style: veryBoldSize17Text(AppColors.warningColor),
                    ),
                    size15VerticalSizedBox,
                    Text(
                      revokeRoleDescriptionString,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                    size15VerticalSizedBox,
                    SizedBox(
                      width: double.infinity,
                      child: MyAfyaHubPrimaryButton(
                        buttonKey: revokeRoleButtonKey,
                        buttonColor: AppColors.warningColor,
                        text: revokeRole,
                        onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const RevokeRoleDialog();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              size70VerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
