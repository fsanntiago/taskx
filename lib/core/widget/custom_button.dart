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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size.fromHeight(height ?? 50),
        ),
        elevation: const MaterialStatePropertyAll(12),
        shadowColor: MaterialStatePropertyAll(
          shadowColor != null
              ? shadowColor!.withOpacity(0.6)
              : AppColors.shadowBlueButtonColor.withOpacity(0.6),
        ),
        backgroundColor:
            MaterialStatePropertyAll(buttonColor ?? AppColors.primaryColor),
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
      // child: Container(
      //   height: height ?? 50,
      //   width: double.infinity,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(5),
      //     color: buttonColor ?? AppColors.primaryColor,
      //     boxShadow: [
      //       BoxShadow(
      //         color: shadowColor != null
      //             ? shadowColor!.withOpacity(0.18)
      //             : AppColors.shadowBlueButtonColor.withOpacity(0.18),
      //         spreadRadius: 4,
      //         blurRadius: 12,
      //         offset: const Offset(1, 0),
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       isGoogleButton == true
      //           ? Container(
      //               margin: const EdgeInsets.only(right: 8),
      //               child: SvgPicture.asset(
      //                 AppImages.googleIcon,
      //                 height: 28,
      //                 width: 28,
      //               ),
      //             )
      //           : Container(
      //               height: 0,
      //             ),
      //       Text(
      //         text,
      //         style: TextStyle(
      //           color: textButtonColor ?? const Color(0xff000308),
      //           fontSize: FontSize.boxTitle,
      //           fontWeight: FontThickness.medium,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
