import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/constants/svg_constants.dart';
import 'package:profile/common/util/app_utils.dart';
import 'package:profile/common/util/widget_utils.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/widgets/switch/flutter_switch.dart';

AppBar appBar(BuildContext context, String? title,
        {PreferredSizeWidget? bottom, int? maxLines}) =>
    AppBar(
      centerTitle: false,
      toolbarHeight: LayoutConstants.dimen_64.h,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(
            top: LayoutConstants.dimen_8.h, left: LayoutConstants.dimen_4.w),
        child: pageTitle(context, title, maxLines: maxLines),
      ),
      bottom: bottom,
    );

AppBar commonAppBar(
  BuildContext context, {
  IconData? icon,
  String? title,
  PreferredSizeWidget? bottom,
  VoidCallback? onBackPressed,
  bool showBackButton = true,
  IconData? trailingIcon,
  VoidCallback? onTrailingPressed,
  double? elevation,
  Color? backgroundColor,
}) =>
    AppBar(
      elevation: elevation ?? 0,
      centerTitle: true,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: Theme.of(context).iconTheme.color, //change your color here
      ),
      leading: showBackButton
          ? iconButton(
              context, icon, onBackPressed ?? () => Navigator.of(context).pop())
          : null,
      automaticallyImplyLeading: true,
      actions: [
        trailingIcon != null
            ? iconButton(context, trailingIcon, onTrailingPressed)
            : Container(),
        // Padding(
        //   padding: EdgeInsets.only(right: LayoutConstants.dimen_16.w),
        //   child: Center(child: caption(context, 'Skip')),
        // )
      ],
      title: subtitle1(context, title),
      bottom: bottom,
    );

Container iconButton(
  BuildContext context,
  IconData? icon,
  VoidCallback? onBackPressed,
) =>
    Container(
      margin: padding12(v: false).copyWith(right: 0),
      child: IconButton(
        icon: Icon(
          icon ?? Icons.arrow_back,
          size: LayoutConstants.dimen_20.r,
        ),
        onPressed: onBackPressed,
      ),
    );

AppBar profileAppBar(BuildContext context, String? title,
        {PreferredSizeWidget? bottom}) =>
    AppBar(
      centerTitle: false,
      toolbarHeight: LayoutConstants.dimen_64.h,
      title: Card(
        elevation: 0,
        color: AppColor.darkBG,
        child: Container(
          width: LayoutConstants.dimen_32.r,
          height: LayoutConstants.dimen_32.r,
          padding: padding4(),
          child: SvgPicture.asset(
            SvgConstants.logo,
            color: AppColor.white,
          ),
        ),
      ),
      bottom: bottom,
    );

AppBar mainAppBar(BuildContext context, {bool liveStatus = true, callback}) =>
    AppBar(
        centerTitle: false,
        title: Chip(
          padding: padding8(),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  subtitle2(context, "Nilesh's Portfolio", fontSize: 12),
                  caption(context, 'nilesh.myprofile.cc', fontSize: 10)
                ],
              ),
              gap4(h: true),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).iconTheme.color,
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1), // here the desired height
            child: divider(
                color: isLightTheme(context)
                    ? Colors.grey[200]
                    : Colors.grey[850])),
        actions: [
          // Icon(
          //   Icons.account_circle_rounded,
          //   color: Theme.of(context).iconTheme.color,
          // ),
          // CupertinoSwitch(
          //   value: false,
          //   onChanged: (b) => {},
          // ),
          FlutterSwitch(
            width: LayoutConstants.dimen_80.w,
            height: LayoutConstants.dimen_28.h,
            valueFontSize: 12,
            toggleSize: LayoutConstants.dimen_24.r,
            value: liveStatus,
            activeText: 'Live',
            activeTextFontWeight: FontWeight.bold,
            inactiveTextFontWeight: FontWeight.bold,
            inactiveText: 'Offline',
            activeTextColor: AppColor.activeGreen,
            inactiveTextColor: AppColor.grey,
            borderRadius: 30.0,
            // padding: 4,
            activeColor: AppColor.white,
            activeToggleColor: AppColor.activeGreen,
            inactiveColor: AppColor.inactiveGrey.withAlpha(30),
            inactiveToggleColor: AppColor.white,

            showOnOff: true,
            onToggle: callback ?? (b) {},
          ),
          gap16(h: true)
        ]);

SliverAppBar sliverAppBar(
  BuildContext context,
  String? title, {
  PreferredSizeWidget? bottom,
  int? maxLines,
}) =>
    SliverAppBar(
      floating: true,
      // pinned: true,
      centerTitle: false,
      toolbarHeight: LayoutConstants.dimen_48.h,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: EdgeInsets.only(top: LayoutConstants.dimen_20.h),
        child: pageTitle(context, title, maxLines: maxLines),
      ),
      bottom: bottom,
    );

SliverAppBar sliverAppBarWithImage(
  BuildContext context,
  String imgUrl,
  String profilePic, {
  String? title,
  bool isCollapsed = true,
  String? heroTag,
  double? height,
}) =>
    SliverAppBar(
      centerTitle: false,
      expandedHeight: LayoutConstants.dimen_120.h,
      floating: false,
      pinned: true,
      snap: false,
      stretch: true,
      titleSpacing: 0,
      elevation: LayoutConstants.dimen_4.r,
      iconTheme: Theme.of(context).iconTheme,
      leading: circleButton(
        isCollapsed,
        context,
        Icons.arrow_back,
        onTap: () => {Navigator.pop(context)},
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: LayoutConstants.dimen_8.w),
          child: circleButton(isCollapsed, context, Icons.ios_share),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: isCollapsed ? subtitle1(context, title) : null,
        titlePadding: padding16().copyWith(left: LayoutConstants.dimen_44.w),
        background: Stack(
          children: [
            Hero(
              tag: heroTag ?? imgUrl,
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: LayoutConstants.dimen_120.h,
              ),
            ),
            Container(
              height: LayoutConstants.dimen_156.h,
              alignment: Alignment.bottomLeft,
              margin: padding20(v: false),
              child: CircleAvatar(
                radius: LayoutConstants.dimen_40.r,
                backgroundColor: Theme.of(context).backgroundColor,
                child: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(profilePic),
                  radius: LayoutConstants.dimen_36.r,
                ),
              ),
            )
          ],
        ),
      ),
    );

Center circleButton(
  bool isCollapsed,
  BuildContext context,
  IconData iconData, {
  GestureTapCallback? onTap,
}) =>
    Center(
      child: wrapWithMaterialInkWell(
        context,
        CircleAvatar(
          radius: LayoutConstants.dimen_20,
          child: Icon(iconData, color: Theme.of(context).iconTheme.color),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor:
            isCollapsed ? Theme.of(context).backgroundColor : Colors.white,
        borderRadius: borderRadius(radius: LayoutConstants.dimen_48.r),
        elevation: isCollapsed ? 0 : 2,
        onTap: onTap,
      ),
    );
