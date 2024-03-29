// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_svg/flutter_svg.dart';

// Project imports:
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class AppBarNotification extends StatelessWidget {
  const AppBarNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () =>
            Navigator.of(context).pushNamed(AppRoutes.notificationsPage),
        key: appBarNotificationKey,
        borderRadius: BorderRadius.circular(50),
        splashColor: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            notificationSvgIconPath,
            color: Theme.of(context).primaryColor,
            width: 25,
          ),
        ),
      ),
    );
  }
}
