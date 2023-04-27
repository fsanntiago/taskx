import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:taskX/core/l10n/generated/l10n.dart';

import 'package:taskX/core/utils/app_colors.dart';
import 'package:taskX/core/utils/app_fonts.dart';
import 'package:taskX/core/utils/constants.dart';

class CustomTitleWidget extends StatelessWidget {
  CustomTitleWidget({
    Key? key,
    required this.title,
    this.viewAll,
    required this.onTap,
  }) : super(key: key);

  final String title;
  bool? viewAll;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        GestureDetector(
          child: InkWell(
            onTap: onTap,
            child: Row(
              children: [
                viewAll != false
                    ? Text(
                        IntlStrings.of(context).viewAll,
                        style: Theme.of(context).textTheme.displaySmall,
                      )
                    : Container(),
                sizeHor(3),
                const Icon(
                  Ionicons.ios_arrow_forward,
                  size: FontSize.light,
                  color: AppColors.lightMainTextColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
