import 'package:flutter/material.dart';
import 'package:taskX/core/utils/icons_category.dart';

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

const Map<int, String> iconsTaskBlack = {
  0: IconsCategory.briefcaseIconBlack,
  1: IconsCategory.programmingIconBlack,
  2: IconsCategory.shoppingIconBlack,
  3: IconsCategory.userIconBlack,
  4: IconsCategory.musicIconBlack,
  5: IconsCategory.gameIconBlack,
  6: IconsCategory.hammerIconBlack,
  7: IconsCategory.newsIconBlack,
  8: IconsCategory.videoCameraIconBlack,
};

const Map<int, String> iconsTaskWhite = {
  0: IconsCategory.briefcaseIconWhite,
  1: IconsCategory.programmingIconWhite,
  2: IconsCategory.shoppingIconWhite,
  3: IconsCategory.userIconWhite,
  4: IconsCategory.musicIconWhite,
  5: IconsCategory.gameIconWhite,
  6: IconsCategory.hammerIconWhite,
  7: IconsCategory.newsIconWhite,
  8: IconsCategory.videoCameraIconWhite,
};
