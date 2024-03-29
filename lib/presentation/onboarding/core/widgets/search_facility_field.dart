import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/application/redux/actions/core/batch_update_misc_state_action.dart';
import 'package:prohealth360_daktari/application/redux/states/app_state.dart';
import 'package:prohealth360_daktari/application/redux/view_models/register_client/fetch_facilities_view_model.dart';
import 'package:prohealth360_daktari/domain/core/entities/facilities/facility.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/presentation/router/routes.dart';

class SearchFacilityField extends StatefulWidget {
  const SearchFacilityField({
    super.key,
    this.onChanged,
    this.onFieldCleared,
  });

  final void Function(String mflCode)? onChanged;
  final VoidCallback? onFieldCleared;

  @override
  State<SearchFacilityField> createState() => _SearchFacilityFieldState();
}

class _SearchFacilityFieldState extends State<SearchFacilityField> {
  @override
  void initState() {
    super.initState();

    // reset the selected facility value in state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      StoreProvider.dispatch<AppState>(
        context,
        BatchUpdateMiscStateAction(
          selectedFacility: Facility.initial(),
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
            facilityLabel,
            style: normalSize14Text(
              AppColors.greyTextColor,
            ),
          ),
        ),
        smallVerticalSizedBox,
        StoreConnector<AppState, ListFacilitiesViewModel>(
          converter: (Store<AppState> store) =>
              ListFacilitiesViewModel.fromStore(store),
          builder: (
            BuildContext context,
            ListFacilitiesViewModel vm,
          ) {
            final String facilityName = vm.selectedFacility.name ?? '';
            final bool isFacilityChosen =
                facilityName.isNotEmpty && facilityName != UNKNOWN;

            final String facilityCode = vm
                        .selectedFacility.facilityIdentifier?.value !=
                    null
                ? vm.selectedFacility.facilityIdentifier?.value.toString() ?? ''
                : '';

            if (isFacilityChosen) {
              widget.onChanged?.call(
                facilityCode,
              );
              controller.text = facilityName;
            } else {
              controller.clear();
            }
            return TextFormField(
              controller: controller,
              key: facilitySelectOptionFieldKey,
              onTap: isFacilityChosen
                  ? null
                  : () {
                      StoreProvider.dispatch<AppState>(
                        context,
                        BatchUpdateMiscStateAction(
                          updateFacility: false,
                        ),
                      );
                      Navigator.pushNamed(
                        context,
                        AppRoutes.searchFacilitiesPage,
                      );
                    },
              readOnly: true,
              decoration: InputDecoration(
                hintText: searchFacilityActionString,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintStyle: const TextStyle(color: AppColors.hintTextColor),
                contentPadding: const EdgeInsets.all(8.0),
                suffixIcon: IconButton(
                  key: searchFacilityIconBtnKey,
                  onPressed: isFacilityChosen
                      ? () {
                          controller.clear();
                          StoreProvider.dispatch<AppState>(
                            context,
                            BatchUpdateMiscStateAction(
                              selectedFacility: Facility.initial(),
                            ),
                          );
                          widget.onFieldCleared?.call();
                        }
                      : null,
                  icon: Icon(
                    isFacilityChosen ? Icons.close_sharp : Icons.search,
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
