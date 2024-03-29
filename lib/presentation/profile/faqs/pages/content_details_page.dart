// Package imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';

import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class ContentDetailPage extends StatelessWidget {
  const ContentDetailPage({super.key, required this.payload});
  final ContentDetails payload;

  @override
  Widget build(BuildContext context) {
    return ContentDetailWidget(
      payload: payload,
      galleryImageCallback: () {
        if (payload.content.galleryImages != null &&
            payload.content.galleryImages!.length > 3) {
          Navigator.of(context).pushNamed(
            AppRoutes.galleryImagesPage,
            arguments: payload.content.galleryImages,
          );
        }
      },
      onCloseCallback: () => Navigator.of(context).pop(),
    );
  }
}
