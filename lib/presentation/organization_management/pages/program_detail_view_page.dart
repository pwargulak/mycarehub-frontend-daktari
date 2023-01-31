import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/badge_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/deactivate_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/list_item_with_cancel.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class ProgramDetailViewPage extends StatelessWidget {
  const ProgramDetailViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> diseases = <String>[
      'HIV',
      'Diabetes',
      'Hypertension',
      'Schizophrenia',
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: programName(myCareHubOrgString),
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
                  key: const Key('ProgramImage'),
                  child: SvgPicture.asset(serviceRequestsIconSvg),
                ),
                smallVerticalSizedBox,
                Text(
                  myCareHubOrgString,
                  style: heavySize18Text(AppColors.blackColor),
                ),
                mediumVerticalSizedBox,
                Text(
                  myCareHubOrgDescriptionString,
                  style: normalSize14Text(AppColors.greyTextColor),
                  textAlign: TextAlign.center,
                ),
                mediumVerticalSizedBox,
                const Divider(),
                verySmallVerticalSizedBox,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        organizationString,
                        style: heavySize16Text(AppColors.blackColor),
                      ),
                      smallVerticalSizedBox,
                      Text(
                        organizationDescriptionString,
                        style: normalSize14Text(AppColors.greyTextColor),
                      ),
                      mediumVerticalSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            diseaseAreasString,
                            style: heavySize16Text(AppColors.blackColor),
                          ),
                          smallVerticalSizedBox,
                          Text(
                            diseaseAreasDescriptionString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: <Widget>[
                              for (String disease in diseases) ...<Widget>[
                                BadgeWidget(
                                  title: disease,
                                )
                              ],
                            ],
                          ),
                        ],
                      ),
                      mediumVerticalSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            facilitiesString,
                            style: heavySize16Text(AppColors.blackColor),
                          ),
                          smallVerticalSizedBox,
                          Text(
                            runningFacilitiesString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          const ListItemWithCancelButton(
                            title: ruiru,
                            description: ruiruFacilityDescriptionString,
                          ),
                          smallVerticalSizedBox,
                          const ListItemWithCancelButton(
                            title: kiambu,
                            description: kiambuFacilityDescriptionString,
                          ),
                          mediumVerticalSizedBox,
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
                    ],
                  ),
                ),
                mediumVerticalSizedBox,
                const DeactivateWidget(
                  title: deactivateProgramString,
                  description: deactivateProgramInfoString,
                  buttonText: deactivateProgramString,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
