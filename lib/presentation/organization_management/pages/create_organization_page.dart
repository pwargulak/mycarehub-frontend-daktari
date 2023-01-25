import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/list_item_with_cancel.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class CreateOrganizationPage extends StatelessWidget {
  const CreateOrganizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: createOrganizationString,
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
                  orgDetail(addOrganizationDetailsString),
                  style: normalSize14Text(AppColors.greyTextColor),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        nameString,
                        style: normalSize14Text(AppColors.greyTextColor),
                      ),
                      smallVerticalSizedBox,
                      CustomTextField(
                        borderColor: Colors.white,
                        customFillColor:
                        AppColors.greyTextColor.withOpacity(0.15),
                      ),
                      mediumVerticalSizedBox,
                      Text(
                        descriptionString,
                        style: normalSize14Text(AppColors.greyTextColor),
                      ),
                      smallVerticalSizedBox,
                      CustomTextField(
                        borderColor: Colors.white,
                        customFillColor:
                        AppColors.greyTextColor.withOpacity(0.15),
                        maxLines: 3,
                        minLines: 3,
                      ),
                      mediumVerticalSizedBox,
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: AppColors.greyTextColor.withOpacity(0.3),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              programsString,
                              style: normalSize14Text(AppColors.greyTextColor),
                            ),
                            smallVerticalSizedBox,
                            const ListItemWithCancelButton(
                              title: myCareHubOrgString,
                              description: myCareHubOrgDescriptionString,
                            ),
                            smallVerticalSizedBox,
                            const ListItemWithCancelButton(
                              title: FYJ,
                              description: fYJOrgDescriptionString,
                            ),
                            smallVerticalSizedBox,
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
                    ],
                  ),
                ),
                mediumVerticalSizedBox,
                const SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: MyAfyaHubPrimaryButton(
                    borderColor: Colors.transparent,
                    text: createOrganizationString,
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
