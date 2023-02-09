import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/organizations/search_organisations_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/organizations/update_organisations_state_action.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/organisations_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/organisation_list_item.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class SearchOrganisationsPage extends StatefulWidget {
  const SearchOrganisationsPage({super.key});
  @override
  State<SearchOrganisationsPage> createState() =>
      _SearchOrganisationsPageState();
}

class _SearchOrganisationsPageState extends State<SearchOrganisationsPage> {
  Organisation selectedOrganisation = Organisation.initial();
  bool isSearching = false;
  String organisationSearchCode = '';
  final TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        SearchOrganisationsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          query: organisationSearchCode,
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
          organisationSearchCode = '';
        });
      } else {
        setState(() {
          isSearching = true;
          organisationSearchCode = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: searchOrganisationsString,
        showShadow: false,
      ),
      body: StoreConnector<AppState, OrganisationsStateViewModel>(
        converter: (Store<AppState> store) =>
            OrganisationsStateViewModel.fromStore(store),
        builder: (BuildContext context, OrganisationsStateViewModel vm) {
          if (vm.wait.isWaitingFor(fetchOrganisationsFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          }

          final List<Organisation> organisations =
              vm.organisations ?? <Organisation>[];

          final bool isSelectionValid =
              (selectedOrganisation.name?.isNotEmpty ?? false) &&
                  selectedOrganisation.name != UNKNOWN;

          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          searchOrganisationPageDescription,
                          style: normalSize14Text(AppColors.greyTextColor),
                          textAlign: TextAlign.center,
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          controller: searchController,
                          hintText: '$searchOrganisationsString...',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              onPressed: () => StoreProvider.dispatch(
                                context,
                                SearchOrganisationsAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  query: organisationSearchCode,
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
                            SearchOrganisationsAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              query: organisationSearchCode,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        if (organisations.isNotEmpty) ...<Widget>{
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: organisations.length,
                            itemBuilder: (_, int index) {
                              final Organisation currentOrganisation =
                                  organisations[index];
                              return OrganisationListItem(
                                organisation: currentOrganisation,
                                onClicked: () => setState(() {
                                  selectedOrganisation = currentOrganisation;
                                }),
                                isSelected: isSelectionValid &&
                                    selectedOrganisation.name ==
                                        currentOrganisation.name,
                              );
                            },
                          ),
                        } else if (organisations.isEmpty &&
                            isSearching) ...<Widget>{
                          GenericErrorWidget(
                            actionKey: searchNotFoundKey,
                            headerIconSvgUrl: searchNotFoundImage,
                            padding: EdgeInsets.zero,
                            recoverCallback: () {
                              StoreProvider.dispatch(
                                context,
                                SearchOrganisationsAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  query: organisationSearchCode,
                                ),
                              );
                            },
                            messageTitle: noOrganizationFoundText,
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: couldNotFindOrganizationText,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: organisationSearchCode,
                                style: boldSize18Text(
                                  AppColors.greyTextColor,
                                ),
                              ),
                              TextSpan(
                                text: confirmTheNameIsCorrectText,
                                style: normalSize16Text(
                                  AppColors.greyTextColor,
                                ),
                              )
                            ],
                          )
                        } else if (organisations.isEmpty && !isSearching)
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
              if (organisations.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: vm.wait.isWaitingFor(createProgramFlag)
                          ? const PlatformLoader()
                          : ElevatedButton(
                              key: saveOrganisationBtnKey,
                              onPressed: !isSelectionValid
                                  ? null
                                  : () {
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        UpdateOrganisationsStateAction(
                                          selectedOrganisation:
                                              selectedOrganisation,
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
}
