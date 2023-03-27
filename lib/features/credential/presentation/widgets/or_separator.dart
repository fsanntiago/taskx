import 'package:flutter/material.dart';
import 'package:taskX/core/utils/app_colors.dart';

class OrSeparator extends StatelessWidget {
  final String text;
  final Color? color;
  const OrSeparator({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: color ?? AppColors.darkBlueColor,
            height: 2,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: TextStyle(
              color: color ?? AppColors.darkBlueColor,
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: color ?? AppColors.darkBlueColor,
            height: 2,
          ),
        ),
      ],
    );
  }
}
