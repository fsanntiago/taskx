// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskX/core/domain/entities/category/category_entity.dart';
import 'package:taskX/core/utils/constants.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({
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
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      color:
                          AppColors.ColorsTasksAndCategories[category.color]!),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "02 Task",
                    style: TextStyle(
                      fontSize: FontSize.body,
                      fontWeight: FontThickness.medium,
                      color: AppColors.lightTextSecondaryColor,
                      letterSpacing: LetterSpacingCustom.letterSpacing,
                    ),
                  ),
                  SvgPicture.asset(
                    iconsCategory[category.icon]!,
                    // scale: 2,
                    height: 28,
                    color: AppColors.ColorsTasksAndCategories[category.color],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
