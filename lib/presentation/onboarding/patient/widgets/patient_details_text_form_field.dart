// Flutter imports:
import 'package:sghi_core/afya_moja_core/afya_moja_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Project imports:
import 'package:prohealth360_daktari/application/core/theme/app_themes.dart';
// Package imports:

class PatientDetailsTextFormField extends StatelessWidget {
  const PatientDetailsTextFormField({
    required this.label,
    this.textFieldKey,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.initialValue,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.obscureText = false,
    this.maxLength,
    this.textInputAction,
    this.focusNode,
  });

  final String label;
  final Key? textFieldKey;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final String? initialValue;
  final AutovalidateMode autovalidateMode;
  final bool obscureText;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.greyTextColor,
            ),
          ),
        ),
        smallVerticalSizedBox,
        TextFormField(
          controller: controller,
          key: textFieldKey,
          focusNode: focusNode,
          textInputAction: textInputAction,
          initialValue: initialValue,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.hintTextColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(8.0),
          ),
          style: const TextStyle(color: AppColors.greyTextColor),
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          autovalidateMode: autovalidateMode,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          maxLength: maxLength,
        ),
      ],
    );
  }
}
