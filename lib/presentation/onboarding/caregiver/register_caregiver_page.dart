import 'package:prohealth360_daktari/application/redux/view_models/connectivity_view_model.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/register_caregiver_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_search_user_response_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/search/search_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_facility_field.dart';
import 'package:prohealth360_daktari/presentation/onboarding/caregiver/register_caregiver_form_manager.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/list_card_with_cancel_button.dart';

class RegisterCaregiverPage extends StatefulWidget {
  const RegisterCaregiverPage({super.key});

  @override
  State<RegisterCaregiverPage> createState() => _RegisterCaregiverPageState();
}

class _RegisterCaregiverPageState extends State<RegisterCaregiverPage> {
  final RegisterCaregiverFormManager _formManager =
      RegisterCaregiverFormManager();

  final TextEditingController dobTextController = TextEditingController();

  final InputDecoration dropdownDecoration = InputDecoration(
    filled: true,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add new caregiver',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  addNewUserIconSvg,
                  height: 180,
                ),
                mediumVerticalSizedBox,
                const SearchFacilityField(),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // First name
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.firstName,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: firstNameKey,
                            label: firstNameLabel,
                            onChanged: (String value) {
                              _formManager.inFirstName.add(value);
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Last name
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.lastName,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: lastNameKey,
                            label: lastNameLabel,
                            onChanged: (String value) {
                              _formManager.inLastName.add(value);
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Username
                Row(
                  children: <Widget>[
                    Flexible(
                      child: StreamBuilder<String>(
                        stream: _formManager.username,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<String> snapshot,
                        ) {
                          return PatientDetailsTextFormField(
                            textFieldKey: usernameFieldKey,
                            label: usernameLabel,
                            onChanged: (String value) {
                              _formManager.inUsername.add(value);
                            },
                            validator: (String? value) {
                              if (snapshot.hasError) {
                                return (snapshot.error! as UserException).msg;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // Birth date
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              birthDateLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          DatePickerField(
                            allowCurrentYear: true,
                            gestureDateKey: dobKey,
                            controller: dobTextController,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                            style:
                                const TextStyle(color: AppColors.greyTextColor),
                            onChanged: (String? value) {
                              if (value != null) {
                                final DateTime date =
                                    DateFormat(datePickerFormat)
                                        .parseLoose(value);
                                _formManager.inDateOfBirth.add(date);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Gender dropdown
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              genderLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          StreamBuilder<Gender>(
                            stream: _formManager.gender,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<Gender> snapshot,
                            ) {
                              final Gender? data = snapshot.data;
                              return SelectOptionField(
                                decoration: dropdownDecoration,
                                dropDownInputKey: genderOptionFieldKey,
                                value: data == null
                                    ? capitalizeFirst(
                                        describeEnum(Gender.other),
                                      )
                                    : capitalizeFirst(data.name),
                                options: getGenderList(),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _formManager.inGender
                                        .add(genderFromJson(value));
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    phoneNumberString,
                    style: normalSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                ),
                smallVerticalSizedBox,
                StreamBuilder<String>(
                  stream: _formManager.phoneNumber,
                  builder: (
                    BuildContext context,
                    AsyncSnapshot<String> snapshot,
                  ) {
                    return MyAfyaHubPhoneInput(
                      textFormFieldKey: patientNumberField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8.0),
                      ),
                      style: const TextStyle(color: AppColors.greyTextColor),
                      onChanged: (String? value) {
                        if (value != null) {
                          _formManager.inPhoneNumber.add(value);
                        }
                      },
                      phoneNumberFormatter: formatPhoneNumber,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    );
                  },
                ),
                mediumVerticalSizedBox,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          addCaregiverDescriptionString,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      StoreConnector<AppState, SearchViewModel>(
                        onInit: (Store<AppState> store) {
                          StoreProvider.dispatch(
                            context,
                            UpdateSearchUserResponseStateAction(
                              selectedUsers: <SearchUserResponse>[],
                            ),
                          );
                        },
                        converter: (Store<AppState> store) =>
                            SearchViewModel.fromStore(store),
                        builder: (BuildContext context, SearchViewModel vm) {
                          final List<Widget> clientWidgets = <Widget>[];
                          if (vm.selectedUsers?.isNotEmpty ?? false) {
                            for (final SearchUserResponse? clientItem
                                in vm.selectedUsers!) {
                              clientWidgets.add(
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: ListCardWithCancelButton(
                                    title: clientItem?.user?.name ?? '',
                                    description:
                                        '$cccNoShortText ${clientItem?.clientCCCNumber}',
                                    onCancelCallback: () {
                                      final List<SearchUserResponse?>
                                          updatedSelectedUsers =
                                          vm.selectedUsers!
                                              .where(
                                                (
                                                  SearchUserResponse? element,
                                                ) =>
                                                    element?.clientCCCNumber !=
                                                    clientItem?.clientCCCNumber,
                                              )
                                              .toList();

                                      StoreProvider.dispatch(
                                        context,
                                        UpdateSearchUserResponseStateAction(
                                          selectedUsers: updatedSelectedUsers,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              );
                            }
                          }
                          return Column(
                            children: <Widget>[
                              smallVerticalSizedBox,
                              ...clientWidgets
                            ],
                          );
                        },
                      ),
                      smallVerticalSizedBox,
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          key: addClientsButtonKey,
                          onPressed: () => Navigator.of(context).pushNamed(
                            AppRoutes.searchClientPage,
                            arguments: true,
                          ),
                          child: const Text(addClientsString),
                        ),
                      ),
                    ],
                  ),
                ),
                mediumVerticalSizedBox,
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: StreamBuilder<bool>(
                    stream: _formManager.isFormValid,
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<bool> snapshot,
                    ) {
                      final bool hasData =
                          snapshot.hasData && snapshot.data != null;

                      return StoreConnector<AppState, ConnectivityViewModel>(
                        converter: (Store<AppState> store) =>
                            ConnectivityViewModel.fromStore(
                          store,
                        ),
                        builder: (
                          BuildContext context,
                          ConnectivityViewModel vm,
                        ) {
                          if (vm.wait.isWaitingFor(registerCaregiverFlag)) {
                            return const PlatformLoader();
                          }
                          return ElevatedButton(
                            key: registerCaregiverButtonKey,
                            onPressed: hasData && snapshot.data!
                                ? () => _processAndNavigate(
                                      vm.isConnected,
                                    )
                                : null,
                            child: const Text(registerBtnText),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _processAndNavigate(bool hasConnection) {
    if (!hasConnection) {
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

      return;
    }
    StoreProvider.dispatch(
      context,
      RegisterCaregiverAction(
        registerCaregiverPayload: _formManager.submit(context),
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(registerCaregiverSuccess),
              duration: Duration(seconds: 5),
            ),
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
