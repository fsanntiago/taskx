import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';

import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/app_fonts.dart';
import 'package:taskX/core/utils/constants.dart';

class CustomTitleWidget extends StatelessWidget {
  const CustomTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.lightTitleColor,
            fontSize: FontSize.subTitle,
            fontWeight: FontThickness.medium,
          ),
        ),
        GestureDetector(
          child: Row(
            children: [
              Text(
                IntlStrings.of(context).viewAll,
                style: const TextStyle(
                  color: AppColors.lightTextSecondaryColor,
                  fontSize: FontSize.details,
                  fontWeight: FontThickness.medium,
                ),
              ),
              sizeHor(3),
              const Icon(
                Ionicons.ios_arrow_forward,
                size: FontSize.light,
                color: AppColors.lightMainTextColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
