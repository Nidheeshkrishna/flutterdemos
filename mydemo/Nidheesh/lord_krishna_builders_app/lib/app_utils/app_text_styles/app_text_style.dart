import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';
import 'package:lord_krishna_builders_app/app_configs/size_config/app_size_config.dart';

String? fontFamily = GoogleFonts.urbanist().fontFamily;

class AppTextStyle extends TextStyle {
  AppTextStyle.boldTitleStyle({
    double? fontSize,
    Color? color,
  }) : super(
          inherit: false,
          height: 1.2,
          fontSize: fontSize ?? 2 * SizeConfig.textMultiplier,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
          color: color ?? const Color.fromARGB(255, 0, 0, 0),
        );
  AppTextStyle.commonTextStyle({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
  }) : super(
          inherit: false,
          height: 1.2,
          fontSize: fontSize ?? 2 * SizeConfig.textMultiplier,
          fontWeight: fontWeight ?? FontWeight.w500,
          fontFamily: fontFamily,
          color: color ?? AppColors.kAppBartitleColor,
        );

  @override
  AppTextStyle.largeText({
    double? fontSize,
    Color? color,
  }) : super(
          inherit: false,
          height: 1.2,
          fontSize: fontSize ?? 2 * SizeConfig.textMultiplier,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
          color: color ?? AppColors.kAppBartitleColor,
        );
  AppTextStyle.largeTitleStyle({
    double? fontSize,
    Color? color,
  }) : super(
          inherit: false,
          height: 1.2,
          fontSize: fontSize ?? 2 * SizeConfig.textMultiplier,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
          color: color ?? AppColors.kAppBartitleColor,
        );
  AppTextStyle.titleTextStyle({
    double? fontSize,
    Color? color,
  }) : super(
          inherit: false,
          height: 1.2,
          fontSize: fontSize ?? 2 * SizeConfig.textMultiplier,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
          color: color ?? AppColors.kAppBartitleColor,
        );
  AppTextStyle.titleTextStyleMedium({
    double? fontSize,
    Color? color,
  }) : super(
          inherit: false,
          height: 1.2,
          fontSize: fontSize ?? 12 * SizeConfig.textMultiplier,
          fontWeight: FontWeight.bold,
          fontFamily: fontFamily,
          color: color ?? Colors.black,
        );
  AppTextStyle.textFieldAddUser({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) : super(
          inherit: false,
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
          wordSpacing: -2.5,
          fontFamily: fontFamily,
          textBaseline: TextBaseline.alphabetic,
        );

  AppTextStyle.textFieldStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) : super(
          inherit: false,
          color: Colors.grey[200]!,
          fontSize: 2 * SizeConfig.textMultiplier ?? fontSize,
          fontWeight: FontWeight.bold,
          wordSpacing: -2.5,
          letterSpacing: 1.5,
          textBaseline: TextBaseline.alphabetic,
        );
}
