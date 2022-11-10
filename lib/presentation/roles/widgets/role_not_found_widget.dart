import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

class RoleNotFoundWidget extends StatelessWidget {
  const RoleNotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(roleNotFoundImage),
            size40VerticalSizedBox,
            Text(
              noRoleFound,
              style: veryBoldSize18Text(AppColors.resumeWithPinTitleColor),
            ),
            mediumVerticalSizedBox,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                noRoleFoundDescription,
                textAlign: TextAlign.center,
                style: normalSize15Text(
                  AppColors.unSelectedReactionIconColor,
                ),
              ),
            ),
            size40VerticalSizedBox,
            SizedBox(
              height: 52,
              width: double.infinity,
              child: MyAfyaHubPrimaryButton(
                buttonKey: createRoleButtonKey,
                text: createRoleString,
                onPressed: () {},
              ),
            ),
            size70VerticalSizedBox
          ],
        ),
      ),
    );
  }
}
