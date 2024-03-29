import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/search_client_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/search/search_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/client_details/widgets/search_client_item.dart';
import 'package:prohealth360_daktari/presentation/client_details/widgets/search_user_item.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/src/domain/core/entities/identifier.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/user_profile/shared/widget_keys.dart';

class SearchClientPage extends StatefulWidget {
  const SearchClientPage({this.selectMultiple});
  final bool? selectMultiple;

  @override
  State<SearchClientPage> createState() => _SearchClientPageState();
}

class _SearchClientPageState extends State<SearchClientPage> {
  final TextEditingController searchController = TextEditingController();
  List<String> inviteMemberIds = <String>[];
  String cccNumber = '';

  @override
  void initState() {
    super.initState();

    // reset the values in state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        UpdateSearchUserResponseStateAction(
          noUserFound: false,
          errorSearchingUser: false,
          timeoutSearchingUser: false,
          searchUserResponses: <SearchUserResponse>[],
        ),
      );
    });

    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          cccNumber = '';
        });
      } else {
        setState(() {
          cccNumber = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: searchClientsTitle,
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
                          searchClientsDescription,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.greyTextColor,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          maxLines: 1,
                          controller: searchController,
                          hintText: searchClientsHintString,
                          onSubmitted: (_) {
                            if (cccNumber.isNotEmpty) {
                              StoreProvider.dispatch(
                                context,
                                SearchClientAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  searchParameter: cccNumber,
                                ),
                              );
                            }
                          },
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (cccNumber.isNotEmpty) {
                                  StoreProvider.dispatch(
                                    context,
                                    SearchClientAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      searchParameter: cccNumber,
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
                        if (vm.wait.isWaitingFor(searchClientFlag))
                          Container(
                            height: 300,
                            padding: const EdgeInsets.all(20),
                            child: const PlatformLoader(),
                          ),
                        const SizedBox(height: 24),
                        if (vm.searchUserResponses != null &&
                            vm.searchUserResponses!.isNotEmpty &&
                            !vm.wait.isWaitingFor(searchClientFlag))
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: vm.searchUserResponses!.length,
                            itemBuilder: (_, int index) {
                              final SearchUserResponse searchUserResponse =
                                  vm.searchUserResponses![index]!;
                              return (widget.selectMultiple ?? false)
                                  ? SearchClientItem(
                                      searchUserResponse: searchUserResponse,
                                      onTap: () {
                                        final List<SearchUserResponse?>?
                                            selectedUsers = vm.selectedUsers;
                                        List<SearchUserResponse?>
                                            updatedSelectedUsers =
                                            <SearchUserResponse>[];

                                        if (selectedUsers != null) {
                                          if (selectedUsers
                                              .contains(searchUserResponse)) {
                                            updatedSelectedUsers = selectedUsers
                                                .where(
                                                  (
                                                    SearchUserResponse? element,
                                                  ) =>
                                                      element?.identifiers
                                                          ?.firstWhere(
                                                        (Identifier element) =>
                                                            element.type ==
                                                            IdentifierType.CCC,
                                                      ).value !=
                                                      searchUserResponse
                                                          .identifiers
                                                          ?.firstWhere(
                                                        (Identifier element) =>
                                                            element.type ==
                                                            IdentifierType.CCC,
                                                      ).value,
                                                )
                                                .toList();
                                          } else {
                                            updatedSelectedUsers =
                                                <SearchUserResponse?>[
                                              ...selectedUsers,
                                              searchUserResponse
                                            ];
                                          }
                                        }

                                        StoreProvider.dispatch(
                                          context,
                                          UpdateSearchUserResponseStateAction(
                                            selectedUsers: updatedSelectedUsers,
                                          ),
                                        );
                                      },
                                    )
                                  : SearchUserItem(
                                      searchUserResponse: searchUserResponse,
                                      isCCCNumber: true,
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
                                  .pushNamed(AppRoutes.registerClientPage);
                            },
                            actionText: registerClientString,
                            messageTitle: noClientFoundString,
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: couldNotFindClientString,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: cccNumber,
                                style: boldSize18Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: confirmCCCNumberIsCorrectString,
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
              if (widget.selectMultiple ?? false)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.all(
                      24.0,
                    ),
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      key: saveButtonKey,
                      onPressed: (vm.selectedUsers?.isNotEmpty ?? false)
                          ? () => Navigator.pop(context)
                          : null,
                      child: const Text(
                        saveString,
                      ),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
