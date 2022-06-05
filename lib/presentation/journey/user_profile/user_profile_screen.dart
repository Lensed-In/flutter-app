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
        appBar: commonAppBar(context),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: padding20().copyWith(
              bottom: LayoutConstants.dimen_20.h,
              top: LayoutConstants.dimen_4.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                        profile['picture']['original']['url'] ?? '',
                      ),
                      radius: LayoutConstants.dimen_40.r,
                    ),
                    gap16(h: true),
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
                        buttonOutlinedWithIcon(context, 'Follow', Icons.add_outlined, iconColor: AppColor.primaryColor)
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
