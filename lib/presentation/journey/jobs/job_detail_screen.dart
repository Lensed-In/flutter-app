import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/util/color_utils.dart';
import 'package:profile/common/util/url_utils.dart';
import 'package:profile/domain/entities/job_entity.dart';
import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/journey/common/app_bar.dart';
import 'package:profile/presentation/journey/common/app_scaffold.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/widgets/button_widget/button_widgets.dart';
import 'package:profile/presentation/widgets/image/overlap_avatars.dart';

class JobDetailScreen extends StatefulWidget {
  const JobDetailScreen({Key? key}) : super(key: key);

  @override
  State<JobDetailScreen> createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  dynamic job, profile;
  JobEntity? jobEntity;
  String email = '';

  @override
  Widget build(BuildContext context) {
    job = ModalRoute.of(context)!.settings.arguments as dynamic;
    profile = job['profile'];

    String jobJson = job['metadata']?['content'];
    jobEntity = JobEntity.fromJson(jsonDecode(jobJson.replaceAll('\n', '  ')));

    email = (jobEntity?.employer ?? '').replaceAll('.eth', '');

    if (email.length > 20) {
      email =  '${email.substring(0, 5)}...${email.substring(email.length-4, email.length)}';
    }

    email = '$email@ethmail.cc';

    return appScaffold(
        context,
        Scaffold(
          appBar: commonAppBar(context, icon: Icons.close),
          body: _buildBody(),
          bottomNavigationBar: _buildBnb(context),
        ));
  }

  SingleChildScrollView _buildBody() {

    return SingleChildScrollView(
      padding: padding20().copyWith(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          headline5(
            context,
            jobEntity?.title ?? '',
            maxLines: 4,
            fontWeight: FontWeight.bold,
          ),
          gap16(v: true),
          Row(
            children: [
              jobEntity?.imageURI != null
                  ? ClipRRect(
                      borderRadius: roundedBorderRadius(
                          radius: LayoutConstants.dimen_8.r),
                      child: CachedNetworkImage(
                        imageUrl: jobEntity?.imageURI ?? '',
                        height: LayoutConstants.dimen_40.r,
                        width: LayoutConstants.dimen_40.r,
                      ),
                    )
                  : Card(
                      elevation: 0,
                      margin: EdgeInsets.zero,
                      shape: roundedRectangleBorder(
                          radius: LayoutConstants.dimen_8.r),
                      color: ColorUtils.stringToColor(
                          jobEntity?.organization ?? ''),
                      child: Container(
                        width: LayoutConstants.dimen_48.r,
                        height: LayoutConstants.dimen_48.r,
                        child: Center(
                          child: subtitle1(
                            context,
                            (jobEntity?.organization ?? 'JOB').substring(0, 1),
                            color: AppColor.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              gap12(h: true),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    subtitle2(
                      context,
                      jobEntity?.organization ?? '',
                      fontWeight: FontWeight.bold,
                      maxLines: 2,
                    ),
                    captionLeft(
                      context,
                      jobEntity?.location ?? '',
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
          gap8(v: true),
          Wrap(
            children: [
              chip(jobEntity?.location ?? '', Icons.location_on),
              gap8(h: true),
              chip(jobEntity?.salary ?? '', Icons.monetization_on),
            ],
          ),
          gap16(v: true),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: padding2(v: false),
                  child: captionLeft(context, 'POSTED BY', fontSize: 10),
                ),
              ),
              Padding(
                padding: padding2(v: false),
                child: captionLeft(
                  context,
                  '1.2K APPLIED!',
                  fontSize: 10,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                    alignment: Alignment.centerLeft, child: userChip(null)),
              ),
              OverlapAvatars(images),
            ],
          ),
          gap16(v: true),
          Row(
            children: [
              captionLeft(context, 'Apply at: '),
              subtitle2(
                context,
                email,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          gap12(v: true),
          subtitle2(
            context,
            jobEntity?.description ?? '',
            maxLines: 50,
          )
        ],
      ),
    );
  }

  Padding _buildBnb(BuildContext context) {

    return Padding(
      padding: padding24(),
      child: buttonPrimary(
        context,
        'Apply',
        onPress: () => launchExternalUrl('mailto:$email'),
      ),
    );
  }

  Chip chip(String label, IconData icon) => Chip(
        backgroundColor: AppColor.primaryColor.withOpacity(0.2),
        padding: EdgeInsets.symmetric(
          horizontal: LayoutConstants.dimen_8.w,
          vertical: LayoutConstants.dimen_6.h,
        ),
        avatar: Icon(
          icon,
          size: 24,
        ),
        label: Padding(
          padding: padding4(h: false),
          child: subtitle2(
            context,
            label,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      );

  ChoiceChip userChip(dynamic creator1) => ChoiceChip(
        selected: false,
        onSelected: (b) {
          Navigator.pushNamed(
            context,
            RouteConstants.userProfile,
            arguments: profile,
          );
        },
        padding: EdgeInsets.symmetric(
            horizontal: LayoutConstants.dimen_8.w,
            vertical: LayoutConstants.dimen_6.h),
        avatar: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(profile['picture']
                  ?['original']?['url'] ??
              'https://pbs.twimg.com/profile_images/1490782523701481474/DtyJ_8ej_400x400.jpg'),
          radius: LayoutConstants.dimen_24.r,
        ),
        label: Padding(
          padding: padding4(h: false),
          child: subtitle2(
            context,
            profile['handle'],
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      );
}

List<String> images = [
  "https://nileshrathore.com/assets/images/profile.jpg",
  "https://pbs.twimg.com/profile_images/1510703458386468871/NaSbi2BY_400x400.jpg",
  "https://pbs.twimg.com/profile_images/1504424634250321922/KaldzEfO_400x400.png"
];
