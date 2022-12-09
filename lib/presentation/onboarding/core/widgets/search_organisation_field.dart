import 'package:prohealth360_daktari/application/redux/view_models/app_state_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/core/organisation.dart';
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
    this.onFieldCleared,
    this.vm,
    this.validator,
  });

  final VoidCallback? onFieldCleared;
  final AppStateViewModel? vm;
  final String? Function(String?)? validator;

  @override
  State<SearchOrganisationField> createState() =>
      _SearchOrganisationFieldState();
}

class _SearchOrganisationFieldState extends State<SearchOrganisationField> {
  @override
  void initState() {
    super.initState();

    // reset the selected facility value in state
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
    final String organisationName =
        widget.vm?.state.miscState?.selectedOrganisation?.name ?? '';
    final bool isOrganisationChosen =
        organisationName.isNotEmpty && organisationName != UNKNOWN;
   
      if (isOrganisationChosen) {
      
        controller.text = organisationName;
      } else {
        controller.clear();
      }


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
        TextFormField(
          controller: controller,
          key: organisationSelectOptionFieldKey,
          validator: widget.validator,
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
              key: searchOrganisationIconBtnKey,
              onPressed: isOrganisationChosen
                  ? () {
                      controller.clear();
                      StoreProvider.dispatch<AppState>(
                        context,
                        BatchUpdateMiscStateAction(
                          selectedOrganisation: Organisation.initial(),
                        ),
                      );
                      widget.onFieldCleared?.call();
                    }
                  : null,
              icon: Icon(
                isOrganisationChosen ? Icons.close_sharp : Icons.search,
                color: AppColors.greyTextColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
