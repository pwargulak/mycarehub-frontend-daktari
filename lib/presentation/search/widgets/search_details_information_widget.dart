import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';

class SearchDetailsInformationWidget extends StatelessWidget {
  const SearchDetailsInformationWidget({
    required this.searchUserResponse,
    required this.isClient,
  });

  final bool isClient;
  final SearchUserResponse? searchUserResponse;

  @override
  Widget build(BuildContext context) {
    final String names = searchUserResponse?.user?.name ?? 'No name';

    final String phoneNumber =
        searchUserResponse?.user?.primaryContact?.value ?? noNumberAvailable;

    final String number = isClient
        ? '${searchUserResponse?.clientCCCNumber}'
        : '${searchUserResponse?.staffNumber}';

    final String userName = searchUserResponse?.user?.userName ?? '';

    final String defaultFacilityName = searchUserResponse?.facilityName ?? '';

    return Column(
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
                text: isClient ? 'CCC# ' : 'Staff number: ',
                style: normalSize15Text(AppColors.greyTextColor),
              ),
              TextSpan(
                text: number,
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
                text: 'Username: ',
                style: normalSize15Text(AppColors.greyTextColor),
              ),
              TextSpan(
                text: userName,
                style: veryBoldSize16Text(AppColors.greyTextColor),
              ),
            ],
          ),
        ),
        size15VerticalSizedBox,
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Facility: ',
                style: normalSize15Text(AppColors.greyTextColor),
              ),
              TextSpan(
                text: defaultFacilityName,
                style: veryBoldSize16Text(AppColors.greyTextColor),
              ),
            ],
          ),
        ),
        size15VerticalSizedBox,
        if (isClient)
          MyAfyaHubPrimaryButton(
            text: updateProfileString,
            buttonKey: updateProfileButtonKey,
            textColor: Theme.of(context).primaryColor,
            buttonColor: Theme.of(context).primaryColor.withOpacity(0.3),
            borderColor: Colors.transparent,
            customPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            onPressed: () => Navigator.of(context).pushNamed(
              AppRoutes.editClientProfilePage,
              arguments: searchUserResponse,
            ),
          )
      ],
    );
  }
}
