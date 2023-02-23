import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class AcceptGroupInvitesPage extends StatelessWidget {
  const AcceptGroupInvitesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: acceptGroupInvites),
      body: Column(),
    );
  }
}
