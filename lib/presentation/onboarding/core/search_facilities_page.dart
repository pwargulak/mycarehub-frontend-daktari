import 'package:prohealth360_daktari/application/redux/actions/facilities/add_facility_to_staff_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/add_facility_to_program_action.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/add_facility_to_client_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/search_facilities_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/register_client/fetch_facilities_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/facility_list_item.dart';
import 'package:sghi_core/shared_themes/constants.dart';

class SearchFacilitiesPage extends StatefulWidget {
  final String? userID;
  final bool? isClient;
  final String? programId;
  final bool searchFromProgram;

  const SearchFacilitiesPage({
    super.key,
    this.userID,
    this.isClient,
    this.programId,
    this.searchFromProgram = true,
  });
  @override
  State<SearchFacilitiesPage> createState() => _SearchFacilitiesPageState();
}

class _SearchFacilitiesPageState extends State<SearchFacilitiesPage> {
  Facility selectedFacility = Facility.initial();
  bool isSearching = false;
  String facilitySearchCode = '';
  final TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        SearchFacilitiesAction(
          searchFromProgram: widget.searchFromProgram,
          client: AppWrapperBase.of(context)!.graphQLClient,
          onFailure: (String message) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: const Text(connectionLostText),
                  duration: const Duration(seconds: 5),
                  action: dismissSnackBar(closeString, Colors.white, context),
                ),
              );
          },
          mflCode: facilitySearchCode,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          isSearching = false;
          facilitySearchCode = '';
        });
      } else {
        setState(() {
          isSearching = true;
          facilitySearchCode = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: searchFacilitiesString,
        showShadow: false,
        showNotificationIcon: true,
      ),
      body: StoreConnector<AppState, ListFacilitiesViewModel>(
        converter: (Store<AppState> store) =>
            ListFacilitiesViewModel.fromStore(store),
        builder: (BuildContext context, ListFacilitiesViewModel vm) {
          if (vm.wait.isWaitingFor(fetchFacilitiesFlag) ||
              vm.wait.isWaitingFor(fetchFacilitiesFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          }

          final List<Facility> facilities = vm.facilities ?? <Facility>[];
          final bool isSelectionValid =
              (selectedFacility.name?.isNotEmpty ?? false) &&
                  selectedFacility.name != UNKNOWN;

          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          searchFacilityPageDescription,
                          style: normalSize14Text(AppColors.greyTextColor),
                          textAlign: TextAlign.center,
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          maxLines: 1,
                          controller: searchController,
                          hintText: '$searchFacilitiesString...',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              onPressed: () => StoreProvider.dispatch(
                                context,
                                SearchFacilitiesAction(
                                  searchFromProgram: widget.searchFromProgram,
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  onFailure: (String message) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            connectionLostText,
                                          ),
                                          duration: const Duration(seconds: 5),
                                          action: dismissSnackBar(
                                            closeString,
                                            Colors.white,
                                            context,
                                          ),
                                        ),
                                      );
                                  },
                                  mflCode: facilitySearchCode,
                                ),
                              ),
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          borderColor: Colors.white,
                          customFillColor: AppColors.galleryColor,
                          onChanged: (_) {},
                          onSubmitted: (_) => StoreProvider.dispatch(
                            context,
                            SearchFacilitiesAction(
                              searchFromProgram: widget.searchFromProgram,
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              onFailure: (String message) {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        connectionLostText,
                                      ),
                                      duration: const Duration(seconds: 5),
                                      action: dismissSnackBar(
                                        closeString,
                                        Colors.white,
                                        context,
                                      ),
                                    ),
                                  );
                              },
                              mflCode: facilitySearchCode,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        if (facilities.isNotEmpty) ...<Widget>{
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: facilities.length,
                            itemBuilder: (_, int index) {
                              final Facility currentFacility =
                                  facilities[index];
                              return FacilityListItem(
                                facility: currentFacility,
                                onClicked: () => setState(() {
                                  selectedFacility = currentFacility;
                                }),
                                isSelected: isSelectionValid &&
                                    selectedFacility.name ==
                                        currentFacility.name,
                              );
                            },
                          ),
                        } else if (facilities.isEmpty &&
                            isSearching) ...<Widget>{
                          GenericErrorWidget(
                            actionKey: searchNotFoundKey,
                            headerIconSvgUrl: searchNotFoundImage,
                            padding: EdgeInsets.zero,
                            recoverCallback: () {
                              StoreProvider.dispatch(
                                context,
                                SearchFacilitiesAction(
                                  searchFromProgram: widget.searchFromProgram,
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  onFailure: (String message) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        SnackBar(
                                          content: const Text(
                                            connectionLostText,
                                          ),
                                          duration: const Duration(seconds: 5),
                                          action: dismissSnackBar(
                                            closeString,
                                            Colors.white,
                                            context,
                                          ),
                                        ),
                                      );
                                  },
                                  mflCode: facilitySearchCode,
                                ),
                              );
                            },
                            messageTitle: noFacilityFoundText,
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: couldNotFindFacilityText,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: facilitySearchCode,
                                style: boldSize18Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: confirmTheCodeIsCorrectText,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              )
                            ],
                          )
                        } else if (facilities.isEmpty && !isSearching)
                          GenericErrorWidget(
                            actionKey: helpNoDataWidgetKey,
                            recoverCallback: () {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      connectionLostText,
                                    ),
                                    duration: const Duration(seconds: 5),
                                    action: dismissSnackBar(
                                      closeString,
                                      Colors.white,
                                      context,
                                    ),
                                  ),
                                );
                            },
                            messageTitle:
                                getNoDataTile(noAvailableFacilitiesText),
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: noAvailableMemberDescription,
                                style:
                                    normalSize16Text(AppColors.greyTextColor),
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
              if (facilities.isNotEmpty &&
                  !vm.wait.isWaitingFor(fetchFacilitiesFlag))
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                    child: SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: vm.wait.isWaitingFor(addFacilityFlag)
                          ? const PlatformLoader()
                          : ElevatedButton(
                              key: saveFacilityBtnKey,
                              onPressed: !isSelectionValid
                                  ? null
                                  : (vm.updateFacility ?? false)
                                      ? () {
                                          addFacility();
                                        }
                                      : () {
                                          StoreProvider.dispatch<AppState>(
                                            context,
                                            BatchUpdateMiscStateAction(
                                              selectedFacility:
                                                  selectedFacility,
                                            ),
                                          );
                                          if (Navigator.canPop(context)) {
                                            Navigator.pop(context);
                                          }
                                        },
                              child: const Text(saveString),
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

  void addFacility() {
    if (widget.isClient ?? false) {
      StoreProvider.dispatch<AppState>(
        context,
        AddFacilityToClientProfileAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          onFailure: (String message) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                  ),
                  duration: const Duration(
                    seconds: 5,
                  ),
                  action: dismissSnackBar(
                    closeString,
                    Colors.white,
                    context,
                  ),
                ),
              );
          },
          onSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  addFacilitySuccessString,
                ),
                duration: Duration(
                  seconds: kShortSnackBarDuration,
                ),
              ),
            );
            Navigator.pop(context);
          },
          clientId: widget.userID ?? '',
          facilityId: selectedFacility.id ?? '',
        ),
      );
    } else if (widget.userID?.isNotEmpty ?? false) {
      StoreProvider.dispatch<AppState>(
        context,
        AddFacilityToStaffProfileAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          onFailure: (String message) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                  ),
                  duration: const Duration(
                    seconds: 5,
                  ),
                  action: dismissSnackBar(
                    closeString,
                    Colors.white,
                    context,
                  ),
                ),
              );
          },
          onSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  addFacilitySuccessString,
                ),
                duration: Duration(
                  seconds: kShortSnackBarDuration,
                ),
              ),
            );
            Navigator.pop(context);
          },
          staffId: widget.userID ?? '',
          facilityId: selectedFacility.id ?? '',
        ),
      );
    } else if (widget.programId?.isNotEmpty ?? false) {
      StoreProvider.dispatch<AppState>(
        context,
        AddFacilityToProgramAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          onFailure: (String message) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                  ),
                  duration: const Duration(seconds: 5),
                  action: dismissSnackBar(closeString, Colors.white, context),
                ),
              );
          },
          onSuccess: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  addFacilitySuccessString,
                ),
                duration: Duration(
                  seconds: kShortSnackBarDuration,
                ),
              ),
            );
            Navigator.pop(context);
          },
          programId: widget.programId ?? '',
          facilityId: selectedFacility.id ?? '',
        ),
      );
    }
  }
}
