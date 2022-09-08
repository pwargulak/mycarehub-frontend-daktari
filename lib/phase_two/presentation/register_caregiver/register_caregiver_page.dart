import 'package:afya_moja_core/afya_moja_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prohealth360_daktari/application/core/services/utils.dart';
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_asset_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_strings.dart';
import 'package:prohealth360_daktari/domain/core/value_objects/app_widget_keys.dart';
import 'package:prohealth360_daktari/phase_two/presentation/widgets/list_card_with_cancel_button.dart';
import 'package:prohealth360_daktari/presentation/core/app_bar/custom_app_bar.dart';
import 'package:prohealth360_daktari/presentation/onboarding/core/widgets/search_facility_field.dart';
import 'package:prohealth360_daktari/presentation/onboarding/patient/widgets/patient_details_text_form_field.dart';

class RegisterCaregiverPage extends StatefulWidget {
  const RegisterCaregiverPage({Key? key}) : super(key: key);

  @override
  State<RegisterCaregiverPage> createState() => _RegisterCaregiverPageState();
}

class _RegisterCaregiverPageState extends State<RegisterCaregiverPage> {
  final TextEditingController dobTextController = TextEditingController();

  final InputDecoration dropdownDecoration = InputDecoration(
    filled: true,
    border: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
  );
  String genderValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add new caregiver',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  addNewUserIconSvg,
                  height: 180,
                ),
                mediumVerticalSizedBox,
                const SearchFacilityField(),
                const SizedBox(height: 24),
                Row(
                  children: const <Widget>[
                    // First name
                    Flexible(
                      child: PatientDetailsTextFormField(
                        textFieldKey: firstNameKey,
                        label: firstNameLabel,
                      ),
                    ),
                    SizedBox(width: 10),
                    // Last name
                    Flexible(
                      child: PatientDetailsTextFormField(
                        textFieldKey: lastNameKey,
                        label: lastNameLabel,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: <Widget>[
                    // Birth date
                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              birthDateLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          DatePickerField(
                            allowCurrentYear: true,
                            gestureDateKey: dobKey,
                            controller: dobTextController,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.date_range),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              contentPadding: const EdgeInsets.all(8.0),
                            ),
                            style:
                                const TextStyle(color: AppColors.greyTextColor),
                            onChanged: (String? value) {
                              if (value != null) {}
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),

                    // Gender dropdown

                    Flexible(
                      child: Column(
                        children: <Widget>[
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              genderLabel,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyTextColor,
                              ),
                            ),
                          ),
                          smallVerticalSizedBox,
                          SelectOptionField(
                            decoration: dropdownDecoration,
                            dropDownInputKey: genderOptionFieldKey,
                            value: genderValue.isEmpty
                                ? capitalizeFirst(
                                    describeEnum(Gender.other),
                                  )
                                : capitalizeFirst(genderValue),
                            options: getGenderList(),
                            onChanged: (String? value) {
                              if (value != null) {
                                setState(() {});
                                genderValue = value;
                              }
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    phoneNumberString,
                    style: normalSize14Text(
                      AppColors.greyTextColor,
                    ),
                  ),
                ),
                smallVerticalSizedBox,
                MyAfyaHubPhoneInput(
                  textFormFieldKey: patientNumberField,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.all(8.0),
                  ),
                  style: const TextStyle(color: AppColors.greyTextColor),
                  onChanged: (String? value) {},
                  phoneNumberFormatter: formatPhoneNumber,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                mediumVerticalSizedBox,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.3),
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          addCaregiverDescriptionString,
                          style: normalSize14Text(
                            AppColors.greyTextColor,
                          ),
                        ),
                      ),
                      smallVerticalSizedBox,
                      const ListCardWithCancelButton(
                        title: 'Jane Doe',
                        description: 'Caregiver number: 1234',
                      ),
                      smallVerticalSizedBox,
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          key: addClientsButtonKey,
                          onPressed: () {},
                          child: const Text(addClientsString),
                        ),
                      ),
                    ],
                  ),
                ),
                mediumVerticalSizedBox,
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    key: registerCaregiverButtonKey,
                    onPressed: () {},
                    child: const Text(registerBtnText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
