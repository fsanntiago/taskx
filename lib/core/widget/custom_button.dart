// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:taskX/core/utils/app_colors.dart';

import '../utils/app_fonts.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final Color? shadowColor;
  final Color? buttonColor;
  final Color? iconColor;
  final Color? textButtonColor;
  final String text;
  final IconData? icon;
  final bool? isDisable;

  final void Function() onPressed;

  const CustomButton({
    Key? key,
    this.height,
    this.shadowColor,
    this.buttonColor,
    this.textButtonColor,
    required this.text,
    this.icon,
    required this.onPressed,
    this.iconColor,
    this.isDisable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isDisable == true ? null : onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size.fromHeight(height ?? 50)),
        elevation: const MaterialStatePropertyAll(6),
        shadowColor: MaterialStatePropertyAll(
          shadowColor != null
              ? isDisable == true
                  ? shadowColor!.withOpacity(0.3)
                  : shadowColor!.withOpacity(0.4)
              : isDisable == true
                  ? AppColors.shadowBlueButtonColor.withOpacity(0.3)
                  : AppColors.shadowBlueButtonColor.withOpacity(0.4),
        ),
        backgroundColor: MaterialStatePropertyAll(
          isDisable == true
              ? AppColors.primaryColor.withOpacity(0.5)
              : buttonColor ?? AppColors.primaryColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Icon(
                    icon,
                    color: iconColor ?? const Color(0xff000308),
                  ),
                )
              : Container(
                  height: 0,
                ),
          Text(
            text,
            style: TextStyle(
              color: textButtonColor ?? const Color(0xff000308),
              fontSize: FontSize.boxTitle,
              fontWeight: FontThickness.medium,
            ),
          ),
        ],
      ),
    );
  }
}
