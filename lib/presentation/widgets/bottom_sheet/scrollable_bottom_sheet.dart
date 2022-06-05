import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';

showScrollableBottomSheet(BuildContext context, Widget child,
    {EdgeInsets? padding, double? heightFactor}) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) => SizedBox.expand(
      child: DraggableScrollableSheet(
        minChildSize: 0.2,
        initialChildSize: 0.5,
        maxChildSize: 0.85,
        builder: (BuildContext context, scrollController) => Container(
          // color: Theme.of(context).scaffoldBackgroundColor,
          decoration: BoxDecoration(
              color: Theme.of(context).bottomSheetTheme.backgroundColor,
              borderRadius: topRoundedBorderRadius(radius: LayoutConstants.dimen_24.r)),
          child: SingleChildScrollView(
            // padding: padding ?? padding24(),
            clipBehavior: Clip.antiAlias,
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                divider(
                    width: LayoutConstants.dimen_64.w,
                    height: LayoutConstants.dimen_3.h,
                    margin: EdgeInsets.only(top: LayoutConstants.dimen_4.h)),
                Container(
                  padding: padding ?? padding24(),
                  child: child,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
