// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:async_redux/async_redux.dart';
import 'package:prohealth360_daktari/application/redux/actions/deep_link_action.dart';

// Project imports:

class HandleDeepLink extends StatefulWidget {
  const HandleDeepLink({super.key});

  @override
  State<HandleDeepLink> createState() => _HandleDeepLinkState();
}

class _HandleDeepLinkState extends State<HandleDeepLink> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch(context, DeepLinkAction());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const PlatformLoader();
  }
}
