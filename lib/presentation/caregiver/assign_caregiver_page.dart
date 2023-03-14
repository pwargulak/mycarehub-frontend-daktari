import 'package:prohealth360_daktari/application/redux/actions/caregiver/assign_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/search_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/view_models/caregiver/caregiver_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/assigned_caregiver.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/presentation/caregiver/widgets/search_caregiver_item.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class AssignCaregiverPage extends StatefulWidget {
  const AssignCaregiverPage({super.key, required this.clientId});
  final String clientId;
  @override
  State<AssignCaregiverPage> createState() => _AssignCaregiverPageState();
}

class _AssignCaregiverPageState extends State<AssignCaregiverPage> {
  Caregiver selectedCaregiver = Caregiver.initial();
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();
  String searchTerm = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(() async {
      if (searchController.text.isEmpty) {
        setState(() {
          searchTerm = '';
        });
      } else {
        setState(() {
          searchTerm = searchController.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: searchCaregiversString,
        showShadow: false,
      ),
      body: StoreConnector<AppState, CaregiverViewModel>(
        converter: (Store<AppState> store) =>
            CaregiverViewModel.fromStore(store),
        builder: (BuildContext context, CaregiverViewModel vm) {
          if (vm.wait.isWaitingFor(searchCaregiverFlag)) {
            return Container(
              height: 300,
              padding: const EdgeInsets.all(20),
              child: const PlatformLoader(),
            );
          }

          final List<Caregiver?> caregivers = vm.caregivers ?? <Caregiver>[];

          final bool isSelectionValid =
              (selectedCaregiver.caregiverUser?.userName?.isNotEmpty ??
                      false) &&
                  selectedCaregiver.caregiverUser?.userName != UNKNOWN;

          return Column(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text(
                          searchCaregiverDescriptionString,
                          style: normalSize14Text(AppColors.greyTextColor),
                          textAlign: TextAlign.center,
                        ),
                        mediumVerticalSizedBox,
                        CustomTextField(
                          maxLines: 1,
                          controller: searchController,
                          hintText: '$searchCaregiverString...',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 4.0,
                            ),
                            child: IconButton(
                              onPressed: () => StoreProvider.dispatch(
                                context,
                                SearchCaregiversAction(
                                  client:
                                      AppWrapperBase.of(context)!.graphQLClient,
                                  onFailure: (_) =>
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
                                        ),
                                  searchTerm: searchTerm,
                                ),
                              ),
                              icon: const Icon(Icons.search),
                            ),
                          ),
                          borderColor: Colors.white,
                          customFillColor: AppColors.galleryColor,
                          onSubmitted: (_) => StoreProvider.dispatch(
                            context,
                            SearchCaregiversAction(
                              client: AppWrapperBase.of(context)!.graphQLClient,
                              onFailure: (_) => ScaffoldMessenger.of(context)
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
                                ),
                              searchTerm: searchTerm,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        if (caregivers.isNotEmpty) ...<Widget>{
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: caregivers.length,
                            itemBuilder: (_, int index) {
                              final Caregiver currentCaregiver =
                                  caregivers[index]!;
                              return SearchCaregiverItem(
                                name:
                                    currentCaregiver.caregiverUser?.userName ??
                                        '',
                                phoneNumber: currentCaregiver
                                        .caregiverUser?.primaryContact?.value ??
                                    '',
                                onTapCallback: () => setState(() {
                                  selectedCaregiver = currentCaregiver;
                                }),
                                isSelected: isSelectionValid &&
                                    selectedCaregiver.caregiverUser?.userName ==
                                        currentCaregiver
                                            .caregiverUser?.userName,
                              );
                            },
                          ),
                        } else if (caregivers.isEmpty && !isSearching) ...<Widget> {
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
                                getNoDataTile(noCaregiverFoundString),
                            messageBody: <TextSpan>[
                              TextSpan(
                                text: couldNotFindCaregiverString,
                                style:
                                    normalSize16Text(AppColors.greyTextColor),
                              ),
                            ],
                          ),
                        }
                      ],
                    ),
                  ),
                ),
              ),
              if (caregivers.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, right: 10, left: 10),
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: vm.wait.isWaitingFor(searchCaregiverFlag)
                          ? const PlatformLoader()
                          : ElevatedButton(
                              key: saveCaregiverBtnKey,
                              onPressed: isSelectionValid
                                  ? () {
                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        AssignCaregiverAction(
                                          assignedCaregiver: AssignedCaregiver(
                                            clientID: widget.clientId,
                                            caregiverID: selectedCaregiver.id,
                                            caregiverType:
                                                CaregiverType.SIBLING,
                                          ),
                                          client: AppWrapperBase.of(context)!
                                              .graphQLClient,
                                          onSuccess: () {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  assignCaregiverSuccess,
                                                ),
                                                duration: Duration(seconds: 5),
                                              ),
                                            );

                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      );
                                      if (Navigator.canPop(context)) {
                                        Navigator.pop(context);
                                      }
                                    }
                                  : null,
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
