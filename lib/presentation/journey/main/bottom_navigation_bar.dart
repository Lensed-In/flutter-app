import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:profile/common/constants/app_icons.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/localization/languages.dart';
import 'package:profile/presentation/themes/app_colors.dart';
import 'package:profile/presentation/widgets/bottom_navigation_bar/app_bottom_navigation_bar_item.dart';
import 'package:profile/presentation/widgets/bottom_navigation_bar/floating_bottom_navigation_bar.dart';

BottomNavigationBar mainBottomNavigationBar(
  BuildContext context,
  int currentIndex,
  Languages? lang,
  Function(int)? _onItemTapped,
) =>
    BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          Theme.of(context).textTheme.caption?.copyWith(fontSize: 10),
      unselectedLabelStyle:
          Theme.of(context).textTheme.caption?.copyWith(fontSize: 10),
      items: getBottomNavigationBarItem(lang),
      currentIndex: currentIndex,
      onTap: _onItemTapped,
    );

List<BottomNavigationBarItem> getBottomNavigationBarItem(Languages? lang) => [
      BottomNavigationBarItem(
        icon: const Icon(MdiIcons.homeVariantOutline),
        activeIcon: const Icon(MdiIcons.homeVariant),
        label: lang?.home,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.menu_book_outlined),
        activeIcon: const Icon(Icons.menu_book),
        label: lang?.learn,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.people_outline),
        activeIcon: const Icon(Icons.people),
        label: lang?.people,
      ),
      BottomNavigationBarItem(
        icon: const Icon(MdiIcons.briefcaseOutline),
        activeIcon: const Icon(MdiIcons.briefcase),
        label: lang?.jobs,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person_outline),
        activeIcon: const Icon(Icons.person),
        label: lang?.profile,
      ),
    ];

FloatingBottomNavigationBar floatingBottomNavigationBar(
  BuildContext context,
  int currentIndex,
  Function(int)? onItemTapped,
) =>
    FloatingBottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      dotIndicatorColor: Theme.of(context).primaryColor,
      items: getAppBottomNavigationBarItem(context),
    );

List<AppBottomNavigationBarItem> getAppBottomNavigationBarItem(
    BuildContext context) {
  Languages? lang = Languages.of(context);
  return [
    AppBottomNavigationBarItem(
      icon: bnIcon(context, AppIcons.homeOutlined),
      activeIcon: bnIcon(context, AppIcons.home, active: true),
      label: lang?.home,
    ),
    AppBottomNavigationBarItem(
      icon: bnIcon(context, AppIcons.bagOutlined),
      activeIcon: bnIcon(context, AppIcons.bag, active: true),
      label: 'Jobs',
    ),
    AppBottomNavigationBarItem(
      icon: bnIcon(context, AppIcons.personOutlined),
      activeIcon: bnIcon(context, AppIcons.person, active: true),
      label: lang?.profile,
    ),
  ];
}

SvgPicture bnIcon(BuildContext context, String icon, {bool active = false}) =>
    SvgPicture.asset(
      icon,
      width: LayoutConstants.dimen_24.r,
      height: LayoutConstants.dimen_24.r,
      color: active
          ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
          : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
    );
