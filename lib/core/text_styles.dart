import 'package:flutter/widgets.dart';

import 'utils/app_fonts.dart';

class AppTextStyles {
  static TextStyle _setStyle({
    Color? color,
    required double fontSize,
    required FontWeight fontWeight,
    required double letterSpacing,
  }) {
    return TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle button({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.boxTitle,
      fontWeight: FontThickness.medium,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle onboardTitle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.titleStartScreen,
      fontWeight: FontThickness.bold,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle applicationTitle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.title,
      fontWeight: FontThickness.bold,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle description({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subTitle,
      fontWeight: FontThickness.light,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle subTitle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subTitle,
      fontWeight: FontThickness.medium,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle subTitleBold({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subTitle,
      fontWeight: FontThickness.bold,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle textRegular({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.body,
      fontWeight: FontThickness.regular,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle viewAll({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.details,
      fontWeight: FontThickness.medium,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle badge({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.details,
      fontWeight: FontThickness.medium,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle textMedium({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.body,
      fontWeight: FontThickness.medium,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle textBold({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.boxTitle,
      fontWeight: FontThickness.bold,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle textRegularSecondary({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.boxTitle,
      fontWeight: FontThickness.regular,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle inputText({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.boxTitle,
      fontWeight: FontThickness.medium,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }

  static TextStyle floatingButtonText({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.floatingButton,
      fontWeight: FontThickness.bold,
      letterSpacing: LetterSpacingCustom.letterSpacing,
    );
  }
}
