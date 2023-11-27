import 'package:flutter/material.dart';

class ResponsiveData extends InheritedWidget {
  final double screenWidth;
  final double screenHeight;
  final double textFactor;
  final Orientation orientation;
  final BuildContext context;

  const ResponsiveData({
    Key? key, // Fix the key parameter here
    required this.screenWidth,
    required this.screenHeight,
    required this.textFactor,
    required this.orientation,
    required this.context,
    required Widget child,
  }) : super(key: key, child: child); // Use key parameter correctly

  static ResponsiveData of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ResponsiveData>()!;
  }

  @override
  bool updateShouldNotify(covariant ResponsiveData oldWidget) {
    double? screenWidthAdjusted = 0.0;

    double? screenHeightAdjusted = 0.0;
    double? textFactorcalculated = 0.0;

    double safeAreaHorizontal;

    double safeAreaVertical;
    if (orientation == Orientation.portrait) {
      screenWidthAdjusted =
          isTablet() ? screenWidth.clamp(3.5, 4.5) : screenWidth.clamp(3, 4);
      screenHeightAdjusted = screenHeight;
    } else {
      screenHeightAdjusted = screenWidth;
      screenWidthAdjusted =
          isTablet() ? screenHeight.clamp(3.5, 4.5) : screenHeight.clamp(3, 4);
    }
    if (isTablet()) {
      textFactorcalculated = 0.5;
    } else {
      textFactorcalculated = 2.0;
    }

    safeAreaHorizontal = MediaQuery.paddingOf(context).left + MediaQuery.paddingOf(context).right;
    safeAreaVertical = MediaQuery.paddingOf(context).top +
        MediaQuery.paddingOf(context).bottom;
    // Check if any of the properties that affect the layout have changed.
    return (screenWidthAdjusted - safeAreaHorizontal) / 100 !=
            oldWidget.screenWidth ||
        screenHeightAdjusted != oldWidget.screenHeight ||
        textFactorcalculated != oldWidget.textFactor ||
        orientation != oldWidget.orientation;
  }

  bool isTablet() {
    return screenHeight >= 900 && screenWidth >= 600;
  }
}
