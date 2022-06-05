import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/common/constants/layout_constants.dart';
import 'package:profile/presentation/journey/common/ui_utils.dart';
import 'package:profile/presentation/widgets/bottom_navigation_bar/app_bottom_navigation_bar_item.dart';

class FloatingBottomNavigationBarBody extends StatelessWidget {
  const FloatingBottomNavigationBarBody({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.curve,
    required this.duration,
    required this.selectedItemColor,
    required this.theme,
    required this.unselectedItemColor,
    required this.onTap,
    required this.itemPadding,
    required this.dotIndicatorColor,
    this.enablePaddingAnimation = false,
  }) : super(key: key);

  final List<AppBottomNavigationBarItem> items;
  final int currentIndex;
  final Curve curve;
  final Duration duration;
  final Color? selectedItemColor;
  final ThemeData theme;
  final Color? unselectedItemColor;
  final Function(int p1) onTap;
  final EdgeInsets itemPadding;
  final Color? dotIndicatorColor;
  final bool enablePaddingAnimation;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final item in items)
          TweenAnimationBuilder<double>(
            tween: Tween(
              end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
            ),
            curve: curve,
            duration: duration,
            builder: (context, t, _) {
              final _selectedColor =
                  theme.bottomNavigationBarTheme.selectedItemColor;
              final _unselectedColor =
                  theme.bottomNavigationBarTheme.unselectedItemColor;

              return Material(
                color: Color.lerp(Colors.transparent, Colors.transparent, t),
                child: InkWell(
                  radius: LayoutConstants.dimen_12.r,
                  borderRadius: BorderRadius.circular(LayoutConstants.dimen_12.r),
                  onTap: () => onTap.call(items.indexOf(item)),
                  focusColor: _selectedColor?.withOpacity(0.1),
                  highlightColor: _selectedColor?.withOpacity(0.1),
                  splashColor: _selectedColor?.withOpacity(0.1),
                  hoverColor: _selectedColor?.withOpacity(0.1),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Padding(
                        padding: itemPadding -
                            (enablePaddingAnimation
                                ? EdgeInsets.only(right: itemPadding.right * t)
                                : EdgeInsets.zero),
                        child: Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.topEnd,
                              children: [
                                IconTheme(
                                  data: IconThemeData(
                                    color: Color.lerp(
                                        _unselectedColor, _selectedColor, t),
                                    size: 24,
                                  ),
                                  child: t == 1.0 ? item.activeIcon : item.icon,
                                ),
                              ],
                            ),
                            subtitle2(
                              context,
                              item.label,
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Color.lerp(
                                  _unselectedColor, _selectedColor, t),
                            )
                          ],
                        ),
                      ),
                      item.badgeLabel != null
                          ? Padding(
                              padding: padding8()
                                  .copyWith(top: LayoutConstants.dimen_2.h),
                              child: CircleAvatar(
                                radius: LayoutConstants.dimen_9.r,
                                backgroundColor: theme
                                    .bottomNavigationBarTheme.backgroundColor,
                                child: CircleAvatar(
                                  radius: LayoutConstants.dimen_7.r,
                                  backgroundColor: Colors.red[400],
                                  child: caption(
                                    context,
                                    item.badgeLabel,
                                    fontSize: 8,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      // ClipRect(
                      //   child: SizedBox(
                      //     height: 40,
                      //     child: Align(
                      //       alignment: Alignment.bottomCenter,
                      //       widthFactor: t,
                      //       child: Padding(
                      //         padding: EdgeInsets.only(
                      //             left: itemPadding.right / 0.63,
                      //             right: itemPadding.right),
                      //         child: DefaultTextStyle(
                      //           style: TextStyle(
                      //             color: Color.lerp(
                      //                 _selectedColor.withOpacity(0.0),
                      //                 _selectedColor,
                      //                 t),
                      //             fontWeight: FontWeight.w600,
                      //           ),
                      //           child: CircleAvatar(
                      //               radius: 2.5,
                      //               backgroundColor:
                      //                   dotIndicatorColor ?? _selectedColor),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
