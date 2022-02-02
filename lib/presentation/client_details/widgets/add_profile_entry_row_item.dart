// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:afya_moja_core/custom_text_field.dart';

// Project imports:
import 'package:healthcloud/application/core/theme/app_themes.dart';

class AddProfileEntryRowItem extends StatelessWidget {
  /// [AddProfileEntryRowItem] is a shared widget used in [addNewProfileEntryBottomSheet]
  ///
  ///It takes in required [leadingText] and [trailingText] parameters
  ///
  const AddProfileEntryRowItem({
    required this.leadingText,
    required this.trailingText,
  });
  final String leadingText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: (MediaQuery.of(context).size.width / 2) - 40,
          child: CustomTextField(
            labelText: leadingText,
            customFillColor: AppColors.galleryColor,
          ),
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.width / 2) - 40,
          child: CustomTextField(
            labelText: trailingText,
            customFillColor: AppColors.galleryColor,
          ),
        ),
      ],
    );
  }
}