
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import './colors.dart';

class LightTheme {
  static ThemeData getPhoneTheme() {
    return ThemeData(
      fontFamily: 'Roboto',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: AtcColors.primary,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 96.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: -1.5),
        headline2: TextStyle(
            fontSize: 60.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: -0.5),
        headline3: TextStyle(
            fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.black87),
        headline4: TextStyle(
            fontSize: 34.0, fontWeight: FontWeight.w900, color: Colors.black87),
        headline5: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            color: AtcColors.primaryColor,
            letterSpacing: 0.18),
        headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
            color: AtcColors.primaryColor,
            letterSpacing: 0.15),
        subtitle1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 0.15),
        subtitle2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 0.1),
        bodyText1: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.5),
        bodyText2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.25),
        button: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: AtcColors.secondaryColor,
            letterSpacing: 1.25),
        caption: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.33),
        overline: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            letterSpacing: 1.5),
      ),
      colorScheme: AtcColors.colorScheme,
      iconTheme: const IconThemeData(color: Color(0xff2D363E)),
      dividerTheme: DividerThemeData(
          space: 0, thickness: 1, color: Colors.black.withOpacity(0.12)),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder().copyWith(
          borderSide: UnderlineInputBorder().borderSide.copyWith(
                color: AtcColors.primaryColor,
              ),
        ),
      ),
    );
  }

  static ThemeData getTabletTheme() {
    return ThemeData(
      fontFamily: 'Roboto',
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: AtcColors.primary,
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 120.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: -1.87),
        headline2: TextStyle(
            fontSize: 75.0,
            fontWeight: FontWeight.w700,
            color: Colors.black87,
            letterSpacing: -0.62),
        headline3: TextStyle(
            fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black87),
        headline4: TextStyle(
            fontSize: 42.0, fontWeight: FontWeight.w900, color: Colors.black87),
        headline5: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w900,
            color: AtcColors.primaryColor,
            letterSpacing: 0.23),
        headline6: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: AtcColors.primaryColor,
            letterSpacing: 0.19),
        subtitle1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 0.17),
        subtitle2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            letterSpacing: 0.12),
        bodyText1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.56),
        bodyText2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.5),
        button: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: AtcColors.secondaryColor,
            letterSpacing: 1.43),
        caption: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
            letterSpacing: 0.4),
        overline: TextStyle(
            fontSize: 12.0, fontWeight: FontWeight.w500, color: Colors.black87),
      ),
      colorScheme: AtcColors.colorScheme,
      iconTheme: const IconThemeData(color: Color(0xff2D363E)),
      dividerTheme: DividerThemeData(
          space: 0, thickness: 1, color: Colors.black.withOpacity(0.12)),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder().copyWith(
          borderSide: UnderlineInputBorder().borderSide.copyWith(
                color: AtcColors.primaryColor,
              ),
        ),
      ),
    );
  }

  // pass in the device for testing
  // static ThemeData buildTheme([DeviceScreenType device]) {
  //   if (device == null) {
  //     device = DeviceConfig.deviceScreenType;
  //   }

  //   return device == DeviceScreenType.mobile
  //       ? getPhoneTheme()
  //       : getTabletTheme();
  // }
}
