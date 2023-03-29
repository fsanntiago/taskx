import 'package:flutter/material.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';

class AuthInsteadOf extends StatelessWidget {
  final String route;
  final String message;
  final String method;

  const AuthInsteadOf({
    super.key,
    required this.route,
    required this.message,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
          style:
              AppTextStyles.textRegularSecondary(color: AppColors.whiteColor),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              route,
              (route) => true,
            );
          },
          child: Text(
            method,
            style: AppTextStyles.textRegularSecondary(
                color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
