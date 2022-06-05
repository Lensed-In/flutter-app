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
import 'package:profile/presentation/journey/jobs/job_item_card.dart';
import 'package:profile/presentation/journey/main/bloc/main_screen_bloc.dart';

class JobsScreen extends StatefulWidget {
  final MainScreenBloc mainScreenBloc;

  const JobsScreen({
    Key? key,
    required this.mainScreenBloc,
  }) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> with AutomaticKeepAliveClientMixin{
  late HomeScreenBloc _homeScreenBloc;

  Languages? lang;

  MainScreenBloc get mainScreenBloc => widget.mainScreenBloc;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _homeScreenBloc = Injector.resolve<HomeScreenBloc>()
      ..add(FetchJobsEvent());
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
                  'Jobs'),
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
    if (state.jobs == null) {
      return [];
    }
    List<dynamic> jobs =
        state.jobs['publications']?['items'] ?? [];

    jobs = jobs.where((job) => job['profile'] != null && job['metadata']?['content'].contains('applicantsLimit')).toList();

    return jobs.isNotEmpty
        ? List.generate(
        jobs.length,
            (index) =>
                JobItemCard(jobs[index], index))
        : [];
  }
}
