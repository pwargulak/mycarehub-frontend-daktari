import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/search_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/update_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/caregiver/caregiver_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/caregiver/widgets/search_caregiver_item.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';

class SearchCaregiverPage extends StatefulWidget {
  const SearchCaregiverPage({super.key});

  @override
  State<SearchCaregiverPage> createState() => _SearchCaregiverPageState();
}

class _SearchCaregiverPageState extends State<SearchCaregiverPage> {
  final TextEditingController searchController = TextEditingController();
  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: searchCaregiversString,
        showShadow: false,
      ),
      body: StoreConnector<AppState, CaregiverViewModel>(
        onInit: (Store<AppState> store) {
          store.dispatch(
            UpdateCaregiverAction(
              errorFetchingCaregivers: false,
              noCaregiversFound: false,
              caregivers: <Caregiver>[],
            ),
          );
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
        },
        converter: (Store<AppState> store) =>
            CaregiverViewModel.fromStore(store),
        builder: (BuildContext context, CaregiverViewModel vm) {
          final List<Widget> caregiversList = <Widget>[];
          if (vm.caregivers?.isNotEmpty ?? false) {
            for (final Caregiver? caregiver in vm.caregivers!) {
              caregiversList.add(
                SearchCaregiverItem(
                  name: caregiver?.caregiverUser?.userName ?? '',
                  phoneNumber:
                      caregiver?.caregiverUser?.primaryContact?.value ?? '',
                ),
              );
            }
          }
          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    searchCaregiverDescriptionString,
                    style: normalSize14Text(AppColors.greyTextColor),
                  ),
                  mediumVerticalSizedBox,
                  CustomTextField(
                    controller: searchController,
                    hintText: '$searchCaregiverString...',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(
                        right: 4.0,
                      ),
                      child: IconButton(
                        onPressed: searchTerm.isNotEmpty
                            ? () => searchCaregiver()
                            : null,
                        icon: const Icon(Icons.search),
                      ),
                    ),
                    borderColor: Colors.white,
                    customFillColor: AppColors.galleryColor,
                    onSubmitted:
                        searchTerm.isNotEmpty ? (_) => searchCaregiver() : null,
                  ),
                  mediumVerticalSizedBox,
                  if (vm.wait.isWaitingFor(searchCaregiverFlag))
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 50.0,
                      ),
                      child: PlatformLoader(),
                    )
                  else if (caregiversList.isNotEmpty)
                    ...caregiversList
                  else if (searchTerm.isNotEmpty && vm.noCaregiversFound)
                    GenericErrorWidget(
                      showPrimaryButton: false,
                      headerIconSvgUrl: searchNotFoundImage,
                      padding: EdgeInsets.zero,
                      recoverCallback: null,
                      messageTitle: noCaregiverFoundString,
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: couldNotFindCaregiverString,
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
                          text: confirmSearchTermIsCorrectString,
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void searchCaregiver() {
    StoreProvider.dispatch(
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
    );
  }
}
