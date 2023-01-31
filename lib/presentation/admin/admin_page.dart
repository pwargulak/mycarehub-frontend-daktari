import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';

class AdminPage extends StatelessWidget {
  const AdminPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: adminString,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              mediumVerticalSizedBox,
              Center(
                child: SvgPicture.asset(adminSvgPath),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  children: <Widget>[
                    ActionCard(
                      key: rolesCardKey,
                      iconUrl: manageRolesImage,
                      title: rolesString,
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.manageRolesPage),
                      backgroundColor: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    ActionCard(
                      key: organizationsCardKey,
                      iconUrl: organizationImage,
                      title: organizations,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.15),
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.manageOrganizationsPageRoute),
                    ),
                    ActionCard(
                      key: programsCardKey,
                      iconUrl: serviceRequestsIconSvg,
                      title: programs,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.15),
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.manageProgramsPageRoute),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
