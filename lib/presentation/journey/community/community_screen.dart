import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/util/url_utils.dart';
import 'package:profile/common/util/widget_utils.dart';
import 'package:profile/localization/languages.dart';
import 'package:profile/presentation/journey/common/app_bar.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({Key? key}) : super(key: key);

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  Languages? lang;

  @override
  Widget build(BuildContext context) {
    lang = Languages.of(context);
    return Scaffold(
      appBar: appBar(context, lang?.community),
      body: Padding(
        padding: padding20().copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            captionLeft(context,
                'Don’t be a stranger, connect with the community here!',
                fontSize: 16, maxLines: 2),
            gap16(v: true),
            LottieBuilder.network(
              'https://assets8.lottiefiles.com/private_files/lf30_llpflzsi.json',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fitWidth,
            ),
            gap16(v: true),
            Card(
              elevation: 0,
              shape: roundedRectangleBorder16(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSocialHandleItem(context, Icons.discord, 'Join Discord',
                      iconColor: AppColor.discord, onTap: () {
                    launchExternalUrl('https://discord.gg/mpeFuy4Bh7');
                  }),
                  Padding(
                    padding: padding16(v: false),
                    child: divider(),
                  ),
                  buildSocialHandleItem(context, MdiIcons.twitter, 'Twitter',
                      iconColor: AppColor.twitter,
                      subLabel: '@ORB_club', onTap: () {
                    launchExternalUrl('https://twitter.com/orb_club');
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Material buildSocialHandleItem(
    BuildContext context,
    IconData icon,
    String label, {
    Color? iconColor,
    String? subLabel,
    GestureTapCallback? onTap,
  }) =>
      wrapWithMaterialInkWell(
        context,
        Padding(
          padding: padding16(),
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: LayoutConstants.dimen_24.r,
              ),
              gap8(h: true),
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
}
