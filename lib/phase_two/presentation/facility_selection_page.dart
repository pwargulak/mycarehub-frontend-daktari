import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/general_workstation_widget.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/summary_badge_widget.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';

class FacilitySelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> facilities = <String>[
      'Aga Khan',
      'Nanyuki District Hospital',
    ];

    final List<Widget> facilitiesWidgetList = <Widget>[];

    if (facilities.isNotEmpty) {
      for (final String facility in facilities) {
        facilitiesWidgetList.add(
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GeneralWorkstationWidget(
              title: facility,
              bodyWidget: Wrap(
                runSpacing: 12,
                spacing: 8,
                children: const <Widget>[
                  SummaryBadgeWidget(
                    title: '23 notifications',
                    iconUrl: notificationSvgIconPath,
                  ),
                  SummaryBadgeWidget(
                    title: '3 surveys',
                    iconUrl: surveysIcon,
                  ),
                  SummaryBadgeWidget(
                    title: '30 service requests',
                    iconUrl: serviceRequestIcon,
                  ),
                ],
              ),
              buttonText: continueString,
            ),
          ),
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: StoreConnector<AppState, AppStateViewModel>(
              converter: (Store<AppState> store) =>
                  AppStateViewModel.fromStore(store),
              builder: (BuildContext context, AppStateViewModel vm) {
                return Column(
                  children: <Widget>[
                    Center(
                      child: SvgPicture.asset(workStationChooserImage),
                    ),
                    smallVerticalSizedBox,
                    Text(
                      welcomeFacilitySelectionDescription(
                        vm.state.staffState?.user?.firstName ?? '',
                      ),
                      style: boldSize20Text(AppColors.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                    Text(
                      noOfFacilitiesDescription(facilities.length),
                      style: normalSize14Text(
                        AppColors.unSelectedReactionIconColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    smallVerticalSizedBox,
                    ...facilitiesWidgetList,
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
