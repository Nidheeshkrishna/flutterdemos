import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/responsive_config.dart';

class BgSetter extends StatefulWidget {
  final Widget child;
  const BgSetter({super.key, required this.child});

  @override
  State<BgSetter> createState() => _BgSetterState();
}

class _BgSetterState extends State<BgSetter> {
  @override
  Widget build(BuildContext context) {
    final responsiveData = ResponsiveData.of(context);
    return SizedBox(
      height: responsiveData.screenHeight,
      width: responsiveData.screenWidth,
      child: Stack(
        children: [
          SizedBox(
            height: responsiveData.screenHeight,
            width: responsiveData.screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: SvgPicture.asset(
                    "assets/images/login_bg_top.svg",
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: SvgPicture.asset(
                    "assets/images/login_bg_bottam.svg",
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(23),
            height: responsiveData.screenHeight,
            width: responsiveData.screenWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  widget.child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
