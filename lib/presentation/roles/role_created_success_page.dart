import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class RoleCreatedSuccessPage extends StatelessWidget {
  const RoleCreatedSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: SizedBox.expand(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(hotBeverageImagePath),
                largeVerticalSizedBox,
                Text(
                  roleCreatedTitle,
                  style: boldSize18Text(AppColors.resumeWithPinTitleColor),
                ),
                largeVerticalSizedBox,
                Text(
                  roleCreatedDescription,
                  style: normalSize15Text(),
                  textAlign: TextAlign.center,
                ),
                veryLargeVerticalSizedBox,
                const SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: MyAfyaHubPrimaryButton(
                    buttonKey: assignPermissionsButtonKey,
                    text: assignPermissions,
                  ),
                ),
                veryLargeVerticalSizedBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
