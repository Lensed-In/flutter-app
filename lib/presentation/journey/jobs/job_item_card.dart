import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/util/color_utils.dart';
import 'package:profile/domain/entities/job_entity.dart';
import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/themes/app_colors.dart';

class JobItemCard extends StatefulWidget {
  final dynamic job;
  final int index;

  const JobItemCard(this.job, this.index, {Key? key}) : super(key: key);

  @override
  State<JobItemCard> createState() => _JobItemCardState();
}

class _JobItemCardState extends State<JobItemCard> {
  dynamic get job => widget.job;

  @override
  Widget build(BuildContext context) {
    String jobJson = job?['metadata']?['content'] ?? '{}';

    JobEntity jobEntity = JobEntity.fromJson(jsonDecode(jobJson.replaceAll('\n', '')));
    print(jobEntity);
    // List<dynamic> media = post['metadata']['media'];
    // String? mediaUrl;
    // if (media.isNotEmpty) {
    //   mediaUrl = post['metadata']['media'][0]['original']['url'];
    //   // print(mediaUrl);
    // }
    return Column(
      children: [
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: roundedRectangleBorder16(),
          child: InkWell(
            borderRadius: borderRadius(radius: LayoutConstants.dimen_16.r),
            onTap: () => {
              Navigator.of(context).pushNamed(
                RouteConstants.jobDetail,
                arguments: job,
              )
            },
            child: Padding(
              padding: padding12(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      jobEntity.imageURI != null ? ClipRRect(
                        borderRadius: roundedBorderRadius(radius: LayoutConstants.dimen_8.r),
                        child: CachedNetworkImage(
                          imageUrl: jobEntity.imageURI ?? '',
                          height: LayoutConstants.dimen_48.r,
                          width: LayoutConstants.dimen_48.r,
                        ),
                      ) : Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape:
                        roundedRectangleBorder(radius: LayoutConstants.dimen_8.r),
                        color: ColorUtils.stringToColor(jobEntity.organization ?? ''),
                        child: Container(
                          width: LayoutConstants.dimen_48.r,
                          height: LayoutConstants.dimen_48.r,
                          child: Center(
                            child: subtitle1(
                              context,
                              (jobEntity.organization ?? 'JOB').substring(0, 1),
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
                              jobEntity.title ?? '',
                              fontWeight: FontWeight.bold,
                              maxLines: 2,
                            ),
                            captionLeft(
                              context,
                              jobEntity.organization ?? '',
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  gap4(v: true),
                  Wrap(children: [
                    chip(jobEntity.location ?? 'Remote', Icons.location_on),
                    gap8(h: true),
                    chip(jobEntity.salary ?? "\$150k - \$210k",  Icons.monetization_on),
                  ],),
                  // gap4(v: true),
                  // subtitle2(context, '#design #non #tech #senior #remote #full #time', maxLines: 50),
                ],
              ),
            ),
          ),
        ),
        gap12(v: true),
      ],
    );
  }

  Chip chip(String label, IconData icon) => Chip(
    backgroundColor: AppColor.grey.withOpacity(0.1),
    padding: EdgeInsets.symmetric(
      horizontal: LayoutConstants.dimen_8.w,
      vertical: LayoutConstants.dimen_6.h,
    ),
    avatar: Icon(icon, size: 24,),
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
}
