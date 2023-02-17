import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/roles/widgets/role_list_item_widget.dart';

class SearchRolePage extends StatelessWidget {
  const SearchRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: searchRoles,
        showNotificationIcon: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                searchRoleString,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              CustomTextField(
                maxLines: 1,
                hintText: searchRoleHintString,
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(right: 4.0),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                  ),
                ),
                borderColor: Colors.white,
                customFillColor: AppColors.primaryColor.withOpacity(0.15),
              ),
              largeVerticalSizedBox,
              Text(
                mostUsedRolesString,
                style: boldSize16Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              const RoleListItemWidget(
                description: manageClientsString,
                title: clientManagementString,
              ),
              size15VerticalSizedBox,
              const RoleListItemWidget(
                description: everythingAvailableString,
                title: systemAdministratorString,
              ),
              size15VerticalSizedBox,
              const RoleListItemWidget(
                description: viewAndManageMembersString,
                title: staffManagementString,
              ),
              size15VerticalSizedBox,
              const RoleListItemWidget(
                description: manageAndSendOutSurveysString,
                title: superAdminString,
              ),
              size70VerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
