import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';

class ManageProgramsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: programsString,
        showNotificationIcon: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      searchProgramTextString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    mediumVerticalSizedBox,
                    CustomTextField(
                      hintText: searchProgramHintString,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.only(
                          right: 4.0,
                        ),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.search),
                        ),
                      ),
                      borderColor: Colors.white,
                      customFillColor:
                          AppColors.greyTextColor.withOpacity(0.15),
                    ),
                    mediumVerticalSizedBox,
                    Text(
                      mostViewedProgramsString,
                      style: veryBoldSize16Text(AppColors.greyTextColor),
                    ),
                    mediumVerticalSizedBox,
                    const ProgramListItem(
                      title: myCareHubOrgString,
                      subtitle: universityOfNairobiString,
                      description: myCareHubOrgDescriptionString,
                    ),
                    size15VerticalSizedBox,
                    const ProgramListItem(
                      title: FYJ,
                      subtitle: sghiString,
                      description: fYJOrgDescriptionString,
                    ),
                    size15VerticalSizedBox,
                    const Spacer(),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: MyAfyaHubPrimaryButton(
                          borderColor: Colors.transparent,
                          text: createOrganizationString,
                        ),
                      ),
                    ),
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
