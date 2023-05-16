import 'package:flutter/material.dart';

import '../text_styles.dart';
import '../utils/app_colors.dart';

class ErrorMessageInput extends StatelessWidget {
  final double? paddingVertical;
  final double? paddingHorizontal;
  final String errorMessage;

  const ErrorMessageInput({
    super.key,
    this.paddingVertical,
    this.paddingHorizontal,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal ?? 13,
        vertical: paddingVertical ?? 8,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          errorMessage,
          textAlign: TextAlign.start,
          style: AppTextStyles.textRegular(
            color: AppColors.errorColor,
          ),
        ),
      ),
    );
  }
}
