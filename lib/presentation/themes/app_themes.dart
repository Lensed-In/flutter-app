import 'package:profile/common/constants/layout_constants.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/themes/app_switch_themes.dart';

import 'app_colors.dart';
import 'app_text_themes.dart';
import 'border_themes.dart';
import 'dialog_themes.dart';

abstract class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primaryColor,
          secondary: AppColor.white,
          onSecondary: AppColor.darkBG,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[700],
          size: 18,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: Colors.grey[400],
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          linearTrackColor: Colors.white,
          circularTrackColor: Colors.white,
        ),
        scaffoldBackgroundColor: AppColor.lightBG,
        primaryColor: AppColor.primaryColor,
        primaryColorDark: AppColor.primaryColorDark,
        hintColor: AppColor.grey,
        // highlightColor: AppColor.primaryColor.withOpacity(0.2),
        backgroundColor: AppColor.lightBG,
        toggleableActiveColor: AppColor.primaryColor,
        fontFamily: AppTextTheme.defaultFontFamily,
        primaryTextTheme:
            AppTextTheme.defaultTextTheme(AppColor.lightThemePrimaryTextColor),
        textTheme:
            AppTextTheme.defaultTextTheme(AppColor.lightThemePrimaryTextColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColor.lightBG,
        ),
        chipTheme: const ChipThemeData(backgroundColor: Colors.white),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: AppColor.white),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColor.primaryColor,
          disabledColor: AppColor.primaryColor25,
          shape: AppBorderTheme.primaryButtonBorder,
        ),
        switchTheme: AppSwitchTheme.lightSwitchTheme(),
        dialogTheme: AppDialogTheme.defaultDialogTheme(),
        cardColor: AppColor.white,
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColor.lightBG,
          actionTextColor: AppColor.black,
          disabledActionTextColor: AppColor.grey,
          contentTextStyle:
              AppTextTheme.defaultTextTheme(AppColor.lightThemePrimaryTextColor)
                  .subtitle1,
          elevation: LayoutConstants.dimen_0,
          behavior: SnackBarBehavior.fixed,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColor.darkBG,
        primaryColor: AppColor.primaryColor,
        cardColor: Colors.grey[850],
        // highlightColor: AppColor.primaryColor.withOpacity(0.2),
        colorScheme: const ColorScheme.dark(
          primary: AppColor.primaryColor,
          secondary: AppColor.darkBGDarker,
          onSecondary: AppColor.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.grey[700],
          size: 18,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColor.darkBGDarker,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: Colors.grey[600],
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          linearTrackColor: Colors.black,
          circularTrackColor: Colors.black,
        ),
        chipTheme: ChipThemeData(backgroundColor: Colors.grey[850]),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: AppColor.darkBG),
        primaryColorDark: AppColor.primaryColorDark,
        hintColor: AppColor.grey,
        backgroundColor: AppColor.darkBG,
        toggleableActiveColor: AppColor.primaryColor,
        fontFamily: AppTextTheme.defaultFontFamily,
        primaryTextTheme:
            AppTextTheme.defaultTextTheme(AppColor.darkThemePrimaryTextColor),
        textTheme:
            AppTextTheme.defaultTextTheme(AppColor.darkThemePrimaryTextColor),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: AppColor.darkBG,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: AppColor.primaryColor,
          disabledColor: AppColor.primaryColor25,
          shape: AppBorderTheme.primaryButtonBorder,
        ),
        switchTheme: AppSwitchTheme.darkSwitchTheme(),
        dialogTheme: AppDialogTheme.defaultDialogTheme(),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColor.darkBG,
          actionTextColor: AppColor.white,
          disabledActionTextColor: AppColor.grey,
          contentTextStyle:
              AppTextTheme.defaultTextTheme(AppColor.darkThemePrimaryTextColor)
                  .subtitle1,
          elevation: LayoutConstants.dimen_0,
          behavior: SnackBarBehavior.fixed,
        ),
      );
}
