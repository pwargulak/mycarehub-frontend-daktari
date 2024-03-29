import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/staff_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class FacilityContactsPage extends StatefulWidget {
  @override
  State<FacilityContactsPage> createState() => _FacilityContactsPageState();
}

class _FacilityContactsPageState extends State<FacilityContactsPage> {
  bool canUpdateContact = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<Role>? staffRoles = StoreProvider.state<AppState>(context)
          ?.userProfileState
          ?.userProfile
          ?.user
          ?.roles;
      if (staffRoles?.isNotEmpty ?? false) {
        for (final Role role in staffRoles!) {
          if (role.name == RoleValue.SYSTEM_ADMINISTRATOR) {
            setState(() {
              canUpdateContact = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: facilityContactsString,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: StoreConnector<AppState, UserProfileViewModel>(
          converter: (Store<AppState> store) =>
              UserProfileViewModel.fromStore(store),
          builder: (BuildContext context, UserProfileViewModel vm) {
            final String phoneNumber = (vm.userProfile?.facilities?.firstWhere(
                  (Facility facility) =>
                      facility.name == vm.userProfile?.defaultFacilityName,
                  orElse: () => Facility.initial(),
                ))?.phone ??
                '';
            return vm.wait?.isWaitingFor(retrieveFacilityFlag) ?? false
                ? const PlatformLoader()
                : phoneNumber.isNotEmpty && phoneNumber != UNKNOWN
                    ? Column(
                        children: <Widget>[
                          smallVerticalSizedBox,
                          SvgPicture.asset(
                            facilityContactWalkieIconSvgPath,
                          ),
                          mediumVerticalSizedBox,
                          Text(
                            facilityContactsDescriptionString,
                            style: normalSize14Text(darkGreyTextColor),
                            textAlign: TextAlign.center,
                          ),
                          mediumVerticalSizedBox,
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              facilityPhoneNumberString,
                              style: normalSize14Text(darkGreyTextColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          smallVerticalSizedBox,
                          TextFormField(
                            readOnly: true,
                            initialValue: phoneNumber,
                            decoration: InputDecoration(
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                          ),
                          const Spacer(),
                          if (canUpdateContact)
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pushNamed(
                                    context,
                                    AppRoutes.addFacilityContactPage,
                                    arguments: phoneNumber,
                                  ),
                                  child: const Text(updateContactString),
                                ),
                              ),
                            ),
                          mediumVerticalSizedBox,
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          smallVerticalSizedBox,
                          SvgPicture.asset(
                            facilityContactZeroStateSvgPath,
                          ),
                          mediumVerticalSizedBox,
                          if (canUpdateContact) ...<Widget>{
                            Text(
                              addFacilityContactDescriptionString,
                              style: normalSize14Text(darkGreyTextColor),
                              textAlign: TextAlign.center,
                            ),
                            mediumVerticalSizedBox,
                            Text(
                              noContactForFacilityDescriptionString,
                              style: normalSize14Text(darkGreyTextColor),
                              textAlign: TextAlign.center,
                            ),
                          } else ...<Widget>{
                            Text(
                              noFacilityContactsTitle,
                              style: veryBoldSize18Text(darkGreyTextColor),
                              textAlign: TextAlign.center,
                            ),
                            mediumVerticalSizedBox,
                            Text(
                              noFacilityContactsDescription,
                              style: normalSize14Text(darkGreyTextColor),
                              textAlign: TextAlign.center,
                            ),
                          },
                          mediumVerticalSizedBox,
                          if (canUpdateContact)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.addFacilityContactPage,
                                  arguments: phoneNumber,
                                ),
                                child: const Text(createContactString),
                              ),
                            ),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
