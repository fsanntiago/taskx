// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/utils/constants.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';

class CustomTaskInProgressCard extends StatelessWidget {
  const CustomTaskInProgressCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
        BoxShadow(
          color: AppColors.blackColor.withOpacity(0.1),
          blurRadius: 8,
          offset: const Offset(3, 3),
        ),
      ]),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
          elevation: const MaterialStatePropertyAll(2),
          fixedSize: const MaterialStatePropertyAll(
            Size.fromHeight(20),
          ),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(14),
          ),
          overlayColor: MaterialStatePropertyAll(
            AppColors.blackColor.withOpacity(0.04),
          ),
          backgroundColor: const MaterialStatePropertyAll(
            AppColors.whiteColor,
          ),
        ),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.ColorsTasksAndCategories[category.color]!
                        .withOpacity(0.10),
                    blurRadius: 5,
                    spreadRadius: 3,
                    blurStyle: BlurStyle.normal,
                  )
                ],
                color: AppColors.ColorsTasksAndCategories[category.color]!
                    .withOpacity(0.10),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                category.name!,
                // titleCategory.trim().capitalize(),
                style: TextStyle(
                  color: AppColors.ColorsTasksAndCategories[category.color]!,
                ),
              ),
            ),
            sizeVer(10),
            const Text(
              "Prototyping",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            sizeVer(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Feather.clock,
                        size: FontSize.body,
                        color: Color(0xffE362F8),
                      ),
                    ),
                    sizeHor(2),
                    const Text(
                      "12 days left",
                      style: TextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontThickness.medium,
                        color: AppColors.lightTextSecondaryColor,
                        letterSpacing: LetterSpacingCustom.letterSpacing,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 2),
                      child: Icon(
                        Feather.folder,
                        size: FontSize.body,
                        color: Color(0xffFFC85E),
                      ),
                    ),
                    sizeHor(2),
                    const Text(
                      "10 files",
                      style: TextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontThickness.medium,
                        color: AppColors.lightTextSecondaryColor,
                        letterSpacing: LetterSpacingCustom.letterSpacing,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 1),
                      child: Icon(
                        Feather.check_square,
                        size: FontSize.body,
                        color: Color(0XFF7CDCFB),
                      ),
                    ),
                    sizeHor(2),
                    const Text(
                      "02/04 tasks",
                      style: TextStyle(
                        fontSize: FontSize.body,
                        fontWeight: FontThickness.medium,
                        color: AppColors.lightTextSecondaryColor,
                        letterSpacing: LetterSpacingCustom.letterSpacing,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            sizeVer(8),
            Align(
              alignment: Alignment.centerLeft,
              child: LinearPercentIndicator(
                animation: true,
                animationDuration: 1200,
                width: 205,
                lineHeight: 7,
                barRadius: const Radius.circular(10),
                percent: 0.5,
                backgroundColor: AppColors.lightBackgroundProgress,
                progressColor: AppColors.lightTitleColor,
                trailing: const Text(
                  "50%",
                  style: TextStyle(
                    fontSize: FontSize.boxTitle,
                    fontWeight: FontThickness.bold,
                    color: AppColors.lightTitleColor,
                    letterSpacing: LetterSpacingCustom.letterSpacing,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
