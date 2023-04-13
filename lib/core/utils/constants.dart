import 'package:flutter/material.dart';

import 'app_assets_images.dart';

Widget sizeVer(double height) {
  return SizedBox(
    height: height,
  );
}

Widget sizeHor(double width) {
  return SizedBox(
    width: width,
  );
}

const Map<int, String> iconsCategory = {
  0: AppImages.briefcaseIcon,
  1: AppImages.codeIcon,
  2: AppImages.shoppingCartIcon,
  3: AppImages.userIcon,
  4: AppImages.musicalNotesIcon,
  5: AppImages.controllerIcon,
  6: AppImages.drillIcon,
  7: AppImages.newsIcon,
  8: AppImages.cameraIcon,
};
