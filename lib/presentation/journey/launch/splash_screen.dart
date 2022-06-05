import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profile/common/constants/app_constants.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/common/constants/png_constants.dart';
import 'package:profile/common/constants/shared_preference_keys_constant.dart';
import 'package:profile/common/constants/svg_constants.dart';
import 'package:profile/common/local_preferences/local_preferences.dart';
import 'package:profile/data/models/user_model.dart';
import 'package:profile/di/injector.dart';
import 'package:profile/presentation/app/route_constants.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_bloc.dart';
import 'package:profile/presentation/common_blocs/authentication_bloc/authentication_event.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _splashTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _splashTimer = Timer(
        AppConstants.splashDuration,
        () => Navigator.pushReplacementNamed(context, RouteConstants.main),
      );
    });
  }

  @override
  void dispose() {
    _splashTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Container(
        alignment: Alignment.center,
        color: AppColor.primaryColor,
        child: _splashImage(),
      ));

  SvgPicture _splashSvg() => SvgPicture.asset(
        SvgConstants.orbLogo,
        color: AppColor.white,
        width: LayoutConstants.dimen_200.r,
        height: LayoutConstants.dimen_200.r,
      );

  Image _splashImage() => Image.asset(
        PngConstants.launcher,
        width: LayoutConstants.dimen_200.r,
        height: LayoutConstants.dimen_200.r,
      );

  String get initialRoute {
    final preference = Injector.resolve<LocalPreferences>();
    final isGuest = preference.get(SharedPreferenceKeys.isGuest);

    if (isGuest == true) {
      return RouteConstants.main;
    }

    final accessToken = preference.get(SharedPreferenceKeys.accessToken);
    final user =
        UserModel.fromJsonString(preference.get(SharedPreferenceKeys.user));
    if (user.email != null) {
      Injector.resolve<AuthenticationBloc>()
          .add(UpdateAccessToken(accessToken: accessToken));
      // ..add(UpdateUser(user: user));
      if (user.interests?.isNotEmpty == true &&
          user.titles?.isNotEmpty == true &&
          user.purposes?.isNotEmpty == true) {
        return RouteConstants.main;
      }
      return RouteConstants.main;
    }
    return RouteConstants.welcome1;
  }
}
