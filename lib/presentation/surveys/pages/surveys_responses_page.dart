import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class SurveyResponsesPage extends StatelessWidget {
  const SurveyResponsesPage({Key? key, required this.appBarTitle})
      : super(key: key);

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appBarTitle, showNotificationIcon: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GenericErrorWidget(
                headerIconSvgUrl: contentZeroStateImageUrl,
                actionKey: helpNoDataWidgetKey,
                messageTitle: noResponsesTitle,
                messageBody: <TextSpan>[
                  TextSpan(
                    text: noResponsesDescription,
                    style: normalSize16Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                ],
                recoverCallback: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.surveysPage,
                  );
                },
                actionText: thanksText,
              )
            ],
          ),
        ),
      ),
    );
  }
}
