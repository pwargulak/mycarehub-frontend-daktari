// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

class ActionCard extends StatelessWidget {
  ///
  /// [ActionCard] provides a clickable card to perform the action displayed.
  ///
  final String iconUrl;
  final String title;
  final int count;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const ActionCard({
    super.key,
    this.count = 0,
    required this.iconUrl,
    required this.title,
    this.onTap,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width / 2) - 60;
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SvgPicture.asset(
                        iconUrl,
                        height: width - 8,
                      ),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      title,
                      style: boldSize15Text(),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                  ],
                ),
              ),
            ),
          ),
          if (count > 0)
            Positioned(
              right: 20,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                constraints: const BoxConstraints(
                  minWidth: 28,
                  minHeight: 28,
                ),
                child: Align(
                  child: Text(
                    '$count',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
