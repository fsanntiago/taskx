import 'package:flutter/material.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const CustomHeader({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyles.applicationTitle(
            color: AppColors.blackColor,
          ),
        ),
        subtitle != null
            ? Text(
                subtitle!,
              )
            : Container(),
      ],
    );
  }
}
