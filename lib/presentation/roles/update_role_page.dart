import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/permission_item_widget.dart';

class UpdateRolePage extends StatelessWidget {
  const UpdateRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> permissionWidgets = <Widget>[];

    for (int i = 0; i < permissions.length; i++) {
      permissionWidgets.add(
        Column(
          children: <Widget>[
            mediumVerticalSizedBox,
            PermissionItemWidget(
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
        title: updateRoleString,
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
                      deleteRoleString,
                      style: veryBoldSize17Text(AppColors.warningColor),
                    ),
                    size15VerticalSizedBox,
                    Text(
                      deleteRoleDescriptionString,
                      style: normalSize16Text(AppColors.greyTextColor),
                    ),
                    size15VerticalSizedBox,
                    const SizedBox(
                      width: double.infinity,
                      child: MyAfyaHubPrimaryButton(
                        buttonColor: AppColors.warningColor,
                        text: deleteRoleString,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: MyAfyaHubPrimaryButton(
            borderColor: Colors.transparent,
            text: saveChangesString,
          ),
        ),
      ),
    );
  }
}
