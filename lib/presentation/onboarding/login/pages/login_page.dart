import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_organisation_field.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prohealth360_daktari/application/core/services/input_validators.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:sghi_core/app_wrapper/enums.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? username;
  String? pin;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    if (username == null) {
      /// reset login state upon entering this page
      StoreProvider.dispatch(context, ResetOnboardingStateAction());
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final TargetPlatform platform = Theme.of(context).platform;
    final double sizedBoxHeight = MediaQuery.of(context).size.width / 8;
    // A small indicator to help us identify whether the app is running in
    // staging or testing
    final bool isAppTest =
        AppWrapperBase.of(context)!.appContexts.contains(AppContext.AppTest);

    return StoreConnector<AppState, AppStateViewModel>(
      converter: (Store<AppState> store) => AppStateViewModel.fromStore(store),
      builder: (BuildContext context, AppStateViewModel vm) {
        final String appNameString =
            AppWrapperBase.of(context)?.appName ?? appName;

        final String organisationID =
            vm.state.miscState?.selectedOrganisation?.id ?? '';
        return Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.symmetric(
                  horizontal:
                      ResponsiveWidget.preferredPaddingOnStretchedScreens(
                    context: context,
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: sizedBoxHeight),
                    OnboardingScaffoldHeader(
                      title: '$phoneLoginPageTitle $appNameString',
                      description: selectOrganisationDescription,
                    ),
                    smallVerticalSizedBox,
                    largeVerticalSizedBox,
                    SearchOrganisationField(
                      vm: vm,
                       validator: (String? value) {
                        return InputValidators.validateOrganisationName(
                          value: value,
                        );
                      },
                    ),

                    mediumVerticalSizedBox,

                    /// Username input
                    PatientDetailsTextFormField(
                      textFieldKey: usernameFieldKey,
                      hintText: userNameHint,
                      keyboardType: TextInputType.text,
                      label: userNameString,
                      onChanged: (String? value) {
                        final bool invalidCredentials =
                            vm.state.onboardingState!.invalidCredentials!;

                        if (invalidCredentials) {
                          StoreProvider.dispatch<AppState>(
                            context,
                            UpdateOnboardingStateAction(
                              invalidCredentials: false,
                            ),
                          );
                        }

                        setState(() {
                          username = value;
                        });
                      },
                      validator: (String? value) {
                        return InputValidators.validateUsername(
                          value: value,
                        );
                      },
                    ),

                    mediumVerticalSizedBox,
                    PatientDetailsTextFormField(
                      autovalidateMode: AutovalidateMode.disabled,
                      textFieldKey: phoneLoginPinInputKey,
                      label: pinString,
                      onChanged: (String val) {
                        final bool invalidCredentials =
                            vm.state.onboardingState!.invalidCredentials!;

                        if (invalidCredentials) {
                          StoreProvider.dispatch<AppState>(
                            context,
                            UpdateOnboardingStateAction(
                              invalidCredentials: false,
                            ),
                          );
                        }

                        setState(() {
                          pin = val;
                        });
                      },
                      maxLength: 4,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      validator: (String? value) {
                        return InputValidators.validatePin(
                          value: value,
                        );
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                    ),

                    smallVerticalSizedBox,
                    if (platform != TargetPlatform.iOS)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Center(
                          child: Text(
                            '$appVersionString $APPVERSION',
                            style: normalSize9Text(Colors.grey),
                          ),
                        ),
                      ),
                    smallVerticalSizedBox,
                    veryLargeVerticalSizedBox,
                  ],
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: vm.state.wait!.isWaitingFor(phoneLoginStateFlag)
              ? const SizedBox(height: 48, child: PlatformLoader())
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveWidget.preferredPaddingOnStretchedScreens(
                      context: context,
                    ),
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: MyAfyaHubPrimaryButton(
                      buttonKey: loginKey,
                      onPressed: () {
                        final bool? isFormValid =
                            _formKey.currentState?.validate();

                        if (isFormValid != null &&
                            isFormValid &&
                            pin != null &&
                            username != null &&
                            pin != UNKNOWN &&
                            username != UNKNOWN &&
                            organisationID.isNotEmpty &&
                            organisationID != UNKNOWN) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.homePage,
                            (Route<dynamic> route) => false,
                          );
                        }
                      },
                      buttonColor: isAppTest
                          ? AppColors.greenHappyColor
                          : AppColors.primaryColor,
                      borderColor: Colors.transparent,
                      text: phoneLoginText,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
