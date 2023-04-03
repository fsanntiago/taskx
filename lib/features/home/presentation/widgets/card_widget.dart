// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_fonts.dart';
import '../../../../core/utils/constants.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.isClickable,
    required this.isCategory,
    required this.backgroundColorTitleCategory,
    required this.colorTitleCategory,
    required this.titleCategory,
  }) : super(key: key);

  final bool isClickable;
  final bool isCategory;

  final String titleCategory;
  final Color backgroundColorTitleCategory;
  final Color colorTitleCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          isCategory ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: backgroundColorTitleCategory,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              titleCategory.trim().capitalize(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        isCategory == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "02 Task",
                    style: TextStyle(
                      fontSize: FontSize.body,
                      fontWeight: FontThickness.medium,
                      color: AppColors.lightMainTextColor,
                      letterSpacing: LetterSpacingCustom.letterSpacing,
                    ),
                  ),
                  Icon(
                    Icons.sports_soccer,
                    // color: colorIcon,
                  )
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizeVer(14),
                  Text(
                    "titleTask!".trim().capitalize(),
                    style: const TextStyle(
                      fontSize: FontSize.subTitle,
                      fontWeight: FontThickness.medium,
                      letterSpacing: LetterSpacingCustom.letterSpacing,
                    ),
                  ),
                  sizeVer(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Feather.clock,
                            size: FontSize.body,
                            color: Color(0xffE362F8),
                          ),
                          sizeHor(2),
                          const Text(
                            "12 days left",
                            style: TextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontThickness.regular,
                              color: AppColors.lightTextSecondaryColor,
                              letterSpacing: LetterSpacingCustom.letterSpacing,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Feather.folder,
                            size: FontSize.body,
                            color: Color(0xffFFC85E),
                          ),
                          sizeHor(2),
                          const Text(
                            "10 files",
                            style: TextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontThickness.regular,
                              color: AppColors.lightTextSecondaryColor,
                              letterSpacing: LetterSpacingCustom.letterSpacing,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Feather.check_square,
                            size: FontSize.body,
                            color: Color(0XFF7CDCFB),
                          ),
                          sizeHor(2),
                          const Text(
                            "02/04 Task",
                            style: TextStyle(
                              fontSize: FontSize.body,
                              fontWeight: FontThickness.regular,
                              color: AppColors.lightTextSecondaryColor,
                              letterSpacing: LetterSpacingCustom.letterSpacing,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  sizeVer(8),
                  LinearPercentIndicator(
                    animation: true,
                    animationDuration: 1600,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    width: 180,
                    lineHeight: 7,
                    barRadius: const Radius.circular(10),
                    trailing: const Text(
                      "50%",
                      style: TextStyle(
                        fontSize: FontSize.boxTitle,
                        fontWeight: FontThickness.bold,
                        color: AppColors.lightTitleColor,
                        letterSpacing: LetterSpacingCustom.letterSpacing,
                      ),
                    ),
                    percent: 0.8,
                    backgroundColor: AppColors.lightBackgroundProgress,
                    progressColor: AppColors.lightTitleColor,
                  ),
                ],
              ),
      ],
    );
  }
}
