import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/search_staff_member_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/search/search_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/client_details/widgets/search_user_item.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class SearchStaffMemberPage extends StatefulWidget {
  const SearchStaffMemberPage();

  @override
  State<SearchStaffMemberPage> createState() => _SearchStaffMemberPageState();
}

class _SearchStaffMemberPageState extends State<SearchStaffMemberPage> {
  final TextEditingController searchController = TextEditingController();
  String staffNumberQuery = '';

  @override
  void initState() {
    super.initState();
    // reset the values in state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        UpdateSearchUserResponseStateAction(
          searchUserResponses: <SearchUserResponse>[],
          noUserFound: false,
          errorSearchingUser: false,
          timeoutSearchingUser: false,
        ),
      );
    });

    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          staffNumberQuery = '';
        });
      } else {
        setState(() {
          staffNumberQuery = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: searchStaffMembersTitle,
        showShadow: false,
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, SearchViewModel>(
        converter: (Store<AppState> store) => SearchViewModel.fromStore(store),
        builder: (BuildContext context, SearchViewModel vm) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const Text(
                          searchStaffMembersDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          maxLines: 1,
                          controller: searchController,
                          hintText: searchStaffMembersHintString,
                          onSubmitted: (_) {
                            if (staffNumberQuery.isNotEmpty) {
                              StoreProvider.dispatch(
                                context,
                                SearchStaffMemberAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  staffNumberQuery: staffNumberQuery,
                                ),
                              );
                            }
                          },
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: IconButton(
                              onPressed: () {
                                if (staffNumberQuery.isNotEmpty) {
                                  StoreProvider.dispatch(
                                    context,
                                    SearchStaffMemberAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      staffNumberQuery: staffNumberQuery,
                                    ),
                                  );
                                }
                              },
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          borderColor: Colors.white,
                          customFillColor: AppColors.galleryColor,
                          onChanged: (String val) {},
                        ),
                        if (vm.wait.isWaitingFor(searchStaffMemberFlag))
                          Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            child: const PlatformLoader(),
                          ),
                        const SizedBox(height: 24),
                        if (vm.searchUserResponses != null &&
                            vm.searchUserResponses!.isNotEmpty &&
                            !vm.wait.isWaitingFor(searchStaffMemberFlag))
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: vm.searchUserResponses!.length,
                            itemBuilder: (_, int index) {
                              final SearchUserResponse staffDetails =
                                  vm.searchUserResponses![index]!;
                              return SearchUserItem(
                                searchUserResponse: staffDetails,
                              );
                            },
                          ),
                        if ((vm.errorFetchingSearchUserResponse ?? false) ||
                            (vm.timeoutFetchingSearchUserResponse ?? false) ||
                            (vm.noUserFound ?? false))
                          GenericErrorWidget(
                            actionKey: const Key('search_not_found_key'),
                            headerIconSvgUrl: searchNotFoundImage,
                            padding: EdgeInsets.zero,
                            recoverCallback: () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.addNewStaffPage);
                            },
                            actionText: registerStaffMemberString,
                            messageTitle: noStaffMemberFoundString,
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: couldNotFindStaffMemberString,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: staffNumberQuery,
                                style: boldSize18Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: confirmStaffMemberIsCorrectString,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
