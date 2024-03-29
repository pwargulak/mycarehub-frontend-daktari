import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:sghi_core/app_wrapper/app_wrapper_base.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/flags/app_flags.dart';
import 'package:prohealth360_daktari/application/redux/actions/terms/accept_terms_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/terms/get_terms_action.dart';
import 'package:prohealth360_daktari/application/redux/actions/update_user_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/terms/terms_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/terms/terms_and_conditions.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';

import 'package:unicons/unicons.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({super.key});

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  bool isAgreed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => StoreProvider.dispatch<AppState>(
        context,
        GetTermsAction(client: AppWrapperBase.of(context)!.graphQLClient),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: StoreConnector<AppState, TermsViewModel>(
            converter: (Store<AppState> store) =>
                TermsViewModel.fromStore(store),
            builder: (BuildContext context, TermsViewModel vm) {
              final TermsAndConditions? termsObject = vm.termsAndConditions;
              final bool userAccepted = termsObject?.text != null &&
                  termsObject?.text != UNKNOWN &&
                  isAgreed;

              return Column(
                children: <Widget>[
                  if (vm.error != null && vm.error != UNKNOWN)
                    GenericErrorWidget(
                      padding: EdgeInsets.zero,
                      headerIconSvgUrl: acceptTermsImageSvgPath,
                      messageTitle: noTermsAvailableString,
                      actionKey: helpNoDataWidgetKey,
                      recoverCallback: () => StoreProvider.dispatch<AppState>(
                        context,
                        GetTermsAction(
                          client: AppWrapperBase.of(context)!.graphQLClient,
                        ),
                      ),
                      messageBody: <TextSpan>[
                        TextSpan(
                          text: acceptTermsErrorString,
                          style: normalSize16Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    )
                  else ...<Widget>{
                    // Terms and Conditions Card
                    InformationListCard(
                      leadingIcon: const Center(
                        child: Icon(
                          UniconsLine.file_lock_alt,
                          size: 32,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      title: Text(
                        portalTermsText,
                        style: normalSize16Text(
                          Theme.of(context).primaryColor,
                        ),
                      ),
                      body: Text(
                        readAndAcceptText,
                        style: normalSize14Text(Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Terms and Conditions scrollable view
                    Expanded(
                      child: Scrollbar(
                        thumbVisibility: true,
                        thickness: 10.0,
                        radius: const Radius.circular(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: vm.wait.isWaitingFor(getTermsFlag)
                                    ? Container(
                                        height: 300,
                                        padding: const EdgeInsets.all(20),
                                        child: const PlatformLoader(),
                                      )
                                    : SizedBox(
                                        width: double.infinity,
                                        child: Html(
                                          data: vm.termsAndConditions?.text,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Accepts terms check box
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: CheckBoxComponent(
                        text: acceptTermsText,
                        value: isAgreed,
                        color: AppColors.primaryColor,
                        onChanged: (bool? value) async {
                          setState(() {
                            isAgreed = value!;
                          });
                          if (vm.termsAndConditions?.text != UNKNOWN) {
                            setState(() {
                              isAgreed = value!;
                            });
                          }
                        },
                      ),
                    ),

                    smallVerticalSizedBox,

                    // Continue button
                    SizedBox(
                      height: 48,
                      width: double.infinity,
                      child: vm.wait.isWaitingFor(acceptTermsFlag)
                          ? const PlatformLoader(
                              color: AppColors.secondaryColor,
                            )
                          : MyAfyaHubPrimaryButton(
                              text: continueText,
                              borderColor: userAccepted
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              buttonColor: userAccepted
                                  ? AppColors.primaryColor
                                  : Colors.grey,
                              onPressed: !isAgreed
                                  ? null
                                  : () {
                                      StoreProvider.dispatch(
                                        context,
                                        UpdateUserStateAction(
                                          termsAccepted: true,
                                        ),
                                      );

                                      StoreProvider.dispatch<AppState>(
                                        context,
                                        // Accept terms and conditions
                                        AcceptTermAction(
                                          client: AppWrapperBase.of(context)!
                                              .graphQLClient,
                                        ),
                                      );
                                    },
                            ),
                    ),
                  }
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
