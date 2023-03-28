import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/client_search_widget.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/staff_search_widget.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class SearchPageDetailView extends StatefulWidget {
  const SearchPageDetailView({
    this.searchUserResponse,
    this.isClient = true,
  });

  final SearchUserResponse? searchUserResponse;
  final bool isClient;

  @override
  State<SearchPageDetailView> createState() => _SearchPageDetailViewState();
}

class _SearchPageDetailViewState extends State<SearchPageDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.searchUserResponse?.user?.userName),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child:
            widget.isClient ? const ClientSearchWidget() : StaffSearchWidget(),
      ),
    );
  }
}
