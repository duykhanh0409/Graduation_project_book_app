import 'package:flutter/material.dart';

class AtcColors {
  static const MaterialColor primary = MaterialColor(0xFF012169, {
    50: const Color(0xFFF0F1F6),
    100: const Color(0xFFB3BCD2),
    200: const Color(0xFF8090B4),
    300: const Color(0xFF4D6496),
    400: const Color(0xFF274280),
    500: const Color(0xFF012169),
    600: const Color(0xFF011D61),
    700: const Color(0xFF011856),
    800: const Color(0xFF01144C),
    900: const Color(0xFF000B3B),
  });

  static const MaterialColor secondary = MaterialColor(0xFFE85B00, {
    50: const Color(0xFFFCEBE0),
    100: const Color(0xFFF8CEB3),
    200: const Color(0xFFF4AD80),
    300: const Color(0xFFEF8C4D),
    400: const Color(0xFFEB7426),
    500: const Color(0xFFE85B00),
    600: const Color(0xFFE55300),
    700: const Color(0xFFE24900),
    800: const Color(0xFFDE4000),
    900: const Color(0xFFD82400),
  });

  static const ColorScheme colorScheme = ColorScheme(
      primary: primaryColor,
      primaryVariant: primaryVariant,
      secondary: secondaryColor,
      secondaryVariant: secondaryVariant,
      surface: Color(0xffFFFFFF),
      background: Color(0xffFFFFFF),
      error: Color(0xffB00020),
      onPrimary: Color(0xffFFFFFF),
      onSecondary: Color(0xff000000),
      onSurface: Color(0xff000000),
      onBackground: Color(0xff000000),
      onError: Color(0xffFFFFFF),
      brightness: Brightness.light);

  static const Color searchCardBottomBorderColor = Color(0xFFB3BCD2);
  static const Color shaded_background = Color(0xffF0F1F6);
  static const Color atc_blue_text = Color(0xff012169);
  static const Color atc_list_tile_title = Color(0xDE000000);
  static const Color atc_list_tile_subtitle = Color(0xBD000000);
  static const Color splashColorInkWell = const Color.fromRGBO(1, 33, 105, 0.1);
  static const Color primaryColor = const Color(0xFF012169);
  static const Color primaryVariant = const Color(0xFF011856);
  static const Color secondaryColor = const Color(0xFFE85B00);
  static const Color secondaryVariant = const Color(0xFFE24900);
  static const Color dividerLightColor = const Color(0xFFE1E4ED);

  static const Color fabForegroundColor =
      const Color.fromRGBO(255, 255, 255, 0.74);
  static const Color fabBackgroundColor = const Color.fromRGBO(0, 0, 0, 0.38);
  static const Color fabTextColor = const Color.fromRGBO(255, 255, 255, 0.87);
  static const Color ctaBackgroundColor = const Color.fromRGBO(1, 33, 105, 0.6);

  static const Color atcFilterChipHighlightColor =
      const Color.fromRGBO(0, 0, 0, 0.12);
  static const Color atcFilterChipSelectedColor =
      const Color.fromRGBO(128, 144, 180, 0.38);
  static const Color atcFilterChipSplashColor =
      const Color.fromRGBO(1, 33, 105, 0.1);

  static const Color borderColorIndicator = const Color(0xff939DA8);
  static const Color atcFilterChipDisabledColor =
      const Color.fromRGBO(0, 0, 0, 0.12);
  static const Color atcFilterChipTextDisabledColor =
      const Color.fromRGBO(0, 0, 0, 0.38);
  static const Color vehicleFeatureTitleColor = const Color(0xFF041C6A);

  static const Color disableBorderColor = const Color(0xFFD3D7DB);
  static const Color enableBorderColor = const Color(0xFFB0B8BF);
  static const Color focusBorderColor = const Color(0xFF58B7DF);
  static const Color pressBorderColor = const Color(0xFF011856);
  static const Color errorBorderColor = const Color(0xFFFF788E);
  static const Color successBorderColor = const Color(0xFF09BAA6);
  static const Color hintBorderColor = const Color(0xFFD3D7DB);
  static const Color defaultCheckBoxColor = const Color.fromRGBO(0, 0, 0, 0.6);
  static const Color specTitle = const Color.fromRGBO(0, 0, 0, 0.6);
  static const Color specSubtitle = const Color.fromRGBO(0, 0, 0, 0.87);
  static const Color priceFanSmallText = const Color(0xFF111111);
  static const Color priceFanLinkText = const Color(0xFF005cb0);

  static const Color tabViewUnSelectedTitleColor =
      const Color.fromRGBO(0, 0, 0, 0.6);
  static const Color tabViewSelectedTitleColor =
      const Color.fromRGBO(0, 0, 0, 0.87);
  static const Map<String, Color> interiorExteriorColors = const {
    'beige': const Color(0xFFDDC9AC),
    'black': const Color(0xFF000000),
    'blue': const Color(0xFF005CB9),
    'brown': const Color(0xFF503629),
    'burgundy': const Color(0xFF79242F),
    'charcoal': const Color(0xFF414C58),
    'gold': const Color(0xFFCB9700),
    'gray': const Color(0xFF76777A),
    'green': const Color(0xFF00754A),
    'off white': const Color(0xFFF1E4B2),
    'orange': const Color(0xFFEE7623),
    'pink': const Color(0xFFFA7598),
    'purple': const Color(0xFF863399),
    'red': const Color(0xFFAA182C),
    'silver': const Color(0xFFC8C8C8),
    'tan': const Color(0xFFBC955C),
    'turquoise': const Color(0xFF008FBF),
    'white': const Color(0xFFFFFFFF),
    'yellow': const Color(0xFFFFDD00),
  };

  static const Color modalBodyTextColor = Color.fromRGBO(51, 51, 51, 1);
  static const Color atcSavedSearchColor = Color.fromRGBO(232, 91, 0, 0.38);
}
