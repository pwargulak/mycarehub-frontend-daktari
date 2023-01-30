import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/organization_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

class ManageOrganizationPage extends StatelessWidget {
  const ManageOrganizationPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: manageOrganizationString,
        showNotificationIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                searchOrganizationTextString,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              CustomTextField(
                hintText: searchOrganizationHintString,
                suffixIcon: const Padding(
                  padding: EdgeInsets.only(
                    right: 4.0,
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                  ),
                ),
                borderColor: Colors.white,
                customFillColor: AppColors.primaryColor.withOpacity(0.15),
              ),
              mediumVerticalSizedBox,
              Text(
                mostViewedOrganizationString,
                style: boldSize16Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              const OrganizationListItem(
                title: sghiString,
                description: SGHIOrgDetailString,
              ),
              size15VerticalSizedBox,
              const OrganizationListItem(
                title: myCareHubOrgString,
                description: myCareHubOrgDescriptionString,
              ),
              size15VerticalSizedBox,
              const OrganizationListItem(
                title: kemriString,
                description: kemriDescriptionString,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        height: 48,
        child: MyAfyaHubPrimaryButton(
          borderColor: Colors.transparent,
          text: createOrganizationString,
          buttonKey: createOrganizationButtonKey,
          onPressed: () {
            Navigator.of(context).pushNamed(AppRoutes.createOrganizationRoute);
          },
        ),
      ),
    );
  }
}
