import 'package:flutter/material.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';

class CustomMenuListViewHorizontal extends StatelessWidget {
  const CustomMenuListViewHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    var list = [
      'completo',
      'em progresso',
      "todos",
      "todos",
      "todos",
      "todos",
      "todos",
    ];
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Container(
              width: 150,
              height: 36,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.1),
                    blurRadius: 6, spreadRadius: 2,
                    offset: const Offset(1, 3), // Shadow position
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () {
                  print("object");
                },
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    list[index],
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textRegularSecondary(
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
