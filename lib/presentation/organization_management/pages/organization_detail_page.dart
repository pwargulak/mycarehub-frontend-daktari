import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/buttons.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/spaces.dart';
import 'package:sghi_core/afya_moja_core/src/presentation/text_themes.dart';

class OrganizationDetailPage extends StatelessWidget {
  const OrganizationDetailPage({super.key});

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
                      ProgramListItem(
                        title: myCareHubOrgString,
                        description: myCareHubOrgDescriptionString,
                        onCancel: () {},
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.programDetailPageRoute);
                        },
                      ),
                      mediumVerticalSizedBox,
                      ProgramListItem(
                        title: FYJ,
                        description: fYJOrgDescriptionString,
                        onCancel: () {},
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.programDetailPageRoute);
                        },
                      ),
                      largeVerticalSizedBox,
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: MyAfyaHubPrimaryButton(
                          borderColor: Colors.transparent,
                          buttonKey: addProgramButtonKey,
                          text: addProgramString,
                          onPressed: () => Navigator.of(context)
                              .pushNamed(AppRoutes.manageProgramsPageRoute),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
