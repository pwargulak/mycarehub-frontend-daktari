import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/search_programs_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/programs_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class ManageProgramsPage extends StatefulWidget {
  const ManageProgramsPage();

  @override
  State<ManageProgramsPage> createState() => _ManageProgramsPageState();
}

class _ManageProgramsPageState extends State<ManageProgramsPage> {
  bool isSearching = false;
  String searchTerm = '';
  final TextEditingController searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch(
        context,
        SearchProgramsAction(
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
          searchTerm: searchTerm,
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
          searchTerm = '';
        });
      } else {
        setState(() {
          isSearching = true;
          searchTerm = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ProgramsStateViewModel>(
      converter: (Store<AppState> store) =>
          ProgramsStateViewModel.fromStore(store),
      builder: (BuildContext context, ProgramsStateViewModel vm) {
        return Scaffold(
          appBar: const CustomAppBar(
            title: programsString,
            showShadow: false,
            showNotificationIcon: true,
          ),
          body: StoreConnector<AppState, ProgramsStateViewModel>(
            converter: (Store<AppState> store) =>
                ProgramsStateViewModel.fromStore(store),
            builder: (BuildContext context, ProgramsStateViewModel vm) {
              if (vm.wait.isWaitingFor(fetchProgramsFlag)) {
                return Container(
                  height: 300,
                  padding: const EdgeInsets.all(20),
                  child: const PlatformLoader(),
                );
              }
              final List<Widget> programsWidgetList = <Widget>[];
              final List<Program> programs = vm.programs;
              if (programs.isNotEmpty) {
                for (final Program program in programs) {
                  programsWidgetList.add(
                    Column(
                      children: <Widget>[
                        ProgramListItem(
                          title: program.name ?? '',
                          subtitle: program.organisation?.name ?? '',
                          description: program.organisation?.description ?? '',
                          onTap: () {
                            StoreProvider.dispatch(
                              context,
                              UpdateProgramsStateAction(
                                selectedProgram: program,
                              ),
                            );
                            Navigator.of(context)
                                .pushNamed(AppRoutes.programDetailPageRoute);
                          },
                        ),
                        size15VerticalSizedBox
                      ],
                    ),
                  );
                }
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              searchProgramTextString,
                              style: normalSize14Text(AppColors.greyTextColor),
                            ),
                            mediumVerticalSizedBox,
                            CustomTextField(
                              controller: searchController,
                              hintText: searchProgramHintString,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(
                                  right: 4.0,
                                ),
                                child: IconButton(
                                  onPressed: () => StoreProvider.dispatch(
                                    context,
                                    SearchProgramsAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      onFailure: (String message) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                connectionLostText,
                                              ),
                                              duration:
                                                  const Duration(seconds: 5),
                                              action: dismissSnackBar(
                                                closeString,
                                                Colors.white,
                                                context,
                                              ),
                                            ),
                                          );
                                      },
                                      searchTerm: searchTerm,
                                    ),
                                  ),
                                  icon: const Icon(Icons.search),
                                ),
                              ),
                              borderColor: Colors.white,
                              customFillColor:
                                  AppColors.greyTextColor.withOpacity(0.15),
                              onSubmitted: (_) => StoreProvider.dispatch(
                                context,
                                SearchProgramsAction(
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
                                  searchTerm: searchTerm,
                                ),
                              ),
                              maxLines: 1,
                            ),
                            mediumVerticalSizedBox,
                            if (programs.isNotEmpty)
                              Text(
                                searchResultsString,
                                style:
                                    veryBoldSize16Text(AppColors.greyTextColor),
                              ),
                            mediumVerticalSizedBox,
                            if (programsWidgetList.isNotEmpty)
                              ...programsWidgetList
                            else if (programs.isEmpty && isSearching)
                              GenericErrorWidget(
                                actionKey: searchNotFoundKey,
                                headerIconSvgUrl: searchNotFoundImage,
                                padding: EdgeInsets.zero,
                                recoverCallback: () {
                                  StoreProvider.dispatch(
                                    context,
                                    SearchProgramsAction(
                                      client: AppWrapperBase.of(context)!
                                          .graphQLClient,
                                      onFailure: (String message) {
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                connectionLostText,
                                              ),
                                              duration:
                                                  const Duration(seconds: 5),
                                              action: dismissSnackBar(
                                                closeString,
                                                Colors.white,
                                                context,
                                              ),
                                            ),
                                          );
                                      },
                                      searchTerm: searchTerm,
                                    ),
                                  );
                                },
                                messageTitle: noProgramFoundText,
                                messageBody: <TextSpan>[
                                  TextSpan(
                                    text: couldNotFindProgramText,
                                    style: normalSize16Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: searchTerm,
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
                            else if (programs.isEmpty && !isSearching)
                              GenericErrorWidget(
                                actionKey: helpNoDataWidgetKey,
                                recoverCallback: () => StoreProvider.dispatch(
                                  context,
                                  SearchProgramsAction(
                                    client: AppWrapperBase.of(context)!
                                        .graphQLClient,
                                    onFailure: (String message) {
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          SnackBar(
                                            content: const Text(
                                              connectionLostText,
                                            ),
                                            duration:
                                                const Duration(seconds: 5),
                                            action: dismissSnackBar(
                                              closeString,
                                              Colors.white,
                                              context,
                                            ),
                                          ),
                                        );
                                    },
                                    searchTerm: searchTerm,
                                  ),
                                ),
                                messageTitle: noAvailableProgramsText,
                                messageBody: <TextSpan>[
                                  TextSpan(
                                    text: noAvailableMemberDescription,
                                    style: normalSize16Text(
                                      AppColors.greyTextColor,
                                    ),
                                  ),
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                    if (programs.isNotEmpty &&
                        !vm.wait.isWaitingFor(fetchProgramsFlag))
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          width: double.infinity,
                          height: 48,
                          child: MyAfyaHubPrimaryButton(
                            buttonKey: createProgramButtonKey,
                            borderColor: Colors.transparent,
                            text: createProgramString,
                            onPressed: () => Navigator.of(context)
                                .pushNamed(AppRoutes.createProgramRoute),
                          ),
                        ),
                      )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
