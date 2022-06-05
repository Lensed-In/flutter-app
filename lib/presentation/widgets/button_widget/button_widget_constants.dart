import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';

class ButtonWidgetConstants {
  static const buttonTextMaxLines = 1;
  static const buttonBorderWidth = 1.5;
  static const socialButtonBorderWidth = 2.0;
  static const buttonElevation = 0.0;
  static final double buttonRadius = LayoutConstants.dimen_8.w;
  static final BorderRadius buttonBorderRadius =
      BorderRadius.circular(buttonRadius);
  static final OutlinedBorder buttonShapeBorder = RoundedRectangleBorder(
    borderRadius: buttonBorderRadius,
  );

  static final EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: LayoutConstants.dimen_20.w,
    vertical: LayoutConstants.dimen_14.h,
  );

  static final EdgeInsets buttonPaddingSmall = EdgeInsets.symmetric(
    horizontal: LayoutConstants.dimen_16.w,
    vertical: LayoutConstants.dimen_8.h,
  );

  static final EdgeInsets buttonPaddingIcon = EdgeInsets.only(
    left: LayoutConstants.dimen_16.w,
    right: LayoutConstants.dimen_10.w,
    top: LayoutConstants.dimen_4.h,
    bottom: LayoutConstants.dimen_4.h,
  );

  static final EdgeInsets buttonOutlinedPadding = EdgeInsets.symmetric(
    horizontal: LayoutConstants.dimen_12.w,
    vertical: LayoutConstants.dimen_4.h,
  );
}
