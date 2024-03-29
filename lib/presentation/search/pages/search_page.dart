import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: searchString),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              SvgPicture.asset(
                searchSvgPath,
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              largeVerticalSizedBox,
              Text(
                searchPageTitle,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              Wrap(
                children: <Widget>[
                  SizedBox(
                    child: ActionCard(
                      key: clientSearchActionCardKey,
                      iconUrl: clientSearchSvgPath,
                      title: clients,
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.searchClientPage);
                      },
                      backgroundColor: AppColors.primaryColor.withOpacity(0.14),
                    ),
                  ),
                  ActionCard(
                    key: staffSearchActionCardKey,
                    iconUrl: staffSearchSvgPath,
                    title: staffMembers,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.14),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.searchStaffMemberPage);
                    },
                  ),
                  ActionCard(
                    key: caregiverSearchActionCardKey,
                    iconUrl: caregiverSearchSvgPath,
                    title: caregiversString,
                    backgroundColor: AppColors.primaryColor.withOpacity(0.14),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.searchCaregiverPage);
                    },
                  ),
                ],
              ),
              mediumVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
