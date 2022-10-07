import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:app_wrapper/app_wrapper.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/redux/actions/facilities/fetch_user_linked_facilities_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/register_client/fetch_facilities_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/list_card_with_cancel_button.dart';

class FacilitiesListWidget extends StatelessWidget {
  const FacilitiesListWidget({required this.userID, this.isClient = false});

  final String userID;
  final bool isClient;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ListFacilitiesViewModel>(
      onInit: (Store<AppState> store) => store.dispatch(
        FetchUserLinkedFacilitiesAction(
          client: AppWrapperBase.of(context)!.graphQLClient,
          userId: userID,
          onFailure: (String message) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    message,
                  ),
                  duration: const Duration(
                    seconds: 5,
                  ),
                  action: dismissSnackBar(
                    closeString,
                    Colors.white,
                    context,
                  ),
                ),
              );
          },
        ),
      ),
      converter: (Store<AppState> store) =>
          ListFacilitiesViewModel.fromStore(store),
      builder: (BuildContext context, ListFacilitiesViewModel vm) {
        final List<Facility> facilities = vm.facilities ?? <Facility>[];
        final List<Widget> facilitiesWidgetList = <Widget>[];
        if (facilities.isNotEmpty) {
          for (final Facility facility in facilities) {
            facilitiesWidgetList.add(
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ListCardWithCancelButton(
                  title: facility.name ?? '',
                  description: facility.code?.toString() ?? '',
                ),
              ),
            );
          }
        }
        return vm.wait.isWaitingFor(retrieveFacilityFlag)
            ? const PlatformLoader()
            : Column(
                children: <Widget>[...facilitiesWidgetList],
              );
      },
    );
  }
}
