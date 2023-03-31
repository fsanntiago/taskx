import 'package:flutter/material.dart';
import 'package:taskX/core/text_styles.dart';

import '../utils/app_colors.dart';

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
  final int? maxLength;
  final bool? readOnly;
  final Color? fillColor;
  final int? maxLines;
  final String? counterText;
  final void Function(String)? onChanged;
  final Color? labelColor;
  final String? hintText;
  final Color? inputTextColor;

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
    this.maxLength,
    this.readOnly,
    this.fillColor,
    this.maxLines,
    this.counterText,
    this.onChanged,
    this.labelColor,
    this.hintText,
    this.inputTextColor,
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
      onChanged: widget.onChanged,
      maxLines: widget.maxLines ?? 1,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly ?? false,
      keyboardType: widget.inputType,
      key: widget.fieldKey,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      textInputAction: widget.textInputAction,
      obscureText: widget.isPasswordField == true ? _obscureText : false,
      style: AppTextStyles.inputText(
        color: widget.inputTextColor ?? AppColors.whiteColor,
      ),
      cursorColor:
          widget.inputTextColor ?? AppColors.whiteColor.withOpacity(0.5),
      decoration: InputDecoration(
        hintText: widget.hintText ?? "",
        filled: true,
        fillColor: widget.fillColor ?? AppColors.darkBlueColorSecondary,
        counterText: widget.counterText,
        border: InputBorder.none,
        labelText: widget.labelText,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.errorColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.errorColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        labelStyle: AppTextStyles.inputText(
          color: widget.labelColor != null
              ? widget.labelColor!.withOpacity(0.5)
              : AppColors.whiteColor.withOpacity(0.5),
        ),
        suffixIconConstraints: widget.isPasswordField == true
            ? const BoxConstraints(minHeight: 50, minWidth: 40)
            : const BoxConstraints(),
        suffixIcon: widget.isPasswordField == true
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: _obscureText == false
                      ? AppColors.primaryColor
                      : AppColors.whiteColor.withOpacity(0.5),
                ),
              )
            : Container(
                color: Colors.amber,
                height: 0,
                width: 0,
                padding: EdgeInsets.zero,
              ),
      ),
    );
  }
}
