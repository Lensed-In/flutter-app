import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:profile/common/util/app_utils.dart';

AnnotatedRegion<SystemUiOverlayStyle> appScaffold(
        BuildContext context, Widget child, { bool transparent = false}) =>
    AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: transparent ? Colors.transparent : Theme.of(context).scaffoldBackgroundColor,
        statusBarIconBrightness:
            isLightTheme(context) ? Brightness.dark : Brightness.light,
        statusBarBrightness: Theme.of(context).brightness,
      ),
      child: child,
    );
