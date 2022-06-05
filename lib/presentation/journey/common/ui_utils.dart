import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/util/widget_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/themes/app_text_themes.dart';
import 'package:profile/presentation/widgets/input_text_form_field_widget/input_text_form_field_secondary_widget.dart';
import 'package:profile/presentation/widgets/input_text_form_field_widget/input_text_form_field_widget.dart';

Text pageTitle(
  BuildContext context,
  String? text, {
  Color? color,
  int? maxLines,
}) =>
    Text(
      text ?? '',
      maxLines: maxLines,
      style: Theme.of(context).textTheme.headline4?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
    );

Padding headline4(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  Color? color,
  double? fontSize,
  EdgeInsets? padding,
}) =>
    Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text ?? '',
        style: Theme.of(context).textTheme.headline4?.copyWith(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color,
            ),
      ),
    );

Text headline5(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  int? maxLines,
}) =>
    Text(
      text ?? '',
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: color,
          ),
    );

Text headline55(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  int? maxLines,
  TextAlign? textAlign,
}) =>
    Text(
      text ?? '',
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: AppTextTheme.headline5P5.copyWith(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
      ),
    );

Text headline6(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  TextAlign? textAlign,
  Color? color,
}) =>
    Text(
      text ?? '',
      textAlign: textAlign ?? TextAlign.center,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            fontWeight: fontWeight ?? FontWeight.normal,
            color: color,
          ),
    );

Padding bodyText1(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  Color? color,
  double? fontSize,
  EdgeInsets? padding,
  TextAlign? textAlign,
}) =>
    Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text ?? '',
        textAlign: textAlign ?? TextAlign.left,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: color,
            ),
      ),
    );

Text subtitle1(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  int? maxLines,
  TextAlign? textAlign,
}) =>
    Text(
      text ?? '',
      maxLines: maxLines,
      textAlign: textAlign ?? TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1?.copyWith(
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize,
            color: color,
          ),
    );

Text subtitle2(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  int? maxLines,
}) =>
    Text(
      text ?? '',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context).textTheme.subtitle2?.copyWith(
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize,
            color: color,
          ),
    );

Text caption(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  int? maxLines,
}) =>
    Text(
      text ?? '',
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize,
            color: color,
          ),
    );

Text captionLeft(
  BuildContext context,
  String? text, {
  FontWeight? fontWeight,
  double? fontSize,
  Color? color,
  int? maxLines,
  bool underline = false,
}) =>
    Text(
      text ?? '',
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: Theme.of(context).textTheme.caption?.copyWith(
            fontWeight: fontWeight ?? FontWeight.normal,
            fontSize: fontSize,
            color: color,
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
          ),
    );

Padding inputField(String label,
        {String? hint,
        TextEditingController? controller,
        FocusNode? focusNode,
        EdgeInsets? padding,
        TextInputType? inputType,
        int? minLines,
        int? maxLines,
        bool? multiLines,
        TextInputAction? inputAction}) =>
    Padding(
      padding: padding ?? EdgeInsets.only(bottom: LayoutConstants.dimen_16.h),
      child: InputTextFormField(
        labelString: label,
        hintString: hint,
        inputType: inputType ?? TextInputType.text,
        controller: controller,
        focusNode: focusNode,
        minLines: minLines,
        maxLines: maxLines,
        multiLine: multiLines,
        inputAction: inputAction ?? TextInputAction.next,
      ),
    );

Padding inputFieldSecondary({
  String? label,
  String? hint,
  TextEditingController? controller,
  FocusNode? focusNode,
  EdgeInsets? padding,
  TextInputType? inputType,
  TextAlign? inputTextAlign,
  int? minLines,
  int? maxLines,
  bool? multiLines,
  TextInputAction? inputAction,
  String? initialValue,
  Widget? suffix,
  String? helperString,
  bool showError = false,
  bool isPassword = false,
}) =>
    Padding(
      padding: padding ?? EdgeInsets.only(bottom: LayoutConstants.dimen_16.h),
      child: InputTextFormFieldSecondary(
        labelString: label,
        hintString: hint,
        inputType: inputType ?? TextInputType.text,
        inputTextAlign: inputTextAlign,
        controller: controller,
        focusNode: focusNode,
        maxLines: maxLines,
        inputAction: inputAction ?? TextInputAction.next,
        suffix: suffix,
        helperString: helperString,
        showError: showError,
        initialValue: initialValue,
        obscureInput: isPassword,
        // inputFormatters: [CurrencyInputFormatter()],
      ),
    );

EdgeInsets padding2({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_2.h : 0,
      horizontal: h ? LayoutConstants.dimen_2.w : 0,
    );

EdgeInsets padding4({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_4.h : 0,
      horizontal: h ? LayoutConstants.dimen_4.w : 0,
    );

EdgeInsets padding8({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_8.h : 0,
      horizontal: h ? LayoutConstants.dimen_8.w : 0,
    );

EdgeInsets padding12({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_12.h : 0,
      horizontal: h ? LayoutConstants.dimen_12.w : 0,
    );

EdgeInsets padding16({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_16.h : 0,
      horizontal: h ? LayoutConstants.dimen_16.w : 0,
    );

EdgeInsets padding20({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_20.h : 0,
      horizontal: h ? LayoutConstants.dimen_20.w : 0,
    );

EdgeInsets padding24({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_24.h : 0,
      horizontal: h ? LayoutConstants.dimen_24.w : 0,
    );

EdgeInsets padding32({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_32.h : 0,
      horizontal: h ? LayoutConstants.dimen_32.w : 0,
    );

EdgeInsets padding48({bool v = true, bool h = true}) => EdgeInsets.symmetric(
      vertical: v ? LayoutConstants.dimen_48.h : 0,
      horizontal: h ? LayoutConstants.dimen_48.w : 0,
    );

SizedBox gapVertical(double gap) => SizedBox(
      height: gap,
    );

SizedBox gap2({bool v = false, bool h = false}) => SizedBox(
      height: v ? LayoutConstants.dimen_2.h : 0,
      width: h ? LayoutConstants.dimen_2.w : 0,
    );

SizedBox gap4({bool v = false, bool h = false}) => SizedBox(
      height: v ? LayoutConstants.dimen_4.h : 0,
      width: h ? LayoutConstants.dimen_4.w : 0,
    );

SizedBox gap8({bool v = false, bool h = false}) => SizedBox(
      height: v ? LayoutConstants.dimen_8.h : 0,
      width: h ? LayoutConstants.dimen_8.w : 0,
    );

SizedBox gap12({bool v = false, bool h = false}) => SizedBox(
      height: v ? LayoutConstants.dimen_12.h : 0,
      width: h ? LayoutConstants.dimen_12.w : 0,
    );

SizedBox gap16({bool v = false, bool h = false}) => SizedBox(
      height: v ? LayoutConstants.dimen_16.h : 0,
      width: h ? LayoutConstants.dimen_16.w : 0,
    );

SizedBox gap20({bool v = false, bool h = false}) => gap(
      LayoutConstants.dimen_20,
      v: v,
      h: h,
    );

SizedBox gap24({bool v = false, bool h = false}) => gap(
      LayoutConstants.dimen_24,
      v: v,
      h: h,
    );

SizedBox gap32({bool v = false, bool h = false}) => gap(
      LayoutConstants.dimen_32,
      v: v,
      h: h,
    );

SizedBox gap40({bool v = false, bool h = false}) => gap(
      LayoutConstants.dimen_40,
      v: v,
      h: h,
    );

SizedBox gap48({bool v = false, bool h = false}) => gap(
      LayoutConstants.dimen_48,
      v: v,
      h: h,
    );

SizedBox gap(double size, {bool v = false, bool h = false}) => SizedBox(
      height: v ? size.h : 0,
      width: h ? size.w : 0,
    );

Container divider(
        {double? height, double? width, Color? color, EdgeInsets? margin}) =>
    Container(
      height: height ?? LayoutConstants.dimen_1.h,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        color: color ?? AppColor.grey25.withOpacity(0.1),
        borderRadius:
            BorderRadius.all(Radius.circular(LayoutConstants.dimen_16.r)),
      ),
    );

RoundedRectangleBorder roundedRectangleBorder16() => roundedRectangleBorder(
      radius: LayoutConstants.dimen_16.r,
    );

RoundedRectangleBorder roundedRectangleBorder24() => roundedRectangleBorder(
      radius: LayoutConstants.dimen_24.r,
    );

RoundedRectangleBorder roundedRectangleBorder({double? radius}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        radius ?? LayoutConstants.dimen_8.r,
      ),
    );

BorderRadius borderRadius({double? radius}) {
  Radius radiusCircular = Radius.circular(radius ?? LayoutConstants.dimen_12.r);
  return BorderRadius.all(radiusCircular);
}

BorderRadius topRoundedBorderRadius({double? radius}) {
  Radius radiusCircular = Radius.circular(radius ?? LayoutConstants.dimen_16.r);
  return BorderRadius.only(
    topLeft: radiusCircular,
    topRight: radiusCircular,
  );
}

BorderRadius roundedBorderRadius({double? radius}) {
  Radius radiusCircular = Radius.circular(radius ?? LayoutConstants.dimen_16.r);
  return BorderRadius.all(radiusCircular);
}

BoxDecoration boxDecoration({Color? color, double? radius}) => BoxDecoration(
      border: Border.all(
        color: color ?? AppColor.grey,
      ),
      borderRadius: BorderRadius.circular(radius ?? LayoutConstants.dimen_12.r),
    );

Material buildOptionItem(BuildContext context, IconData icon, String label,
        {Color? iconColor, String? subLabel, GestureTapCallback? onTap}) =>
    wrapWithMaterialInkWell(
      context,
      Padding(
        padding: padding16(),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor,
              size: LayoutConstants.dimen_20.r,
            ),
            gap12(h: true),
            Expanded(
              child: subtitle1(context, label,
                  fontWeight: FontWeight.w500, textAlign: TextAlign.start),
            ),
            caption(context, subLabel)
          ],
        ),
      ),
      borderRadius: borderRadius(),
      onTap: onTap,
    );
