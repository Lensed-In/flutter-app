import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTextTheme {
  AppTextTheme._();

  static const String defaultFontFamily = 'Roboto';

  static TextStyle headline1(Color color) => const TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle headline2(Color color) => const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle headline3(Color color) => const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle headline4(Color color) => const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle headline5P5 = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle headline5(Color color) => const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle headline6(Color color) => const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle bodyText1(Color color) => const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle bodyText2(Color color) => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle subtitle1(Color color) => const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle subtitle2(Color color) => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle caption(Color color) => const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle overline(Color color) => const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle button = const TextStyle(
    fontSize: 14,
    letterSpacing: 1.0,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle nonButton = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle appBarTitle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextTheme defaultTextTheme(Color color) => TextTheme(
        headline1: AppTextTheme.headline1(color),
        headline2: AppTextTheme.headline2(color),
        headline3: AppTextTheme.headline3(color),
        headline4: AppTextTheme.headline4(color),
        headline5: AppTextTheme.headline5(color),
        headline6: AppTextTheme.headline6(color),
        subtitle1: AppTextTheme.subtitle1(color),
        subtitle2: AppTextTheme.subtitle2(color),
        bodyText1: AppTextTheme.bodyText1(color),
        bodyText2: AppTextTheme.bodyText2(color),
        caption: AppTextTheme.caption(color),
        button: AppTextTheme.button,
        overline: AppTextTheme.overline(color),
      );

  static TextStyle inputLabelStyle = const TextStyle(
    fontSize: 12,
    // color: AppColor.inputLabel,
    fontWeight: FontWeight.w600,
    wordSpacing: 0,
  );

  static TextStyle inputHintStyle = const TextStyle(
    fontSize: 12,
    // color: AppColor.inputHint,
    fontWeight: FontWeight.normal,
    wordSpacing: 0,
  );

  static TextStyle inputTextStyle = const TextStyle(
    fontSize: 16,
    // color: AppColor.inputText,
    fontWeight: FontWeight.w600,
    wordSpacing: 0,
  );

  static TextStyle inputLabelStyleNew = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    wordSpacing: 0,
  );

  static TextStyle inputHintStyleSecondary = const TextStyle(
    fontSize: 16,
    // color: AppColor.grey,
    fontWeight: FontWeight.normal,
    wordSpacing: 0,
  );

  static TextStyle inputTextStyleSecondary = const TextStyle(
    fontSize: 16,
    // color: AppColor.black,
    fontWeight: FontWeight.normal,
    wordSpacing: 0,
  );

  static TextStyle chipLabel = const TextStyle(
    fontSize: 10,
    // color: AppColor.darkGrey,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle timerWidgetText = const TextStyle(
    fontSize: 45,
    // color: AppColor.darkGrey,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    wordSpacing: 0,
  );

  static TextStyle bottomNavItemActiveStyle() => inputLabelStyle.copyWith(
        color: AppColor.primaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
        height: 1.8,
      );

  static TextStyle bottomNavItemInActiveStyle() => inputLabelStyle.copyWith(
        color: AppColor.bottomNavIconInactive,
        fontWeight: FontWeight.normal,
        letterSpacing: 0,
        height: 1.8,
      );
}
