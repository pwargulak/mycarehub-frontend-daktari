import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/user_profile/constants.dart';

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
                  child: SvgPicture.asset(organizationImage),
                ),
                mediumVerticalSizedBox,
                Text(
                  addOrganizationDetailsString,
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
                        registrationNumberString,
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
                        phoneNumberString,
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
                      Text(
                        countryString,
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
                        email,
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
                        physicalAddressString,
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
                            ProgramListItem(
                              title: myCareHubOrgString,
                              description: myCareHubOrgDescriptionString,
                              onCancel: () {},
                            ),
                            smallVerticalSizedBox,
                            ProgramListItem(
                              title: FYJ,
                              description: fYJOrgDescriptionString,
                              onCancel: () {},
                            ),
                            mediumVerticalSizedBox,
                            SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: MyAfyaHubPrimaryButton(
                                borderColor: Colors.transparent,
                                buttonKey: addProgramButtonKey,
                                text: addProgramString,
                                onPressed: () =>
                                    Navigator.of(context).pushNamed(
                                  AppRoutes.manageProgramsPageRoute,
                                ),
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
