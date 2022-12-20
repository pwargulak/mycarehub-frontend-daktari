import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prohealth360_daktari/application/core/services/input_validators.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/search_users/update_user_profile_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/search_user/search_user_response.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:sghi_core/shared_themes/constants.dart';

class EditClientProfilePage extends StatefulWidget {
  const EditClientProfilePage({super.key, this.searchUserResponse});
  final SearchUserResponse? searchUserResponse;

  @override
  State<EditClientProfilePage> createState() => _EditClientProfilePageState();
}

class _EditClientProfilePageState extends State<EditClientProfilePage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String newCCCNumber = '';
  String newPhoneNumber = '';
  @override
  Widget build(BuildContext context) {
    final String names = widget.searchUserResponse?.user?.name ?? 'No name';
    final String currentCCCNumber =
        widget.searchUserResponse?.clientCCCNumber ?? '';
    final String currentPhoneNumber =
        widget.searchUserResponse?.user?.primaryContact?.value ?? '';
    final bool isPhoneUpdated =
        newPhoneNumber != currentPhoneNumber && newPhoneNumber.isNotEmpty;
    final bool isCCCNumberUpdated =
        newCCCNumber != currentCCCNumber && newCCCNumber.isNotEmpty;
    return Scaffold(
      appBar: const CustomAppBar(title: editProfileString),
      body: Container(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withOpacity(0.4),
                  ),
                  child: Center(
                    child: Text(
                      names.trim()[0].toUpperCase(),
                      style: boldSize30Text(AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              mediumVerticalSizedBox,
              Center(
                child: Text(
                  names,
                  style: veryBoldSize20Text(AppColors.blackColor),
                ),
              ),
              mediumVerticalSizedBox,
              // CCC number
              PatientDetailsTextFormField(
                textFieldKey: cccFieldKey,
                hintText: cccNumberHint,
                keyboardType: TextInputType.text,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(15),
                ],
                label: cccNumberString,
                initialValue: currentCCCNumber,
                onChanged: (String value) => setState(() {
                  newCCCNumber = value;
                }),
                validator: (String? value) {
                  return InputValidators.validateCCCNumber(
                    value: value ?? '',
                  );
                },
              ),
              mediumVerticalSizedBox,
              const Text(
                phoneNumberString,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyTextColor,
                ),
              ),
              smallVerticalSizedBox,
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: currentPhoneNumberString,
                      style: normalSize14Text(AppColors.greyTextColor),
                    ),
                    TextSpan(
                      text: currentPhoneNumber,
                      style: veryBoldSize15Text(AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
              smallVerticalSizedBox,
              // Phone number
              MyAfyaHubPhoneInput(
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
                initialValue: currentPhoneNumber,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      newPhoneNumber = value;
                    });
                  }
                },
                phoneNumberFormatter: formatPhoneNumber,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: StoreConnector<AppState, AppStateViewModel>(
        converter: (Store<AppState> store) =>
            AppStateViewModel.fromStore(store),
        builder: (BuildContext context, AppStateViewModel vm) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: vm.state.wait!.isWaitingFor(updateUserProfileFlag)
                  ? const PlatformLoader()
                  : ElevatedButton(
                      onPressed: isCCCNumberUpdated || isPhoneUpdated
                          ? () {
                              final bool? isFormValid =
                                  formKey.currentState?.validate();

                              if (isFormValid != null && isFormValid) {
                                StoreProvider.dispatch<AppState>(
                                  context,
                                  UpdateUserProfileAction(
                                    userID:
                                        widget.searchUserResponse?.user?.id ??
                                            '',
                                    client: AppWrapperBase.of(
                                      context,
                                    )!
                                        .graphQLClient,
                                    onSuccess: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      )
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              profileUpdateSuccessfulString,
                                            ),
                                            duration: Duration(
                                              seconds: kShortSnackBarDuration,
                                            ),
                                          ),
                                        );

                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        AppRoutes.searchClientPage,
                                        (Route<dynamic> route) => false,
                                      );
                                    },
                                    onError: ({String? message}) {
                                      ScaffoldMessenger.of(
                                        context,
                                      )
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          SnackBar(
                                            content: Text(message!),
                                            duration: const Duration(
                                              seconds: kShortSnackBarDuration,
                                            ),
                                          ),
                                        );
                                    },
                                    phoneNumber: newPhoneNumber.isNotEmpty
                                        ? newPhoneNumber
                                        : currentPhoneNumber,
                                    cccNumber: newCCCNumber.isNotEmpty
                                        ? newCCCNumber
                                        : currentCCCNumber,
                                  ),
                                );
                              }
                            }
                          : null,
                      child: const Text(saveString),
                    ),
            ),
          );
        },
      ),
    );
  }
}
