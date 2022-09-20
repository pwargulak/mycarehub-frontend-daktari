import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/caregiver/widgets/search_caregiver_item.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class SearchCaregiverPage extends StatelessWidget {
  const SearchCaregiverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: searchCaregiversString,
        showShadow: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                searchCaregiverDescriptionString,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
              mediumVerticalSizedBox,
              const CustomTextField(
                hintText: '$searchCaregiverString...',
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                    right: 4.0,
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                  ),
                ),
                borderColor: Colors.white,
                customFillColor: AppColors.galleryColor,
              ),
              mediumVerticalSizedBox,
              const SearchCaregiverItem(
                name: 'Jane Doe',
                caregiverNumber: '9876',
              ),
              const SearchCaregiverItem(
                name: 'Eugene Odhiambo',
                caregiverNumber: '1234',
              ),
              const SearchCaregiverItem(
                name: 'John Doe',
                caregiverNumber: '3456',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
