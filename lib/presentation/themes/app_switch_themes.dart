import 'package:flutter/material.dart';
import 'package:profile/presentation/themes/app_colors.dart';

abstract class AppSwitchTheme {
  AppSwitchTheme._();

  static SwitchThemeData lightSwitchTheme() => SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.white;
            }
            return AppColor.inactiveGrey.withAlpha(30);
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.activeGreen;
            }
            return AppColor.white;
          },
        ),
      );

  static SwitchThemeData darkSwitchTheme() => SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.white;
            }
            return AppColor.inactiveGrey.withAlpha(30);
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return AppColor.activeGreen;
            }
            return AppColor.white;
          },
        ),
      );
}
