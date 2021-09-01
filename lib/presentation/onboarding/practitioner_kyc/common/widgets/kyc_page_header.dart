import 'package:flutter/material.dart';
import 'package:shared_themes/spaces.dart';
import 'package:shared_themes/text_themes.dart';

class KYCPageHeader extends StatelessWidget {
  final String title;
  final int currentStep;
  final int totalSteps;
  const KYCPageHeader({
    required this.title,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                TextSpan(
                  style: TextThemes.boldSize14Text(),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'STEP $currentStep ',
                        style: TextThemes.boldSize14Text(
                            Theme.of(context).accentColor)),
                    TextSpan(text: '/ $totalSteps'),
                  ],
                ),
              ),
              smallVerticalSizedBox,
              Text(
                title,
                style: TextThemes.heavySize16Text(Colors.black),
              ),
              smallVerticalSizedBox,
              Container(
                width: 100,
                height: 2,
                color: Theme.of(context).accentColor.withOpacity(0.8),
              )
            ],
          ),
        ),
      ],
    );
  }
}