import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/engagement/home/widgets/action_card.dart';

class AdminPage extends StatelessWidget {
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
                key: const Key('adminSvgPath'),
                child: SvgPicture.asset(adminSvgPath),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  children: <Widget>[
                    ActionCard(
                      iconUrl: serviceRequestsIconSvg,
                      title: serviceRequestString,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    ActionCard(
                      iconUrl: manageRolesImage,
                      title: manageRolesString,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    ActionCard(
                      iconUrl: serviceRequestsIconSvg,
                      title: manageTenantString,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.15),
                    ),
                    ActionCard(
                      iconUrl: serviceRequestsIconSvg,
                      title: manageProgramsString,
                      backgroundColor: AppColors.primaryColor.withOpacity(0.15),
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
