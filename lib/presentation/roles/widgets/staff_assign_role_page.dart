import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class StaffAssignRolePage extends StatelessWidget {
  const StaffAssignRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> permissionWidgets = <Widget>[];

    for (int i = 0; i < permissions.length; i++) {
      permissionWidgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            mediumVerticalSizedBox,
            Text(
              '${i + 1}. ${permissions[i]['title'] ?? ''}',
              style: veryBoldSize16Text(AppColors.greyTextColor),
            ),
            smallVerticalSizedBox,
            Text(
              permissions[i]['description'] ?? '',
              style: normalSize14Text(AppColors.greyTextColor),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: const CustomAppBar(
        title: clientManagement,
        showNotificationIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
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
                      text: listOfThingsString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: clientManagement.toLowerCase(),
                      style: veryBoldSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: reviewAndAddString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              ...permissionWidgets,
              size70VerticalSizedBox,
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: MyAfyaHubPrimaryButton(
            buttonKey: assignRoleButtonKey,
            borderColor: Colors.transparent,
            text: assignRole,
          ),
        ),
      ),
    );
  }
}
