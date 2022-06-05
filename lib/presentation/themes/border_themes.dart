import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:profile/common/constants/layout_constants.dart';

import 'app_colors.dart';


class AppBorderTheme {
  static RoundedRectangleBorder primaryButtonBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(LayoutConstants.dimen_8.w),
  );

  static RoundedRectangleBorder dialogThemeShapeBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(LayoutConstants.dimen_12.w),
    side: const BorderSide(color: AppColor.white),
  );
}
