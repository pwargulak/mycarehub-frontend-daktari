import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/fetch_clients_caregivers_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/staff_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/caregiver/caregiver.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_enums.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/organization_selection/widgets/consent_status_widget.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/list_card_with_cancel_button.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class ClientCaregiversWidget extends StatelessWidget {
  const ClientCaregiversWidget({
    super.key,
    required this.id,
    required this.userName,
  });

  final String id;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UserProfileViewModel>(
      converter: (Store<AppState> store) =>
          UserProfileViewModel.fromStore(store),
      onInit: (Store<AppState> store) {
        store.dispatch(
          FetchClientCaregiversAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
            clientId: id,
            onFailure: (String message) => ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                  ),
                  duration: const Duration(seconds: 5),
                  action: dismissSnackBar(
                    closeString,
                    Colors.white,
                    context,
                  ),
                ),
              ),
          ),
        );
      },
      builder: (BuildContext context, UserProfileViewModel vm) {
        final List<Caregiver?>? clientCaregivers =
            vm.userProfile?.clientCaregivers;
        final List<Widget> caregiversWidgetList = <Widget>[];
        if (clientCaregivers?.isNotEmpty ?? false) {
          for (final Caregiver? caregiver in clientCaregivers!) {
            final ConsentStatus consentStatus =
                caregiver?.consent?.consentStatus ?? ConsentStatus.UNKNOWN;
            caregiversWidgetList.add(
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListCardWithCancelButton(
                  title: caregiver?.caregiverUser?.userName ?? '',
                  description:
                      caregiver?.caregiverUser?.primaryContact?.value ?? '',
                  body: consentStatus == ConsentStatus.UNKNOWN ||
                          consentStatus == ConsentStatus.PENDING
                      ? null
                      : Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: ConsentStatusWidget(
                            consentStatus: consentStatus,
                          ),
                        ),
                ),
              ),
            );
          }
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              caregiversString,
              style: boldSize18Text(AppColors.greyTextColor),
            ),
            smallVerticalSizedBox,
            Text(
              getCaregiverDescriptionString(
                userName,
              ),
              style: normalSize15Text(AppColors.greyTextColor),
            ),
            if (vm.wait!.isWaitingFor(fetchClientCaregiversFlag))
              const PlatformLoader()
            else
              ...caregiversWidgetList,
            smallVerticalSizedBox,
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const MyAfyaHubPrimaryButton(
                text: addClientsString,
              ),
            ),
            largeVerticalSizedBox,
          ],
        );
      },
    );
  }
}
