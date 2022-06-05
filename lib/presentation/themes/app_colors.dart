import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

abstract class AppColor {
  AppColor._();

  // Generic Colors
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightBG = Color(0xFFf4f2ff);
  static const Color darkBG = Color(0xFF212121);
  static const Color darkBGDarker = Color(0xFF111111);
  static const Color black = Color(0xFF000000);
  static const Color grey = Color(0xFFABABAB);
  static const Color darkGrey = Color(0xFF494949);
  static const Color lightThemePrimaryTextColor = Color(0xFF494949);
  static const Color darkThemePrimaryTextColor = Color(0xFFF5F5F5);

  static Color white5 = white.withOpacity(0.05);
  static Color white10 = white.withOpacity(0.10);
  static Color white25 = white.withOpacity(0.25);
  static Color white50 = white.withOpacity(0.50);
  static Color black25 = black.withOpacity(0.25);
  static Color grey25 = grey.withOpacity(0.25);
  static Color grey50 = grey.withOpacity(0.50);

  // Style Guide Colors
  static const Color flatBlack = Color(0xFF161723); //rgb 22 23 35

  static const Color flatBlack50 = Color(0x80161723);
  static const Color flatBlack70 = Color(0xB3161723);
  static const Color faqDetailsTextColor = Color(0xFFA5A6B2);

  // Application Colors
  static const Color primaryColor = Color(0xFF8157FC);
  static const Color primaryColorDark = Color(0xFF320f9b);

  static const Color secondaryColor = flatBlack;

  static Color primaryColor10 = primaryColor.withOpacity(0.10);
  static Color primaryColor25 = primaryColor.withOpacity(0.25);
  static Color primaryColor50 = primaryColor.withOpacity(0.50);
  static const Color scaffoldBackgroundColor = white;

  static Color dividerLight = white.withOpacity(0.20);
  static Color dividerDark = black.withOpacity(0.20);

  static const Color inputText = darkGrey;
  static const Color inputHint = flatBlack50;

  static const Color bottomNavIconActive = primaryColor;
  static Color? bottomNavIconInactive = Colors.grey[500];

  static const Color bottomSheetBackground = Color(0xFF34365A);

  static const Color matteYellow = Color(0xFFD9AD38);
  static const Color matteOrange = Color(0xFFe56e42);
  static const Color mattePurple = Color(0xFF927AFC);
  static const Color matteGreen = Color(0xFF1A8F26);
  static const Color mattePink = Color(0xFFDA82AB);
  static const Color mattePaleTeal = Color(0xFF8EC8AD);

  static const Color facebook = Color(0xFF4267B2);
  static const Color google = Color(0xFF4285F4);
  static const Color instagram = Color(0xFFC13584);
  static const Color paypal = Color(0xFF169BD7);
  static const Color pinterest = Color(0xFFE60023);
  static const Color snapchat = Color(0xFFFFFC00);
  static const Color spotify = Color(0xFF1DB954);
  static const Color telegram = Color(0xFF0088CC);
  static const Color twitter = Color(0xFF1DA1F2);
  static const Color viber = Color(0xFF7360F3);
  static const Color whatsapp = Color(0xFF25D366);
  static Color? wikipedia = Colors.grey[900];
  static const Color youtube = Color(0xFFFF0000);

  static const Color linkedin = Color(0xFF0E76A8);
  static const Color stackOverflow = Color(0xFFEF8236);
  static const Color github = Color(0xFF171515);
  static const Color discord = Color(0xFF5865F2);

  static const Color activeGreen = Color(0xFF34c759);
  static const Color inactiveGrey = Color(0xFF787880);

  static const Color progressGreen = Color(0xFF02c1a1);
  static const Color errorRed = Color(0xFFFF5252);
}
