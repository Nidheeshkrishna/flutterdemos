import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lord_krishna_builders_app/app_configs/app_colors/app_colors.dart';

class AppTheme {
  ThemeData getAppThemeDark() {
    TextTheme myTextTheme = GoogleFonts.urbanistTextTheme()
        .apply(fontSizeFactor: 1.0, bodyColor: Colors.black);

    return ThemeData(
        useMaterial3: true,
        primarySwatch: const MaterialColor(0xFF54A8DF, AppColors.primarySwatch),
        primaryColor: AppColors.primaryColor,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        scaffoldBackgroundColor: AppColors.kWhite,
        textTheme: myTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.kWhite),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 15, color: AppColors.kWhite)),
          // Makes all my ElevatedButton green
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.kButtonColor),
        )),
        
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: AppColors.ktitleColor),
            actionsIconTheme: const IconThemeData(color: AppColors.ktitleColor),
            centerTitle: false,
            elevation: 10,
            titleTextStyle: TextStyle(
                color: AppColors.kAppBartitleColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: GoogleFonts.urbanist().fontFamily)),
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch:
                    const MaterialColor(0xFF54A8DF, AppColors.primarySwatch))
            .copyWith(background: AppColors.primaryColor));
  }

  ThemeData getAppThemeLight() {
    TextTheme myTextTheme = GoogleFonts.urbanistTextTheme()
        .apply(fontSizeFactor: 1.0, bodyColor: Colors.black);
    return ThemeData(
        useMaterial3: true,
        primarySwatch: const MaterialColor(0xFF54A8DF, AppColors.primarySwatch),
        primaryColor: AppColors.primaryColor,
        fontFamily: GoogleFonts.urbanist().fontFamily,
        scaffoldBackgroundColor: AppColors.kWhite,
        textTheme: myTextTheme,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
          foregroundColor: MaterialStateProperty.all<Color>(AppColors.kWhite),
          textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 15, color: AppColors.kWhite)),
          // Makes all my ElevatedButton green
          backgroundColor:
              MaterialStateProperty.all<Color>(AppColors.kButtonColor),
        )),
        appBarTheme: AppBarTheme(
            iconTheme: const IconThemeData(color: AppColors.kAppBartitleColor),
            actionsIconTheme: const IconThemeData(color: AppColors.ktitleColor),
            centerTitle: false,
            elevation: 10,
            titleTextStyle: TextStyle(
                color: AppColors.kAppBartitleColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: GoogleFonts.urbanist().fontFamily)),
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch:
                    const MaterialColor(0xFF54A8DF, AppColors.primarySwatch))
            .copyWith(background: AppColors.primaryColor));
  }
}
