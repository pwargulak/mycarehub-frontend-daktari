import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/program_management/create_program_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/connectivity_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_organisation_field.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:prohealth360_daktari/presentation/organization_management/pages/create_program_form_manager.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class CreateProgramPage extends StatefulWidget {
  const CreateProgramPage({super.key});

  @override
  State<CreateProgramPage> createState() => _CreateProgramPageState();
}

class _CreateProgramPageState extends State<CreateProgramPage> {
  final CreateProgramFormManager _createProgramFormManager =
      CreateProgramFormManager();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: createProgramString,
        showNotificationIcon: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StoreConnector<AppState, ConnectivityViewModel>(
              converter: (Store<AppState> store) =>
                  ConnectivityViewModel.fromStore(
                store,
              ),
              builder: (BuildContext context, ConnectivityViewModel vm) {
                return Column(
                  children: <Widget>[
                    mediumVerticalSizedBox,
                    Center(
                      child: SvgPicture.asset(serviceRequestsIconSvg),
                    ),
                    mediumVerticalSizedBox,
                    Text(
                      addProgramDetailString,
                      style: normalSize14Text(AppColors.greyTextColor),
                      textAlign: TextAlign.center,
                    ),
                    mediumVerticalSizedBox,
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // program name
                          StreamBuilder<String>(
                            stream: _createProgramFormManager.programName,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return PatientDetailsTextFormField(
                                textFieldKey: programNameFieldKey,
                                label: nameString,
                                keyboardType: TextInputType.text,
                                onChanged: (String value) {
                                  _createProgramFormManager.inProgramName
                                      .add(value);
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
                          // program description
                          StreamBuilder<String>(
                            stream:
                                _createProgramFormManager.programDescription,
                            builder: (
                              BuildContext context,
                              AsyncSnapshot<String> snapshot,
                            ) {
                              return PatientDetailsTextFormField(
                                textFieldKey: programDescriptionFieldKey,
                                label: descriptionString,
                                keyboardType: TextInputType.text,
                                onChanged: (String value) {
                                  _createProgramFormManager.inProgramDescription
                                      .add(value);
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
                          // organisation
                          SearchOrganisationField(
                            onChanged: (String organisationCode) =>
                                _createProgramFormManager.inOrganisation
                                    .add(organisationCode),
                            onFieldCleared: () => _createProgramFormManager
                                .inOrganisation
                                .add(''),
                          ),
                        ],
                      ),
                    ),
                    mediumVerticalSizedBox,
                    // create program button
                    SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<bool>(
                        stream: _createProgramFormManager.isFormValid,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<bool> snapshot,
                        ) {
                          final bool hasData =
                              snapshot.hasData && snapshot.data != null;
                          if (vm.wait.isWaitingFor(createProgramFlag)) {
                            return const PlatformLoader();
                          }
                          return SizedBox(
                            height: 48,
                            child: MyAfyaHubPrimaryButton(
                              buttonKey: addNewProgramButtonKey,
                              borderColor: Colors.transparent,
                              text: createProgramString,
                              onPressed: hasData && snapshot.data!
                                  ? () => _processAndNavigate(
                                        vm.isConnected,
                                      )
                                  : null,
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
      CreateProgramAction(
        createProgramPayload: _createProgramFormManager.submit(),
        client: AppWrapperBase.of(context)!.graphQLClient,
        onSuccess: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(createProgramSuccess),
              duration: Duration(seconds: 5),
            ),
          );

          Navigator.of(context).pop();
        },
      ),
    );
  }
}
