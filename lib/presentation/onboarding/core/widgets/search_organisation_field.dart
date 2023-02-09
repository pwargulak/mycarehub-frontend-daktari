import 'package:prohealth360_daktari/application/redux/actions/organizations/update_organisations_state_action.dart';
import 'package:prohealth360_daktari/application/redux/view_models/onboarding/organisations_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/organisations/organisation.dart';
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class SearchOrganisationField extends StatefulWidget {
  const SearchOrganisationField({
    super.key,
    this.onChanged, 
    this.onFieldCleared,
  });

  final void Function(String mflCode)? onChanged;
  final VoidCallback? onFieldCleared;

  @override
  State<SearchOrganisationField> createState() =>
      _SearchOrganisationFieldState();
}

class _SearchOrganisationFieldState extends State<SearchOrganisationField> {
  @override
  void initState() {
    super.initState();

    // reset the selected orgarnization value in state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch<AppState>(
        context,
        BatchUpdateMiscStateAction(
          selectedOrganisation: Organisation.initial(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            organisationString,
            style: normalSize14Text(
              AppColors.greyTextColor,
            ),
          ),
        ),
        smallVerticalSizedBox,
        StoreConnector<AppState, OrganisationsStateViewModel>(
          converter: (Store<AppState> store) =>
              OrganisationsStateViewModel.fromStore(store),
          builder: (
            BuildContext context,
            OrganisationsStateViewModel vm,
          ) {
            final String organisationName = vm.selectedOrganisation?.name ?? '';
            final bool isOrganisationChosen =
                organisationName.isNotEmpty && organisationName != UNKNOWN;

            final String organisationCode = vm.selectedOrganisation?.id != null
                ? vm.selectedOrganisation?.id ?? ''
                : '';

            if (isOrganisationChosen) {
              widget.onChanged?.call(
                organisationCode,
              );
              controller.text = organisationName;
            } else {
              controller.clear();
            }
            return TextFormField(
              controller: controller,
              key: organisationSelectOptionFieldKey,
              onTap: isOrganisationChosen
                  ? null
                  : () => Navigator.pushNamed(
                        context,
                        AppRoutes.searchOrganisationsPage,
                      ),
              readOnly: true,
              decoration: InputDecoration(
                hintText: searchOrganisationActionString,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(color: AppColors.hintTextColor),
                contentPadding: const EdgeInsets.all(8.0),
                suffixIcon: IconButton(
                  key: searchOrganisationconBtnKey,
                  onPressed: isOrganisationChosen
                      ? () {
                          controller.clear();
                          StoreProvider.dispatch<AppState>(
                            context,
                            UpdateOrganisationsStateAction(
                              selectedOrganisation: Organisation.initial(),
                            ),
                          );
                          widget.onFieldCleared?.call();
                        }
                      : null,
                  icon: Icon(
                    isOrganisationChosen 
                    ? Icons.close_sharp 
                    : Icons.search,
                    color: AppColors.greyTextColor,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
