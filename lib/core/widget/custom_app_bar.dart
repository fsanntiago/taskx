import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:taskX/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final void Function() onPressedButtonBack;

  const CustomAppBar({
    Key? key,
    required this.onPressedButtonBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Feather.arrow_left,
            color: AppColors.blackColor,
            size: 28,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: onPressedButtonBack,
        icon: const Icon(
          Feather.arrow_left,
          color: AppColors.blackColor,
          size: 28,
        ),
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
