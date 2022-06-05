import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/system_chrome.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/di/injector.dart';
import 'package:profile/localization/languages.dart';
import 'package:profile/presentation/journey/common/app_bar.dart';
import 'package:profile/presentation/journey/common/app_scaffold.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/journey/jobs/job_item_card.dart';
import 'package:profile/presentation/journey/user_profile/bloc/user_profile_bloc.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/widgets/button_widget/button_widgets.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late UserProfileBloc _userProfileBloc;
  late ScrollController _scrollController;
  Languages? lang;
  dynamic profile;

  bool get _isSliverAppBarCollapsed {
    return _scrollController.hasClients &&
        _scrollController.offset >
            (LayoutConstants.dimen_172.h - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _userProfileBloc = Injector.resolve<UserProfileBloc>()
      ..add(FetchUserInfoEvent())
      ..add(FetchUserCoursesEvent());
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _userProfileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    lang = Languages.of(context);
    profile = ModalRoute.of(context)!.settings.arguments as dynamic;

    debugPrint(profile.toString());

    return _blocConsumer();
  }

  BlocConsumer _blocConsumer() =>
      BlocConsumer<UserProfileBloc, UserProfileState>(
        bloc: _userProfileBloc,
        listener: (context, state) => _onStateChange(state),
        builder: (context, state) => _buildBody(context, state),
      );

  void _onStateChange(UserProfileState state) {
    // if (state is ChangedPageIndexState) {
    //   FocusScope.of(context).unfocus();
    //   _pageController.jumpToPage(state.currentIndex);
    // }
  }

  AnnotatedRegion<SystemUiOverlayStyle> _buildBody(
      BuildContext context, UserProfileState state) {
    return appScaffold(
      context,
      Scaffold(
        // appBar: commonAppBar(context),
        body: _buildScaffoldBody1(context),
      ),
    );
  }

  SingleChildScrollView _buildScaffoldBody(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: padding20().copyWith(
          bottom: LayoutConstants.dimen_20.h,
          top: LayoutConstants.dimen_4.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _buildChildren(context),
        ),
      ),
    );
  }

  CustomScrollView _buildScaffoldBody1(BuildContext context) {
    String profilePic = profile?['picture']?['original']?['url'] ?? 'https://pbs.twimg.com/profile_images/1490782523701481474/DtyJ_8ej_400x400.jpg';
    String coverPic = profile?['coverPicture']?['original']?['url'] ?? 'https://pbs.twimg.com/profile_banners/1478109975406858245/1645016027/1500x500';

    return CustomScrollView(
      shrinkWrap: true,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        _buildSliverAppBar(context, profile['name'], coverPic, profilePic),
        SliverPadding(
          padding: padding20().copyWith(top: 0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              _buildChildren(context),
            ),
          ),
        ),
      ],
    );
  }

  SliverAppBar _buildSliverAppBar(
          BuildContext context, String? userName, String cover, String profilePic) =>
      sliverAppBarWithImage(context, cover, profilePic,
          title: userName,
          isCollapsed: _isSliverAppBarCollapsed,
          height: LayoutConstants.dimen_80.h
          // heroTag: courseDetails.heroTag,
          );

  List<Widget> _buildChildren(BuildContext context) {
    return [
      Row(
        children: [
          // CircleAvatar(
          //   backgroundImage: CachedNetworkImageProvider(
          //     profile['picture']['original']['url'] ?? '',
          //   ),
          //   radius: LayoutConstants.dimen_40.r,
          // ),
          // gap16(h: true),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headline6(
                context,
                profile['name'] ?? '',
                fontWeight: FontWeight.w900,
                // maxLines: 3,
              ),
              gap2(v: true),
              captionLeft(
                context,
                '@${(profile['handle'] ?? '')}',
                maxLines: 2,
              ),
              gap2(v: true),
              buttonOutlinedWithIcon(context, 'Follow', Icons.add_outlined,
                  iconColor: AppColor.primaryColor)
            ],
          ),
        ],
      ),
      gap8(v: true),
      subtitle2(
        context,
        profile['bio'] ?? '',
        maxLines: 4,
        fontSize: 12,
      ),
      gap16(v: true),
      headline4(
        context,
        'Jobs:',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      gap12(v: true),
      Column(
        children: generateJobList(context),
      )
    ];
  }

  List<Widget> generateJobList(BuildContext context) {
    // if (state.publications == null) {
    //   return [];
    // }
    // List<dynamic> posts =
    //     state.publications['explorePublications']['items'] ?? [];

    // posts = posts.where((post) => post['profile'] != null).toList();

    List<dynamic> posts = [];
    return List.generate(5, (index) => JobItemCard(null, index));

    return posts.isNotEmpty
        ? List.generate(5, (index) => JobItemCard(posts[index], index))
        : [];
  }
}
