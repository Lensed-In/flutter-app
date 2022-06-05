import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/widgets/bottom_navigation_bar/app_bottom_navigation_bar_item.dart';
import 'package:profile/presentation/widgets/bottom_navigation_bar/floating_bottom_navigation_bar_body.dart';

class FloatingBottomNavigationBar extends StatelessWidget {
  const FloatingBottomNavigationBar({
    Key? key,
    required this.items,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
    this.dotIndicatorColor,
    this.marginR = const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    this.paddingR = const EdgeInsets.symmetric(vertical: 2),
    this.borderRadius = 32,
  }) : super(key: key);

  /// A list of tabs to display, ie `Home`, `Profile`,`Cart`, etc
  final List<AppBottomNavigationBarItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  /// A convenience field for the margin surrounding the entire widget.
  final EdgeInsets margin;

  /// The padding of each item.
  final EdgeInsets itemPadding;

  /// The transition duration
  final Duration duration;

  /// The transition curve
  final Curve curve;

  /// The color of the Dot indicator.
  final Color? dotIndicatorColor;

  /// margin for the bar to give some radius
  final EdgeInsetsGeometry? marginR;

  /// padding for the bar to give some radius
  final EdgeInsetsGeometry? paddingR;

  /// border radius
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: marginR!,
            // child: Card(
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(borderRadius ?? 32),
            //   ),
              child: Material(
                elevation: LayoutConstants.dimen_16.r,
                borderRadius: BorderRadius.circular(borderRadius!),
                // shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(borderRadius ?? 32),
                //     ),
                color: theme.bottomNavigationBarTheme.backgroundColor,
                child: Container(
                  padding: paddingR,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: FloatingBottomNavigationBarBody(
                        items: items,
                        currentIndex: currentIndex,
                        curve: curve,
                        duration: duration,
                        selectedItemColor: selectedItemColor,
                        theme: theme,
                        unselectedItemColor: unselectedItemColor,
                        onTap: onTap!,
                        itemPadding: itemPadding,
                        dotIndicatorColor: dotIndicatorColor),
                  ),
                ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
