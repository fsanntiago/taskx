import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CardListWidget extends StatelessWidget {
  const CardListWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.childItem,
  }) : super(key: key);

  final double width;
  final double height;
  final Widget childItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(top: 6, bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => Ink(
          child: Container(
            width: width,
            margin: const EdgeInsets.only(left: 16, right: 6, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.lightShapeColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(1, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: childItem,
            ),
          ),
        ),
      ),
    );
  }
}
