import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/retrieve_facility_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/set_facility_contact_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:sghi_core/shared_themes/constants.dart';

class AddFacilityContactPage extends StatefulWidget {
  final String? phoneNumber;

  const AddFacilityContactPage({
    this.phoneNumber,
  });

  @override
  State<AddFacilityContactPage> createState() => _AddFacilityContactPageState();
}

class _AddFacilityContactPageState extends State<AddFacilityContactPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String newPhoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: addFacilityContactString,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight -
                        const CustomAppBar().preferredSize.height,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: SvgPicture.asset(
                            facilityContactZeroStateSvgPath,
                          ),
                        ),
                        mediumVerticalSizedBox,
                        Text(
                          addFacilityContactDescriptionString,
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

                        ///phone number input
                        Form(
                          key: _formKey,
                          child: MyAfyaHubPhoneInput(
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              border: InputBorder.none,
                              filled: true,
                              fillColor: AppColors.lightGreyBackgroundColor,
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[200]!),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                            ),
                            phoneNumberFormatter: formatPhoneNumber,
                            onChanged: (String? value) {
                              setState(() {
                                newPhoneNumber = value!;
                              });
                            },
                          ),
                        ),

                        mediumVerticalSizedBox,
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: StoreConnector<AppState, AppStateViewModel>(
                            converter: (Store<AppState> store) =>
                                AppStateViewModel.fromStore(store),
                            builder:
                                (BuildContext context, AppStateViewModel vm) {
                              return vm.state.wait?.isWaitingFor(
                                        addFacilityContactFlag,
                                      ) ??
                                      false
                                  ? const PlatformLoader()
                                  : ElevatedButton(
                                      onPressed: newPhoneNumber.isNotEmpty &&
                                              newPhoneNumber !=
                                                  widget.phoneNumber
                                          ? () {
                                              final bool? isFormValid = _formKey
                                                  .currentState
                                                  ?.validate();
                                              if (isFormValid ?? false) {
                                                StoreProvider.dispatch<
                                                    AppState>(
                                                  context,
                                                  SetFacilityContactAction(
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
                                                              contactUpdateSuccessfulString,
                                                            ),
                                                            duration: Duration(
                                                              seconds:
                                                                  kShortSnackBarDuration,
                                                            ),
                                                          ),
                                                        );
                                                      StoreProvider.dispatch<
                                                          AppState>(
                                                        context,
                                                        RetrieveFacilityAction(
                                                          client: AppWrapperBase
                                                                  .of(
                                                            context,
                                                          )!
                                                              .graphQLClient,
                                                        ),
                                                      );
                                                      Navigator.pop(context);
                                                    },
                                                    onError: (String message) {
                                                      ScaffoldMessenger.of(
                                                        context,
                                                      )
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(
                                                          SnackBar(
                                                            content:
                                                                Text(message),
                                                            duration:
                                                                const Duration(
                                                              seconds:
                                                                  kShortSnackBarDuration,
                                                            ),
                                                          ),
                                                        );
                                                    },
                                                    phone: newPhoneNumber,
                                                  ),
                                                );
                                              }
                                            }
                                          : null,
                                      child: const Text(saveContactString),
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
