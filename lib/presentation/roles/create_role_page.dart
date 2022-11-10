import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class CreateRolePage extends StatelessWidget {
  const CreateRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: createANewRole,
        showNotificationIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(child: SvgPicture.asset(roleNotFoundImage)),
                largeVerticalSizedBox,
                Center(
                  child: Text(
                    createRoleDescription,
                    style: boldSize15Text(AppColors.grey50),
                  ),
                ),
                largeVerticalSizedBox,
                Text(
                  titleString,
                  style: normalSize14Text(AppColors.listItemBackgroundColor),
                ),
                mediumVerticalSizedBox,
                const CustomTextField(
                  customFillColor: AppColors.searchBackgroundColor,
                ),
                largeVerticalSizedBox,
                Text(
                  description,
                  style: normalSize14Text(AppColors.listItemBackgroundColor),
                ),
                mediumVerticalSizedBox,
                const CustomTextField(
                  customFillColor: AppColors.searchBackgroundColor,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 48,
          child: MyAfyaHubPrimaryButton(
            buttonKey: createRoleButtonKey,
            borderColor: Colors.transparent,
            text: createRoleString,
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.roleCreateSuccessPage);
            },
          ),
        ),
      ),
    );
  }
}
