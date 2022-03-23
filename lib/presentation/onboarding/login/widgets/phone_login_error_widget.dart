import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:mycarehubpro/application/core/services/utils.dart';
import 'package:mycarehubpro/application/redux/actions/onboarding/update_onboarding_state_action.dart';
import 'package:mycarehubpro/application/redux/states/app_state.dart';
import 'package:mycarehubpro/domain/core/entities/core/onboarding_path_info.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_enums.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_strings.dart';
import 'package:mycarehubpro/domain/core/value_objects/app_widget_keys.dart';

class PhoneLoginErrorWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String? phone;

  const PhoneLoginErrorWidget({required this.formKey, this.phone});

  @override
  Widget build(BuildContext context) {
    return LoginErrorWidget(
      title: invalidCredentialSting,
      message: invalidCredentialsErrorMsg,
      actionText: resetPINString,
      actionKey: resetPINButtonKey,
      actionCallback: () {
        final bool? isFormValid = formKey.currentState?.validate();

        if (isFormValid != null &&
            isFormValid &&
            phone != null &&
            phone != UNKNOWN) {
          StoreProvider.dispatch(
            context,
            UpdateOnboardingStateAction(
              currentOnboardingStage: CurrentOnboardingStage.ResetPIN,
            ),
          );
          final OnboardingPathInfo config = getOnboardingPath(
            state: StoreProvider.state<AppState>(context)!,
          );

          Navigator.of(context).pushReplacementNamed(config.nextRoute);
        }
      },
    );
  }
}