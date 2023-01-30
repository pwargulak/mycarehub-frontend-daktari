import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class CreateProgramPage extends StatelessWidget {
  const CreateProgramPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: createProgramString,
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
                  child: SvgPicture.asset(serviceRequestsIconSvg),
                ),
                mediumVerticalSizedBox,
                Text(
                  addProgramDetailString,
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
                      Text(
                        organisationString,
                        style: normalSize14Text(AppColors.greyTextColor),
                      ),
                      smallVerticalSizedBox,
                      const ProgramListItem(
                        title: universityOfNairobiString,
                        description: '',
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
                              facilitiesString,
                              style: normalSize14Text(AppColors.greyTextColor),
                            ),
                            smallVerticalSizedBox,
                            const ProgramListItem(
                              title: ruiru,
                              description: ruiruFacilityDescriptionString,
                            ),
                            smallVerticalSizedBox,
                            const ProgramListItem(
                              title: kiambu,
                              description: kiambuFacilityDescriptionString,
                            ),
                            smallVerticalSizedBox,
                            const SizedBox(
                              width: double.infinity,
                              height: 48,
                              child: MyAfyaHubPrimaryButton(
                                borderColor: Colors.transparent,
                                text: addFacilityString,
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
                    text: createProgramString,
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
