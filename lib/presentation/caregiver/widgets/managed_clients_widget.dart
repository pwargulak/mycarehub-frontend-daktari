import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/caregiver/fetch_caregiver_managed_clients_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/staff_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/search/widgets/list_card_with_cancel_button.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';

class ManagedClientsWidget extends StatelessWidget {
  const ManagedClientsWidget({
    super.key,
    required this.id,
    required this.userName,
  });

  final String id;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, StaffStateViewModel>(
      converter: (Store<AppState> store) =>
          StaffStateViewModel.fromStore(store),
      onInit: (Store<AppState> store) async {
        await store.dispatch(
          FetchCaregiverManagedClientsAction(
            client: AppWrapperBase.of(context)!.graphQLClient,
            caregiverId: id,
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
      builder: (BuildContext context, StaffStateViewModel vm) {
        final List<ManagedClient>? managedClients =
            vm.staffState?.managedClients;
        final List<Widget> clientsWidgetList = <Widget>[];
        if (managedClients?.isNotEmpty ?? false) {
          for (final ManagedClient client in managedClients!) {
            clientsWidgetList.add(
              ListCardWithCancelButton(
                title: client.user?.name ?? '',
              ),
            );
          }
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              clients,
              style: boldSize18Text(AppColors.greyTextColor),
            ),
            smallVerticalSizedBox,
            Text(
              getLinkedClientsDescriptionString(
                userName,
              ),
              style: normalSize15Text(AppColors.greyTextColor),
            ),
            if (vm.wait!.isWaitingFor(fetchManagedClientsFlag))
              const PlatformLoader()
            else
              ...clientsWidgetList,
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
