import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/widgets/button_widget/button_widget_constants.dart';

buttonPrimary(
  BuildContext context,
  String? label, {
  Color? labelColor,
  VoidCallback? onPress,
  Color? buttonColor,
  EdgeInsets? padding,
}) =>
    ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? AppColor.primaryColor,
        elevation: ButtonWidgetConstants.buttonElevation,
        shape: ButtonWidgetConstants.buttonShapeBorder,
        padding: padding ?? ButtonWidgetConstants.buttonPadding,
      ),
      child: subtitle1(
        context,
        label,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
    );

buttonPrimaryWithIcon(
  BuildContext context,
  String? label,
  IconData iconData, {
  double? iconSize,
  Color? labelColor,
  VoidCallback? onPress,
  Color? buttonColor,
  EdgeInsets? padding,
}) =>
    ElevatedButton.icon(
      icon: Icon(
        iconData,
        size: iconSize ?? LayoutConstants.dimen_20.r,
      ),
      label: caption(
        context,
        label,
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.w600,
      ),
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? AppColor.primaryColor,
        elevation: ButtonWidgetConstants.buttonElevation,
        shape: ButtonWidgetConstants.buttonShapeBorder,
        padding: padding ?? ButtonWidgetConstants.buttonPadding,
      ),
    );

buttonOutlinedLabel(
  BuildContext context,
  String? label, {
  VoidCallback? onPress,
  EdgeInsets? padding,
  double? fontSize,
}) =>
    OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: ButtonWidgetConstants.buttonShapeBorder,
        padding: padding ?? ButtonWidgetConstants.buttonOutlinedPadding,
      ),
      onPressed: onPress,
      child: caption(
        context,
        label,
        color: Theme.of(context).primaryColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

buttonOutlinedWithIcon(
  BuildContext context,
  String? label,
  IconData iconData, {
  Color? iconColor,
  double? iconSize,
  VoidCallback? onPress,
  EdgeInsets? padding,
  double? fontSize,
}) =>
    OutlinedButton.icon(
      icon: Icon(
        iconData,
        size: iconSize ?? LayoutConstants.dimen_16.r,
      ),
      label: subtitle2(
        context,
        label,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
      style: OutlinedButton.styleFrom(
        shape: ButtonWidgetConstants.buttonShapeBorder,
        padding: padding ?? ButtonWidgetConstants.buttonOutlinedPadding,
      ),
      onPressed: onPress,
    );

buttonText(
  BuildContext context,
  String? label, {
  VoidCallback? onPress,
  EdgeInsets? padding,
  bool splash = true,
}) =>
    TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        splashFactory: !splash ? NoSplash.splashFactory : null,
      ),
      child: caption(
        context,
        label,
        color: onPress != null ? Theme.of(context).primaryColor : null,
        fontWeight: FontWeight.bold,
      ),
    );
