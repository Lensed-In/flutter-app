import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';

class PostItemCard extends StatefulWidget {
  final dynamic post;
  final int index;

  const PostItemCard(this.post, this.index, {Key? key}) : super(key: key);

  @override
  State<PostItemCard> createState() => _PostItemCardState();
}

class _PostItemCardState extends State<PostItemCard> {
  dynamic get post => widget.post;

  @override
  Widget build(BuildContext context) {
    // print(post['profile']);
    List<dynamic> media = post['metadata']['media'];
    String? mediaUrl;
    if (media.isNotEmpty) {
      mediaUrl = post['metadata']['media'][0]['original']['url'];
      // print(mediaUrl);
    }
    return Column(
      children: [
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: roundedRectangleBorder16(),
          child: InkWell(
            borderRadius: borderRadius(radius: LayoutConstants.dimen_16.r),
            onTap: () => {
              // Navigator.of(context).pushNamed(
              //   RouteConstants.courseDetail,
              //   arguments: CourseDetails(course: course, heroTag: heroTag),
              // )
            },
            child: Padding(
              padding: padding12(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context, RouteConstants.userProfile, arguments: post['profile'])
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            post['profile']['picture']['original']['url'],
                          ),
                          radius: LayoutConstants.dimen_16.r,
                        ),
                        gap12(h: true),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subtitle2(
                              context,
                              post['profile']['name'] ?? '',
                              fontWeight: FontWeight.bold,
                              // maxLines: 3,
                            ),
                            captionLeft(
                              context,
                              '@${(post['profile']['handle'] ?? '')}',
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  gap8(v: true),
                  subtitle2(context, post['metadata']['content'], maxLines: 50),
                  gap8(v: true),
                  mediaUrl != null
                      ? ClipRRect(
                          borderRadius: roundedBorderRadius(),
                          child: AspectRatio(
                            aspectRatio: 3 / 2,
                            child: CachedNetworkImage(
                              imageUrl: mediaUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
          ),
        ),
        gap12(v: true),
      ],
    );
  }
}
