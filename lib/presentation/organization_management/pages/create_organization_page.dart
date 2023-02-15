import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/organizations/create_organization_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/programs/update_programs_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/organisations/create_organisation_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/programs/program.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/organization_management/create_organization_form_manager.dart';
import 'package:prohealth360_daktari/presentation/organization_management/widgets/program_list_item_widget.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/user_profile/constants.dart';

class CreateOrganizationPage extends StatefulWidget {
  @override
  State<CreateOrganizationPage> createState() => _CreateOrganizationPageState();
}

class _CreateOrganizationPageState extends State<CreateOrganizationPage> {
  final CreateOrganizationFormManager formManager =
      CreateOrganizationFormManager();
  List<Program> selectedPrograms = <Program>[];

  @override
  void initState() {
    super.initState();
    formManager.inEmailAddress.add('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: createOrganizationString,
        showNotificationIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StoreConnector<AppState, CreateOrganisationViewModel>(
              converter: (Store<AppState> store) =>
                  CreateOrganisationViewModel.fromStore(store),
              onInit: (Store<AppState> store) => store.dispatch(
                UpdateProgramsStateAction(
                  selectedPrograms: <Program>[],
                ),
              ),
              builder: (_, CreateOrganisationViewModel vm) {
                final List<Widget> programsList = <Widget>[];
                selectedPrograms =
                    vm.programsState?.selectedPrograms ?? <Program>[];

                if (selectedPrograms.isNotEmpty) {
                  for (final Program program in selectedPrograms) {
                    programsList.add(
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: ProgramListItem(
                          title: program.name ?? '',
                          description: program.description,
                          onCancel: () {
                            final List<Program> programs = selectedPrograms
                                .where(
                                  (Program element) => element.id != program.id,
                                )
                                .toList();
                            StoreProvider.dispatch(
                              context,
                              UpdateProgramsStateAction(
                                selectedPrograms: programs,
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
                    mediumVerticalSizedBox,
                    Center(
                      child: SvgPicture.asset(organizationImage),
                    ),
                    mediumVerticalSizedBox,
                    Text(
                      addOrganizationDetailsString,
                      style: normalSize14Text(AppColors.greyTextColor),
                      textAlign: TextAlign.center,
                    ),
                    mediumVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            registrationNumberString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          // Registration number
                          StreamBuilder<String>(
                            stream: formManager.registrationNumber,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return CustomTextField(
                                formFieldKey: registrationNumberFieldKey,
                                focusedBorderColor: Colors.transparent,
                                borderColor: Colors.transparent,
                                customFillColor:
                                    AppColors.greyTextColor.withOpacity(0.08),
                                onChanged: (String value) {
                                  formManager.inRegistrationNumber.add(value);
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
                          mediumVerticalSizedBox,
                          Text(
                            phoneNumberString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          // Phone number
                          StreamBuilder<String>(
                            stream: formManager.phoneNumber,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return MyAfyaHubPhoneInput(
                                textFormFieldKey: phoneNumberKey,
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
                                    formManager.inPhoneNumber.add(value);
                                  }
                                },
                                phoneNumberFormatter: formatPhoneNumber,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                              );
                            },
                          ),
                          mediumVerticalSizedBox,
                          Text(
                            nameString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          // name
                          StreamBuilder<String>(
                            stream: formManager.name,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return CustomTextField(
                                formFieldKey: nameKey,
                                focusedBorderColor: Colors.transparent,
                                borderColor: Colors.transparent,
                                customFillColor:
                                    AppColors.greyTextColor.withOpacity(0.08),
                                onChanged: (String value) {
                                  formManager.inName.add(value);
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
                          mediumVerticalSizedBox,
                          Text(
                            descriptionString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          // description
                          StreamBuilder<String>(
                            stream: formManager.description,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return CustomTextField(
                                formFieldKey: descriptionKey,
                                maxLines: 5,
                                minLines: 3,
                                focusedBorderColor: Colors.transparent,
                                borderColor: Colors.transparent,
                                customFillColor:
                                    AppColors.greyTextColor.withOpacity(0.08),
                                onChanged: (String value) {
                                  formManager.inDescription.add(value);
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

                          mediumVerticalSizedBox,
                          Text(
                            countryString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          // country
                          StreamBuilder<String>(
                            stream: formManager.country,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return CustomTextField(
                                formFieldKey: countryKey,
                                focusedBorderColor: Colors.transparent,
                                borderColor: Colors.transparent,
                                customFillColor:
                                    AppColors.greyTextColor.withOpacity(0.08),
                                onChanged: (String value) {
                                  formManager.inCountry.add(value);
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
                          mediumVerticalSizedBox,
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: email,
                                  style:
                                      normalSize14Text(AppColors.greyTextColor),
                                ),
                                TextSpan(
                                  text: ' ($optionalString)',
                                  style: veryBoldSize14Text(
                                    AppColors.greyTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          smallVerticalSizedBox,
                          // email
                          StreamBuilder<String>(
                            stream: formManager.emailAddress,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String?> snapshot,
                            ) {
                              return CustomTextField(
                                formFieldKey: emailKey,
                                focusedBorderColor: Colors.transparent,
                                borderColor: Colors.transparent,
                                customFillColor:
                                    AppColors.greyTextColor.withOpacity(0.08),
                                onChanged: (String value) {
                                  formManager.inEmailAddress.add(value);
                                },
                                validator: (String? value) {
                                  if (value?.isEmpty ?? true) return null;
                                  if (snapshot.hasError) {
                                    return (snapshot.error! as UserException)
                                        .msg;
                                  }
                                  return null;
                                },
                              );
                            },
                          ),
                          mediumVerticalSizedBox,
                          Text(
                            physicalAddressString,
                            style: normalSize14Text(AppColors.greyTextColor),
                          ),
                          smallVerticalSizedBox,
                          // Physical address
                          StreamBuilder<String>(
                            stream: formManager.physicalAddress,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return CustomTextField(
                                formFieldKey: addressKey,
                                focusedBorderColor: Colors.transparent,
                                borderColor: Colors.transparent,
                                customFillColor:
                                    AppColors.greyTextColor.withOpacity(0.08),
                                onChanged: (String value) {
                                  formManager.inPhysicalAddress.add(value);
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
                          mediumVerticalSizedBox,
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: AppColors.greyTextColor.withOpacity(0.3),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  programsString,
                                  style:
                                      normalSize14Text(AppColors.greyTextColor),
                                ),
                                ...programsList,
                                mediumVerticalSizedBox,
                                SizedBox(
                                  width: double.infinity,
                                  height: 48,
                                  child: MyAfyaHubPrimaryButton(
                                    borderColor: Colors.transparent,
                                    buttonKey: addProgramButtonKey,
                                    text: addProgramString,
                                    onPressed: () =>
                                        Navigator.of(context).pushNamed(
                                      AppRoutes.manageProgramsPageRoute,
                                      arguments: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    mediumVerticalSizedBox,
                    SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<bool>(
                        stream: formManager.isFormValid,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<bool> snapshot,
                        ) {
                          final bool hasData =
                              snapshot.hasData && snapshot.data != null;

                          if (vm.wait.isWaitingFor(registerOrganisationFlag)) {
                            return const PlatformLoader();
                          }
                          return SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              key: createOrganisationBtnKey,
                              onPressed: hasData && snapshot.data!
                                  ? () => processAndNavigate(
                                        hasConnection: vm.isConnected,
                                        context: context,
                                      )
                                  : null,
                              child: const Text(registerBtnText),
                            ),
                          );
                        },
                      ),
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

  void processAndNavigate({
    required bool hasConnection,
    required BuildContext context,
  }) {
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
      CreateOrganizationAction(
        registerOrganisationInputPayload: formManager.submit(),
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(registerOrganisationSuccess),
              duration: Duration(seconds: 5),
            ),
          );
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
