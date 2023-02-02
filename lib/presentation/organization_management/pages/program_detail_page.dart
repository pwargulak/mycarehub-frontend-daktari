import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/badge_widget.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

class ProgramDetailPage extends StatelessWidget {
  const ProgramDetailPage({super.key});

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
                          ProgramListItem(
                            title: ruiru,
                            description: ruiruFacilityDescriptionString,
                            onCancel: () {},
                          ),
                          smallVerticalSizedBox,
                          ProgramListItem(
                            title: kiambu,
                            description: kiambuFacilityDescriptionString,
                            onCancel: () {},
                          ),
                          mediumVerticalSizedBox,
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: MyAfyaHubPrimaryButton(
                              borderColor: Colors.transparent,
                              buttonKey: addFacilityButtonKey,
                              text: addFacilityString,
                              onPressed: () => Navigator.of(context)
                                  .pushNamed(AppRoutes.searchFacilitiesPage),
                            ),
                          ),
                        ],
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