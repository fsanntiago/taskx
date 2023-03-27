import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskX/core/text_styles.dart';
import 'package:taskX/core/utils/app_colors.dart';

class ThemeProvider with ChangeNotifier {
  bool isLightTheme;
  ThemeProvider({required this.isLightTheme});

  getCurrentStatusNavigationBarColor() {
    if (isLightTheme) {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: AppColors.darkBottomBar,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  changeThemeData() {}

  ThemeData themeData() {
    return ThemeData(
      fontFamily: "Metropolis",
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor: isLightTheme
          ? AppColors.lightBackgroundColor
          : AppColors.darkBackgroundColor,
      textTheme: TextTheme(
        labelMedium: AppTextStyles.button(
          color: isLightTheme
              ? AppColors.lightShapeColor
              : AppColors.darkShapeColor,
        ),
        displayLarge: AppTextStyles.onboardTitle(
          color: isLightTheme
              ? AppColors.lightMainTextColor
              : AppColors.darkMainTextColor,
        ),
        displayMedium: AppTextStyles.applicationTitle(
          color: isLightTheme
              ? AppColors.lightShapeColor
              : AppColors.darkShapeColor,
        ),
        titleLarge: AppTextStyles.subTitle(
          color: isLightTheme
              ? AppColors.lightShapeColor
              : AppColors.darkShapeColor,
        ),
        bodyLarge: AppTextStyles.textbold(
          color: isLightTheme
              ? AppColors.lightShapeColor
              : AppColors.darkShapeColor,
        ),
        bodyMedium: AppTextStyles.textMedium(
          color: isLightTheme
              ? AppColors.lightMainTextColor
              : AppColors.darkMainTextColor,
        ),
        bodySmall: AppTextStyles.textRegular(
          color: isLightTheme
              ? AppColors.lightMainTextColor
              : AppColors.darkMainTextColor,
        ),
        displaySmall: AppTextStyles.viewAll(
          color: isLightTheme
              ? AppColors.lightTextSecondaryColor
              : AppColors.darkTextSecondaryColor,
        ),
        headlineSmall: AppTextStyles.description(
          color: AppColors.whiteColor,
        ),
        titleSmall: AppTextStyles.badge(
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  ThemeMode themeMode({Color? colorCategory}) {
    return ThemeMode(
      colorTextCalendar:
          isLightTheme ? AppColors.blackColor : AppColors.whiteColor,
      category: AppTextStyles.textRegular(
          color: isLightTheme ? colorCategory : AppColors.blackColor),
      shadowCategory: isLightTheme
          ? colorCategory?.withOpacity(0.1)
          : colorCategory?.withOpacity(0.2),
      backgroundCategory:
          isLightTheme ? colorCategory?.withOpacity(0.2) : colorCategory,
      backgroundProgress: isLightTheme
          ? AppColors.lightBackgroundProgress
          : AppColors.darkBackgroundProgress,
      barProgress:
          isLightTheme ? AppColors.lightBarProgress : AppColors.darkBarProgress,
      button: isLightTheme ? AppColors.darkBlueColor : AppColors.primaryColor,
      googleButton:
          isLightTheme ? const Color(0x00002648) : AppColors.googleButton,
      inputField: isLightTheme
          ? AppColors.lightInputFieldColor
          : AppColors.darkBlueColor,
      line: AppColors.darkBlueColor,
      textSeparator:
          isLightTheme ? AppColors.whiteColor : AppColors.darkBlueColor,
    );
  }
}

class ThemeMode {
  Color? backgroundCategory;
  TextStyle? category;
  Color? shadowCategory;
  Color? backgroundProgress;
  Color? barProgress;
  Color? button;
  Color? googleButton;
  Color? inputField;
  Color? line;
  Color? textSeparator;
  Color? colorTextCalendar;

  ThemeMode({
    this.backgroundCategory,
    this.shadowCategory,
    this.category,
    this.backgroundProgress,
    this.barProgress,
    this.button,
    this.googleButton,
    this.inputField,
    this.line,
    this.textSeparator,
    this.colorTextCalendar,
  });
}
