import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/linked_facilities_widget.dart';
import 'package:prohealth360_daktari/presentation/caregiver/widgets/managed_clients_widget.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class SearchCaregiverDetailsPage extends StatelessWidget {
  final Caregiver caregiver;

  const SearchCaregiverDetailsPage({super.key, required this.caregiver});

  @override
  Widget build(BuildContext context) {
    final String names = caregiver.caregiverUser?.name ?? 'No name';

    final String phoneNumber =
        caregiver.caregiverUser?.primaryContact?.value ?? noNumberAvailable;

    final String caregiverNumber = caregiver.caregiverNumber ?? '';

    final String userName = caregiver.caregiverUser?.userName ?? '';
    final String id = caregiver.caregiverUser?.id ?? '';

    return Scaffold(
      appBar: CustomAppBar(title: caregiver.caregiverUser?.userName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(0.4),
                ),
                child: Center(
                  child: Text(
                    names.trim()[0].toUpperCase(),
                    style: boldSize30Text(AppColors.primaryColor),
                  ),
                ),
              ),
              mediumVerticalSizedBox,
              Text(
                names,
                style: veryBoldSize20Text(AppColors.blackColor),
              ),
              smallVerticalSizedBox,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: caregiverNumberString,
                      style: normalSize15Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: caregiverNumber,
                      style: veryBoldSize16Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              size15VerticalSizedBox,
              Text(
                phoneNumber,
                style: normalSize15Text(AppColors.greyTextColor),
              ),
              size15VerticalSizedBox,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: userNameString,
                      style: normalSize15Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: userName,
                      style: veryBoldSize16Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              largeVerticalSizedBox,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    actions,
                    style: boldSize18Text(AppColors.greyTextColor),
                  ),
                  smallVerticalSizedBox,
                  Text(
                    '1. $appReInviteText',
                    style: boldSize15Text(AppColors.greyTextColor),
                  ),
                  verySmallVerticalSizedBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      tapBelowToInvite(names),
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                  ),
                  smallVerticalSizedBox,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    width: double.infinity,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: sendClientInviteButtonKey,
                      customChild: Text(
                        appReInviteText,
                        style: veryBoldSize15Text(
                          AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  mediumVerticalSizedBox,
                  Text(
                    '2. $appAlternateInvite',
                    style: boldSize15Text(AppColors.greyTextColor),
                  ),
                  verySmallVerticalSizedBox,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Text(
                      tapToResendInvite(names),
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                  ),
                  smallVerticalSizedBox,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    width: double.infinity,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: resendClientInviteButtonKey,
                      customChild: Text(
                        appAlternateInvite,
                        style: veryBoldSize15Text(
                          AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                  largeVerticalSizedBox,
                  ManagedClientsWidget(id: id, userName: userName),
                  if (caregiver.isClient ?? false)
                    LinkedFacilitiesWidget(
                      userId: id,
                      userName: userName,
                    ),
                  largeVerticalSizedBox,
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
