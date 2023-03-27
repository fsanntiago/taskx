import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final TextInputAction? textInputAction;

  const CustomFormField({
    super.key,
    required this.controller,
    this.fieldKey,
    this.isPasswordField,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.textInputAction,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.inputType,
      key: widget.fieldKey,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
      style: const TextStyle(
        color: AppColors.lightShapeColor,
        fontSize: FontSize.boxTitle,
      ),
      cursorColor: AppColors.lightShapeColor.withOpacity(0.5),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.darkBlueColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        labelText: widget.labelText,
        border: InputBorder.none,
        labelStyle: const TextStyle(
            // color: Theme.of(context).text.withOpacity(0.5),
            ),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: widget.isPasswordField == true
              ? Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _obscureText == false
                      ? AppColors.primaryColor
                      : AppColors.lightShapeColor.withOpacity(0.5),
                )
              : const Text(""),
        ),
      ),
    );
  }
}
