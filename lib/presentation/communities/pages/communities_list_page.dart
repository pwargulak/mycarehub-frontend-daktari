import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_bar.dart';
import 'package:prohealth360_daktari/presentation/core/bottom_nav/bottom_nav_items.dart';

class CommunitiesListPage extends StatelessWidget {
  const CommunitiesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: conversationsTitle,
        showBackButton: false,
      ),
      body: Column(),
      bottomNavigationBar: BottomNavBar(
        bottomNavIndex: BottomNavIndex.communities.index,
      ),
    );
  }
}
