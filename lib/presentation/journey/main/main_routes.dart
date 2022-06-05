import 'package:profile/presentation/app/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:profile/presentation/journey/my_profile/my_home_page.dart';
import 'package:profile/presentation/journey/user_profile/user_profile_screen.dart';

import 'main_screen.dart';

abstract class MainRoutes {
  static Map<String, WidgetBuilder> all() => {
        RouteConstants.main: (context) => const MainScreen(),
        RouteConstants.userProfile: (context) => const UserProfileScreen(),
        RouteConstants.myHomePage: (context) => MyHomePage(title: ''),
      };
}
