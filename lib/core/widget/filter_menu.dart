import 'package:flutter/material.dart';

import '../text_styles.dart';
import '../utils/app_colors.dart';
import '../utils/constants.dart';

class FilterMenu extends StatelessWidget {
  final Function onPressAll;
  final Function onPressInProgress;
  final Function onPressDone;

  const FilterMenu({
    super.key,
    required this.onPressAll,
    required this.onPressInProgress,
    required this.onPressDone,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 16,
      // ),
      children: [
        Ink(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          width: 110,
          child: InkWell(
            onTap: () {
              onPressAll();
            },
            child: Center(
              child: Text(
                "All",
                textAlign: TextAlign.center,
                style: AppTextStyles.textMedium(color: AppColors.blackColor),
              ),
            ),
          ),
        ),
        sizeHor(20),
        Ink(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          width: 110,
          child: InkWell(
            onTap: () {
              onPressInProgress();
            },
            child: Center(
              child: Text(
                "In Progress",
                textAlign: TextAlign.center,
                style: AppTextStyles.textMedium(color: AppColors.blackColor),
              ),
            ),
          ),
        ),
        sizeHor(20),
        Ink(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.05),
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          width: 110,
          child: InkWell(
            onTap: () {
              onPressDone();
            },
            child: Center(
              child: Text(
                "Done",
                textAlign: TextAlign.center,
                style: AppTextStyles.textMedium(color: AppColors.blackColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
