import 'package:flutter/material.dart';

class AppBottomNavigationBarItem {
  final Widget icon;
  final String? label;
  final Color? backgroundColor;
  final Widget activeIcon;
  final String? badgeLabel;

  const AppBottomNavigationBarItem({
    required this.icon,
    this.label,
    Widget? activeIcon,
    this.backgroundColor,
    this.badgeLabel,
  }) : activeIcon = activeIcon ?? icon;
}
