import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';


abstract class InputTextFormFieldConstants {
  InputTextFormFieldConstants._();

  static final double widgetHeight = LayoutConstants.dimen_96.h;
  static final double labelTextHeight = LayoutConstants.dimen_24.h;
  static final double helperTextHeight = LayoutConstants.dimen_24.h;
  static final double textFieldHeight = LayoutConstants.dimen_48.h;

  static final double secondaryWidgetHeight = LayoutConstants.dimen_72.h;
  static final double secondaryLabelTextHeight = LayoutConstants.dimen_32.h;
  static final double secondaryTextFieldHeight = LayoutConstants.dimen_40.h;

  static final textFieldRadius = LayoutConstants.dimen_4.w;
  static final textFieldBorderRadius = BorderRadius.circular(textFieldRadius);

  static final ShapeBorder textFieldShapeBorder = RoundedRectangleBorder(
    borderRadius: textFieldBorderRadius,
  );

  static final contentPadding = EdgeInsets.symmetric(
    horizontal: LayoutConstants.dimen_16.w,
  );

  static final secondaryContentPadding = EdgeInsets.symmetric(
    horizontal: LayoutConstants.dimen_16.w,
    vertical: LayoutConstants.dimen_14.h,
  );

  static const defaultMinLines = 1;
  static const defaultMaxLines = 1;
}
