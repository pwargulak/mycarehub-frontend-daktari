import 'package:prohealth360_daktari/application/core/services/input_validators.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/register_client/check_if_phone_number_exists_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/register_client/register_client_action.dart';
import 'package:prohealth360_daktari/application/redux/view_models/connectivity_view_model.dart';
import 'package:prohealth360_daktari/application/redux/view_models/misc_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/general_workstation_widget.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_facility_field.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/register_client_form_manager.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';

class RegisterClientPage extends StatefulWidget {
  const RegisterClientPage({super.key});

  @override
  State<RegisterClientPage> createState() => _RegisterClientPageState();
}

class _RegisterClientPageState extends State<RegisterClientPage> {
  FocusNode phoneInputFocus = FocusNode();
  final RegisterClientFormManager _formManager = RegisterClientFormManager();
  final TextEditingController dobTextController = TextEditingController();
  String username = '';
  final TextEditingController enrollmentDateTextController =
      TextEditingController();

  final InputDecoration dropdownDecoration = InputDecoration(
    filled: true,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  );

  @override
  void initState() {
    super.initState();
    phoneInputFocus.addListener(onPhoneNumberFocusChange);
    _formManager.inGender.add(Gender.other);

    final Map<ClientType, bool> initialClientTypes =
        Map<ClientType, bool>.fromIterable(
      ClientType.values,
      value: (_) => false,
    );
    _formManager.inClientTypes.add(initialClientTypes);
  }

  @override
  Widget build(BuildContext context) {
    final Program? selectedProgram = StoreProvider.state<AppState>(context)
        ?.userProfileState
        ?.programsState
        ?.selectedUserProgram;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: addNewPatientTitleText,
        showShadow: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: StoreConnector<AppState, ConnectivityViewModel>(
              converter: (Store<AppState> store) =>
                  ConnectivityViewModel.fromStore(
                store,
              ),
              builder: (
                BuildContext context,
                ConnectivityViewModel vm,
              ) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SvgPicture.asset(
                      addNewUserIconSvg,
                      height: 180,
                    ),
                    const SizedBox(height: 24),
                    if (selectedProgram != null &&
                        selectedProgram.id != UNKNOWN)
                      Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              programString,
                              style: normalSize14Text(
                                AppColors.greyTextColor,
                              ),
                            ),
                            smallVerticalSizedBox,
                            GeneralWorkstationWidget(
                              title: selectedProgram.name ?? '',
                              bodyWidget: Column(
                                children: <Widget>[
                                  if (selectedProgram
                                          .organisation?.name?.isNotEmpty ??
                                      false)
                                    Text(
                                      selectedProgram.organisation?.name ?? '',
                                      style: normalSize16Text(
                                        AppColors.greyTextColor,
                                      ),
                                    ),
                                  smallVerticalSizedBox,
                                  Text(
                                    selectedProgramDescriptionString,
                                    style: normalSize16Text(
                                      AppColors.greyTextColor.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    const SizedBox(height: 24),
                    Row(
                      children: <Widget>[
                        // CCC number
                        Flexible(
                          child: StreamBuilder<String>(
                            stream: _formManager.cccNumber,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return PatientDetailsTextFormField(
                                textFieldKey: cccFieldKey,
                                hintText: cccNumberHint,
                                keyboardType: TextInputType.text,
                                inputFormatters: <TextInputFormatter>[
                                  LengthLimitingTextInputFormatter(15),
                                ],
                                label: CCCNumberLabel,
                                onChanged: (String value) {
                                  _formManager.inCccNumber.add(value);
                                },
                                validator: (String? value) {
                                  if (snapshot.hasError) {
                                    return (snapshot.error! as UserException)
                                        .msg;
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

                    // Phone number
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        phoneNumberLabel,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    smallVerticalSizedBox,
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: StreamBuilder<String>(
                            stream: _formManager.phoneNumber,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return MyAfyaHubPhoneInput(
                                focusNode: phoneInputFocus,
                                textFormFieldKey: patientNumberField,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(8.0),
                                ),
                                style: const TextStyle(
                                  color: AppColors.greyTextColor,
                                ),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    _formManager.inPhoneNumber.add(value);
                                  }
                                },
                                phoneNumberFormatter: formatPhoneNumber,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    smallVerticalSizedBox,
                    const UserExistsBanner(
                      title: userAlreadyExistsString,
                      description: userPhoneAlreadyExistsDescriptionString,
                    ),
                    const SizedBox(height: 24),
                    // Username
                    PatientDetailsTextFormField(
                      textFieldKey: usernameFieldKey,
                      hintText: usernameHint,
                      keyboardType: TextInputType.text,
                      label: usernameLabel,
                      onChanged: (String value) {
                        setState(() {
                          username = value.trim();
                        });
                      },
                      validator: (String? value) {
                        return InputValidators.validateUsername(
                          value: value,
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                    // Facilities
                    Flexible(
                      child: SearchFacilityField(
                        onChanged: (String facilityCode) =>
                            _formManager.inFacility.add(facilityCode),
                        onFieldCleared: () => _formManager.inFacility.add(''),
                      ),
                    ),
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
                                    return (snapshot.error! as UserException)
                                        .msg;
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
                                    return (snapshot.error! as UserException)
                                        .msg;
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
                                style: const TextStyle(
                                  color: AppColors.greyTextColor,
                                ),
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

                    // Enrollment date
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            children: <Widget>[
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  enrollmentDateLabel,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.greyTextColor,
                                  ),
                                ),
                              ),
                              smallVerticalSizedBox,
                              DatePickerField(
                                allowCurrentYear: true,
                                gestureDateKey: enrollmentFieldKey,
                                controller: enrollmentDateTextController,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(Icons.date_range),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(8.0),
                                ),
                                style: const TextStyle(
                                  color: AppColors.greyTextColor,
                                ),
                                onChanged: (String? value) {
                                  if (value != null) {
                                    final DateTime date =
                                        DateFormat(datePickerFormat)
                                            .parseLoose(value);
                                    _formManager.inEnrollmentDate.add(date);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        clientTypeLabel,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.greyTextColor,
                        ),
                      ),
                    ),
                    StreamBuilder<Map<ClientType, bool>>(
                      stream: _formManager.clientTypes,
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<Map<ClientType, bool>> snapshot,
                      ) {
                        final Map<ClientType, bool> clientTypes =
                            snapshot.data ?? <ClientType, bool>{};

                        return GridView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / .4,
                          ),
                          children: getCheckBoxes(clientTypes),
                        );
                      },
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              appInviteText,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                StreamBuilder<bool>(
                                  stream: _formManager.inviteClient,
                                  builder: (
                                    BuildContext context,
                                    AsyncSnapshot<bool> snapshot,
                                  ) {
                                    final bool? data = snapshot.data;

                                    return Checkbox(
                                      key: myAfyaHubInviteKey,
                                      value: data ?? false,
                                      fillColor:
                                          MaterialStateProperty.all<Color>(
                                        AppColors.primaryColor,
                                      ),
                                      onChanged: (bool? value) {
                                        if (value != null) {
                                          _formManager.inInviteClient
                                              .add(value);
                                        }
                                      },
                                    );
                                  },
                                ),
                                const Text(appInviteText),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Submit button
                        SizedBox(
                          width: double.infinity,
                          child: StreamBuilder<bool>(
                            stream: _formManager.isFormValid,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<bool> snapshot,
                            ) {
                              final bool hasData =
                                  snapshot.hasData && snapshot.data != null;

                              if (vm.wait.isWaitingFor(registerClientFlag)) {
                                return const PlatformLoader();
                              }

                              return SizedBox(
                                height: 48,
                                child: ElevatedButton(
                                  key: patientRegisterBtnKey,
                                  onPressed: hasData &&
                                          snapshot.data! &&
                                          username.isNotEmpty
                                      ? () => _processAndNavigate(
                                            vm.isConnected,
                                          )
                                      : null,
                                  child: const Text(registerBtnText),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    phoneInputFocus.removeListener(onPhoneNumberFocusChange);
    phoneInputFocus.dispose();
  }

  List<Widget> getCheckBoxes(Map<ClientType, bool> clientTypes) {
    final List<Widget> result = <Widget>[];
    final Map<ClientType, bool> clientTypesCopy = clientTypes;

    clientTypes.forEach((ClientType key, bool value) {
      result.add(
        CheckboxListTile(
          key: ValueKey<String>(key.name),
          activeColor: AppColors.primaryColor,
          title: Text(
            key.name.replaceAll('_', ' '),
            style: const TextStyle(color: AppColors.grey50),
          ),
          value: value,
          onChanged: (_) {
            clientTypesCopy[key] = !value;
            _formManager.inClientTypes.add(clientTypesCopy);
          },
        ),
      );
    });

    return result;
  }

  void onPhoneNumberFocusChange() {
    if (!phoneInputFocus.hasFocus) {
      StoreProvider.dispatch(
        context,
        CheckIfPhoneNumberExistsAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          phoneNumber: _formManager.submit().phoneNumber ?? '',
        ),
      );
    }
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
      RegisterClientAction(
        registerClientPayload:
            _formManager.submit().copyWith(username: username),
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(registerClientSuccess),
              duration: Duration(seconds: 5),
            ),
          );

          Navigator.of(context).pop();
        },
      ),
    );
  }
}

class UserExistsBanner extends StatelessWidget {
  final String title;
  final String description;

  const UserExistsBanner({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MiscStateViewModel>(
      converter: (Store<AppState> store) => MiscStateViewModel.fromStore(
        store,
      ),
      onInit: (Store<AppState> store) => store.dispatch(
        BatchUpdateMiscStateAction(userExists: false),
      ),
      builder: (
        BuildContext context,
        MiscStateViewModel vm,
      ) {
        return vm.wait.isWaitingFor(checkIfIdentifierExistsFlag)
            ? const PlatformLoader()
            : vm.state?.userExists ?? false
                ? GeneralWorkstationWidget(
                    title: title,
                    bodyWidget: Column(
                      children: <Widget>[
                        Text(
                          description,
                          style: normalSize16Text(
                            AppColors.greyTextColor.withOpacity(0.5),
                          ),
                        ),
                        smallVerticalSizedBox,
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: MyAfyaHubPrimaryButton(
                            buttonKey: continueKey,
                            borderColor: Colors.transparent,
                            buttonColor: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.15),
                            onPressed: () {
                              StoreProvider.dispatch(
                                context,
                                BatchUpdateMiscStateAction(userExists: false),
                              );
                            },
                            text: continueString,
                            textColor: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox();
      },
    );
  }
}
