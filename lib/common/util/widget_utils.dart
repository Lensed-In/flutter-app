import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

void dismissKeyboard(
  BuildContext context,
) {
  final currentFocusScopeNode = FocusScope.of(context);
  if (!currentFocusScopeNode.hasPrimaryFocus) {
    currentFocusScopeNode.unfocus();
  }
}

SizedBox wrapWithButtonSizedBox(
  Widget widget,
) =>
    SizedBox(
      height: LayoutConstants.buttonDefaultHeight,
      child: widget,
    );

Material wrapWithMaterialInkWell(
  BuildContext context,
  Widget child, {
  Key? cardKey,
  MaterialType? materialType,
  Color? backgroundColor,
  Color? highlightColor,
  ShapeBorder? shapeBorder,
  BorderRadius? borderRadius,
  GestureTapCallback? onTap,
  double? elevation,
}) =>
    Material(
      key: cardKey,
      clipBehavior:
          materialType == MaterialType.canvas ? Clip.none : Clip.antiAlias,
      type: materialType ?? MaterialType.canvas,
      color: backgroundColor ?? AppColor.transparent,
      shape: shapeBorder,
      borderRadius: shapeBorder == null ? borderRadius : null,
      elevation: elevation ?? 0,
      child: InkWell(
        highlightColor: highlightColor ?? Theme.of(context).highlightColor,
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );

Container getEmptyContainer({
  ValueKey? key,
}) =>
    Container(
      key: key,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
    );

SvgPicture? getSvgPicture({
  String? assetName,
  required double pictureWidth,
  double? pictureHeight,
  ValueKey? key,
}) {
  final isAssetNameEmpty = assetName!.isEmpty;
  return isAssetNameEmpty
      ? null
      : SvgPicture.asset(
          assetName,
          width: pictureWidth,
          height: pictureHeight,
          key: key,
        );
}

BoxDecoration bottomButtonBoxDecorationWithShadow() => const BoxDecoration(
      color: AppColor.flatBlack,
      boxShadow: [
        BoxShadow(
          color: AppColor.black,
          blurRadius: LayoutConstants.dimen_36,
          spreadRadius: LayoutConstants.dimen_0,
          offset: Offset(
            LayoutConstants.dimen_0,
            LayoutConstants.dimen_4,
          ),
        ),
      ],
    );

Container dividerLine({
  double? height,
  Color? color,
  EdgeInsets? margin,
}) =>
    Container(
      height: height ?? LayoutConstants.dimen_1.h,
      color: color ?? AppColor.grey25,
      margin: margin,
    );

Spacer spacer() => const Spacer();
