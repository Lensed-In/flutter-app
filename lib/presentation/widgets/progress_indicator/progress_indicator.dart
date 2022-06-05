import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';

Widget linearProgressIndicator(double progress, {double? minHeight}) =>
    ClipRRect(
      borderRadius: borderRadius(),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: minHeight ?? LayoutConstants.dimen_12.h,
      ),
    );

Widget circularProgressIndicator(double progress) => SizedBox(
      width: LayoutConstants.dimen_120.r,
      height: LayoutConstants.dimen_120.r,
      child: CircularProgressIndicator(
        value: progress,
        semanticsLabel: 'Linear progress indicator',
        strokeWidth: LayoutConstants.dimen_12.w,
        backgroundColor: Colors.white,
      ),
    );

Widget circularProgressIndicator0(BuildContext context, double progress, {double? radius}) => CircularPercentIndicator(
  radius: radius ?? LayoutConstants.dimen_72.r,
  lineWidth:LayoutConstants.dimen_12.w,
  percent: progress,
  center: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      headline4(context, '80%', fontWeight: FontWeight.bold),
      caption(context, '16 of 20')
    ],
  ),
  animation: true,
  animationDuration: 1200,
  progressColor: AppColor.progressGreen,
  backgroundColor: Theme.of(context).progressIndicatorTheme.circularTrackColor ?? Colors.white,
  circularStrokeCap: CircularStrokeCap.round,
);

Widget linearProgressIndicator0(BuildContext context, double progress) => LinearPercentIndicator(
  // radius: LayoutConstants.dimen_72.r,
  lineHeight:LayoutConstants.dimen_12.w,
  percent: progress,
  // center: Column(
  //   mainAxisAlignment: MainAxisAlignment.center,
  //   children: [
  //     headline4(context, '60%', fontWeight: FontWeight.bold),
  //     caption(context, '12 of 20')
  //   ],
  // ),
  animation: false,
  animationDuration: 1200,
  progressColor: AppColor.progressGreen,
  backgroundColor: Theme.of(context).progressIndicatorTheme.circularTrackColor ?? Colors.white,
  linearStrokeCap: LinearStrokeCap.roundAll,
  barRadius: const Radius.circular(24),
);
