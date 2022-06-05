import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_themes.dart';
import 'border_themes.dart';

class AppDialogTheme {
  static double elevation = 0.0;

  static TextStyle? titleTextStyle = AppTextTheme.defaultTextTheme(AppColor.lightThemePrimaryTextColor).subtitle1;

  static TextStyle? contentTextStyle = AppTextTheme.defaultTextTheme(AppColor.lightThemePrimaryTextColor).bodyText2;

  static DialogTheme defaultDialogTheme() => DialogTheme(
        elevation: AppDialogTheme.elevation,
        shape: AppBorderTheme.dialogThemeShapeBorder,
        titleTextStyle: AppDialogTheme.titleTextStyle,
        contentTextStyle: AppDialogTheme.contentTextStyle,
      );
}
