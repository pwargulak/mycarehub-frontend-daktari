import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/deactivate_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/list_item_with_cancel.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/buttons.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/spaces.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/text_themes.dart';

class OrganizationDetailViewPage extends StatelessWidget {
  const OrganizationDetailViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: orgName(sghiString),
        showNotificationIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                mediumVerticalSizedBox,
                Center(
                  key: const Key('OrganizationImage'),
                  child: SvgPicture.asset(organizationImage),
                ),
                mediumVerticalSizedBox,
                Text(
                  sghiString,
                  style: heavySize18Text(AppColors.blackColor),
                ),
                largeVerticalSizedBox,
                Text(
                  SGHIOrgDetailString,
                  style: normalSize14Text(AppColors.greyTextColor),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                const Divider(),
                mediumVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        programsString,
                        style: heavySize16Text(AppColors.blackColor),
                      ),
                      smallVerticalSizedBox,
                      Text(
                        runningProgramString,
                        style: normalSize14Text(AppColors.greyTextColor),
                      ),
                      mediumVerticalSizedBox,
                      const ListItemWithCancelButton(
                        title: myCareHubOrgString,
                        description: myCareHubOrgDescriptionString,
                        moreInfo: tapToViewMoreInfoString,
                      ),
                      mediumVerticalSizedBox,
                      const ListItemWithCancelButton(
                        title: FYJ,
                        description: fYJOrgDescriptionString,
                        moreInfo: tapToViewMoreInfoString,
                      ),
                      largeVerticalSizedBox,
                      const SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: MyAfyaHubPrimaryButton(
                          borderColor: Colors.transparent,
                          text: addProgramString,
                        ),
                      ),
                    ],
                  ),
                ),
                largeVerticalSizedBox,
                const DeactivateWidget(
                  title: deactivateOrgString,
                  description: deactivateOrgInfoString,
                  buttonText: deactivateOrgString,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
