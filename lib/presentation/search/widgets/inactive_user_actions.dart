import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/phase_two/presentation/search/widgets/client_search_widget.dart';

class InActiveUserActions extends StatelessWidget {
  const InActiveUserActions({
    super.key,
    required this.names,
    required this.isLoading,
    required this.searchUserResponse,
  });

  final bool isLoading;
  final String? names;
  final SearchUserResponse searchUserResponse;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          deactivatedUserString,
          style: boldSize18Text(AppColors.greyTextColor),
        ),
        smallVerticalSizedBox,
        Text(
          '$names $deactivatedUserPageDescriptionString',
          style: normalSize14Text(AppColors.greyTextColor),
        ),
        mediumVerticalSizedBox,
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          width: double.infinity,
          child: isLoading
              ? const PlatformLoader()
              : MyAfyaHubPrimaryButton(
                  buttonKey: reactivateUserButtonKey,
                  customChild: Text(
                    reactivateUserString,
                    style: veryBoldSize15Text(
                      AppColors.whiteColor,
                    ),
                  ),
                  onPressed: () => clientSearchAction(
                    context: context,
                    selectedSearchUserResponse: searchUserResponse,
                  ),
                ),
        ),
        mediumVerticalSizedBox,
      ],
    );
  }
}
