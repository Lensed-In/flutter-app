import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/di/injector.dart';
import 'package:profile/localization/languages.dart';
import 'package:profile/presentation/journey/common/app_bar.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/journey/home/bloc/home_screen_bloc.dart';
import 'package:profile/presentation/journey/home/publication/post_item_card.dart';
import 'package:profile/presentation/journey/main/bloc/main_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  final MainScreenBloc mainScreenBloc;

  const HomeScreen({
    Key? key,
    required this.mainScreenBloc,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  late HomeScreenBloc _homeScreenBloc;

  Languages? lang;

  MainScreenBloc get mainScreenBloc => widget.mainScreenBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _homeScreenBloc = Injector.resolve<HomeScreenBloc>()
      ..add(FetchHomeScreenDataEvent());
  }

  @override
  void dispose() {
    _homeScreenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    lang = Languages.of(context);

    return _blocConsumer();
  }

  BlocConsumer _blocConsumer() => BlocConsumer<HomeScreenBloc, HomeScreenState>(
        bloc: _homeScreenBloc,
        listener: (context, state) => _onStateChange(state),
        builder: (context, state) => _buildBody(context, state),
      );

  void _onStateChange(HomeScreenState state) {
    // if (state is ChangedPageIndexState) {
    //   FocusScope.of(context).unfocus();
    //   _pageController.jumpToPage(state.currentIndex);
    // }
  }

  NestedScrollView _buildBody(BuildContext context, HomeScreenState state) {
    return NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [
              sliverAppBar(context,
                  'Posts'),
            ],
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    padding16().copyWith(bottom: LayoutConstants.dimen_64.h),
                child: Column(
                  children: generatePostList(state, context),
                ),
              ),
            ],
          ),
        ));
  }

  List<Widget> generatePostList(HomeScreenState state, BuildContext context) {
    if (state.publications == null) {
      return [];
    }
    List<dynamic> posts =
        state.publications['explorePublications']['items'] ?? [];

    posts = posts.where((post) => post['profile'] != null).toList();
    // print('generatePostList');
    // print(posts);
    return posts.isNotEmpty
        ? List.generate(
        posts.length,
            (index) =>
                PostItemCard(posts[index], index))
        : [];
  }
}
