import 'package:profile/di/injector.dart';
import 'package:profile/localization/languages.dart';
import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/journey/common/app_scaffold.dart';
import 'package:profile/presentation/journey/community/community_screen.dart';
import 'package:profile/presentation/journey/home/home_screen.dart';
import 'package:profile/presentation/journey/main/bloc/main_screen_bloc.dart';
import 'package:profile/presentation/journey/main/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/presentation/journey/my_profile/my_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late MainScreenBloc _mainScreenBloc;

  late PageController _pageController;
  Languages? lang;

  @override
  void initState() {
    super.initState();
    _mainScreenBloc = Injector.resolve<MainScreenBloc>()..add(LoadUserEvent());
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _mainScreenBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    lang = Languages.of(context);
    return appScaffold(context, _blocConsumer(), transparent: true);
  }

  BlocConsumer _blocConsumer() => BlocConsumer<MainScreenBloc, MainScreenState>(
        bloc: _mainScreenBloc,
        listener: (context, state) => _onMainStateChange(state),
        builder: (context, state) => _buildScaffold(state),
      );

  void _onMainStateChange(MainScreenState state) {
    if (state is ChangedPageIndexState) {
      FocusScope.of(context).unfocus();
      _pageController.jumpToPage(state.currentIndex);
    } else if (state is MainScreenLoggedOutState) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        RouteConstants.welcome1,
        (_) => false,
      );
    }
  }

  Scaffold _buildScaffold(MainScreenState state) => Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: getPagesList(_mainScreenBloc),
        ),
        bottomNavigationBar: floatingBottomNavigationBar(
          context,
          state.currentIndex,
          _onItemTapped,
        ),
      );

  void _onItemTapped(int index) {
    _mainScreenBloc.add(ChangePageIndexEvent(index: index));
  }

  List<Widget> getPagesList(MainScreenBloc mainScreenBloc) => [
        HomeScreen(mainScreenBloc: mainScreenBloc),
        Container(),
        MyProfileScreen(mainScreenBloc: mainScreenBloc),
      ];
}
