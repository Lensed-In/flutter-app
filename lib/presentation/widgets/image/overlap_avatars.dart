import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';

class OverlapAvatars extends StatelessWidget {
  final EdgeInsets? padding;
  final double? avatarRadius;
  final Color? backgroundColor;
  final List<String>? avatarUrls;

  const OverlapAvatars(
    this.avatarUrls, {
    Key? key,
    this.padding,
    this.avatarRadius,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Wrap(
          children: [
            SizedBox(
              width: LayoutConstants.dimen_72.w - (avatarRadius ?? 0),
              height: avatarRadius != null
                  ? ((avatarRadius ?? 0) * 2 + 6)
                  : LayoutConstants.dimen_28.h,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: buildCircleAvatar(context,
                        (avatarUrls?.length ?? 0) > 2 ? avatarUrls![2] : ''),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: buildCircleAvatar(context,
                        (avatarUrls?.length ?? 0) > 1 ? avatarUrls![1] : ''),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: buildCircleAvatar(context,
                        (avatarUrls?.length ?? 0) > 0 ? avatarUrls![0] : ''),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  CircleAvatar buildCircleAvatar(BuildContext context, String imageUrl) =>
      CircleAvatar(
        backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
        child: CircleAvatar(
          radius: avatarRadius ?? LayoutConstants.dimen_12.r,
          backgroundImage: CachedNetworkImageProvider(
            imageUrl,
          ), // Provide your custom image
        ),
      );
}
