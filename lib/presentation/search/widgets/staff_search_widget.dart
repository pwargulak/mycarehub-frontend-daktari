import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/search/search_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/linked_facilities_widget.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/active_staff_actions.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/search_details_information_widget.dart';

class StaffSearchWidget extends StatefulWidget {
  @override
  State<StaffSearchWidget> createState() => _StaffSearchWidgetState();
}

class _StaffSearchWidgetState extends State<StaffSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StoreConnector<AppState, SearchViewModel>(
        converter: (Store<AppState> store) => SearchViewModel.fromStore(store),
        builder: (BuildContext context, SearchViewModel vm) {
          final SearchUserResponse selectedSearchUserResponse =
              vm.selectedSearchUserResponse!;

          final String name =
              selectedSearchUserResponse.user?.name ?? 'the staff member';

          return (vm.wait.isWaitingFor(searchStaffMemberFlag))
              ? Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const PlatformLoader(),
                )
              : Column(
                  children: <Widget>[
                    SearchDetailsInformationWidget(
                      searchUserResponse: selectedSearchUserResponse,
                      isClient: false,
                    ),
                    smallVerticalSizedBox,
                    const Divider(),
                    smallVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ActiveStaffActions(
                            names: name,
                            isSendLoading:
                                vm.wait.isWaitingFor(inviteStaffFlag),
                            isResendLoading:
                                vm.wait.isWaitingFor(reinviteStaffFlag),
                            searchUserResponse: selectedSearchUserResponse,
                          ),
                          largeVerticalSizedBox,
                          LinkedFacilitiesWidget(
                            userId: selectedSearchUserResponse.id ?? '',
                            userName:
                                selectedSearchUserResponse.user?.name ?? '',
                            defaultFacility:
                                selectedSearchUserResponse.defaultFacility,
                            isClient: false,
                          ),
                          mediumVerticalSizedBox,
                        ],
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
