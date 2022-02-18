import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:domain_objects/value_objects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:healthcloud/application/core/theme/app_themes.dart';
import 'package:healthcloud/presentation/core/app_bar/custom_app_bar.dart';

class FAQDetailViewPage extends StatelessWidget {
  final FAQContent payload;

  const FAQDetailViewPage({
    Key? key,
    required this.payload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Text(
                payload.title ?? UNKNOWN,
                style: veryBoldSize18Text(Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                payload.description ?? UNKNOWN,
                style: normalSize14Text(AppColors.greyTextColor),
              ),
            ),
            Html(
              data: payload.body,
            ),
          ],
        ),
      ),
    );
  }
}