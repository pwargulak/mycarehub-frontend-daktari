// ignore_for_file: avoid_dynamic_calls, use_build_context_synchronously

import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/invite_users_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/communities/search_group_members_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/communities/search_page_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/communities/widgets/user_list_item_widget.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/communities/models/room.dart';
import 'package:sghi_core/communities/models/user.dart';

class InviteUsersPage extends StatelessWidget {
  InviteUsersPage({super.key, required this.room});

  final Room room;

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: const EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child: const Center(child: Text(inviteMembersString)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        children: <Widget>[
          const Text(searchMembersInstructionString),

          const SizedBox(height: 20),

          /// Search input
          TextField(
            key: searchMembersInputKey,
            decoration: InputDecoration(
              labelText: 'Search users',
              hintText: 'Search users',
              contentPadding: const EdgeInsets.only(left: 20, bottom: 32),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.purple,
              ),
            ),
            controller: searchController,
            onChanged: (String value) async {
              if (value.isNotEmpty && value.length >= 3) {
                StoreProvider.dispatch<AppState>(
                  context,
                  SearchMembersAction(
                    searchParam: value,
                    client: AppWrapperBase.of(context)!.graphQLClient,
                  ),
                );
              }
            },
          ),

          const SizedBox(height: 20),

          ///
          /// List search results
          StoreConnector<AppState, SearchPageViewModel>(
            converter: (Store<AppState> store) {
              return SearchPageViewModel.fromStore(store);
            },
            builder: (BuildContext context, SearchPageViewModel vm) {
              final List<User>? users = vm.searchMemberResults;

              if (vm.searchMemberResults?.isEmpty ?? true) {
                return const Center(child: Text(noMembersString));
              }

              if (vm.wait?.isWaitingFor(searchRoomMembersFlag) ?? false) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: users?.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final User currentUser = users![index];

                  return UserListItem(
                    key: Key(currentUser.userID ?? ''),
                    name: currentUser.displayName ?? noNameString,
                    userID: currentUser.userID ?? '',
                    roomID: '',
                    onTap: () async {
                      StoreProvider.dispatch<AppState>(
                        context,
                        InviteUserAction(
                          roomID: room.roomID!,
                          userID: currentUser.userID!,
                          client: AppWrapperBase.of(context)!.graphQLClient,
                          onSuccess: () {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${currentUser.displayName} $hasBeenInvitedSuccessfullyString',
                                  ),
                                ),
                              );

                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
