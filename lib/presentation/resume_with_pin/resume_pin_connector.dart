import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:sghi_core/flutter_graphql_client/i_flutter_graphql_client.dart';
import 'package:prohealth360_daktari/application/redux/actions/user_state_actions/logout_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/presentation/resume_with_pin/resume_pin_view_model.dart';
import 'package:prohealth360_daktari/presentation/resume_with_pin/resume_pin_view_model_factory.dart';
import 'package:prohealth360_daktari/presentation/resume_with_pin/resume_with_pin_page.dart';

class ResumePinConnector extends StatelessWidget {
  const ResumePinConnector({super.key});

  @override
  Widget build(BuildContext context) {
    final IGraphQlClient client = AppWrapperBase.of(context)!.graphQLClient;
    final String endpoint =
        AppWrapperBase.of(context)!.customContext!.loginByPhoneEndpoint;

    return StoreConnector<AppState, ResumePinViewModel>(
      vm: () => ResumePinFactory(client: client, endpoint: endpoint),
      builder: (BuildContext context, ResumePinViewModel vm) {
        return ResumeWithPinPage(
          username: vm.username,
          onSubmit: vm.onSubmit,
          isLoading: vm.isLoading,
          logoutCallback: () {
            StoreProvider.dispatch(
              context,
              LogoutAction(),
            );
          },
        );
      },
    );
  }
}
