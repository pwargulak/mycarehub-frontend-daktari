import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';

class OrganizationSelectionPage extends StatelessWidget {
  const OrganizationSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: SvgPicture.asset(chooseOrganizationSvgPath),
                ),
                smallVerticalSizedBox,
                Text(
                  getOrganizationDescriptionString(consumerAppName),
                  style: boldSize22Text(Theme.of(context).primaryColor),
                  textAlign: TextAlign.center,
                ),
                largeVerticalSizedBox,
                GeneralWorkstationWidget(
                  title: universityOfNairobiString,
                  bodyWidget: Text(
                    worldClassHealthString,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  buttonText: continueString,
                ),
                smallVerticalSizedBox,
                GeneralWorkstationWidget(
                  title: consumerAppName,
                  bodyWidget: Text(
                    myCareHubProgramString,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  buttonText: continueString,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
