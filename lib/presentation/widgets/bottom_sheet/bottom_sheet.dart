import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';

showAppBottomSheet(BuildContext context, Widget widget,
    {EdgeInsets? padding, double? heightFactor}) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(LayoutConstants.dimen_24.r),
    ),
    builder: (BuildContext context) => FractionallySizedBox(
      heightFactor: heightFactor,
      child: Wrap(
        children: [
          Column(
            children: [
              divider(
                  width: LayoutConstants.dimen_64.w,
                  height: LayoutConstants.dimen_3.h,
                  margin: EdgeInsets.only(top: LayoutConstants.dimen_4.h)),
              Container(padding: padding ?? padding24(), child: widget),
            ],
          ),
        ],
      ),
    ),
  );
}
