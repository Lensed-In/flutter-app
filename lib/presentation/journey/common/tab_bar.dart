import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';

PreferredSize tabBar(
        BuildContext context, TabController tabController, List<Tab> tabs) =>
    PreferredSize(
      preferredSize: Size.fromHeight(LayoutConstants.dimen_40.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: tabs,
          labelStyle: Theme.of(context).textTheme.headline5?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          unselectedLabelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontWeight: FontWeight.normal,
              ),
          indicatorColor: AppColor.transparent,
          labelColor:
              isLightTheme(context) ? Colors.grey[900] : Colors.grey[100],
          unselectedLabelColor:
              isLightTheme(context) ? Colors.grey[700] : Colors.grey[500],
        ),
      ),
    );
