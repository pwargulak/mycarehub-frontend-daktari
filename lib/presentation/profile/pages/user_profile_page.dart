// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/information_list_card.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

// Project imports:
import 'package:healthcloud/application/core/services/utils.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/domain/core/value_objects/app_strings.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';
import 'package:healthcloud/presentation/profile/widgets/user_details_card_widget.dart';

// Project imports:

class UserProfilePage extends StatelessWidget {
  /// [UserProfilePage] is used to display the user information
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyBackgroundColor,
      appBar: const CustomAppBar(
        title: myProfileString,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              mediumVerticalSizedBox,
              const UserDetailsCard(
                clinicName: clinicName,
                emailAddress: emailAddress,
                gender: gender,
                name: name,
                licenseNumber: licenseNumber,
                phoneNumber: phoneNumber,
                profession: profession,
              ),
              mediumVerticalSizedBox,

              /// [userProfileItems] is a list of the UserProfilePage ListTile items
              ...List<Widget>.generate(userProfileItems.length, (int index) {
                final String iconPath =
                    userProfileItems.elementAt(index).iconAssetPath;
                final String title = userProfileItems.elementAt(index).title;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: InformationListCard(
                    title: Text(
                      title,
                      maxLines: 2,
                      style: TextThemes.veryBoldSize14Text(
                        Theme.of(context).primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    iconBackgroundColor: AppColors.profileListCardColor,
                    leadingIcon: Container(
                      width: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        iconPath,
                        width: 20,
                        height: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                );
              }),
              mediumVerticalSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}