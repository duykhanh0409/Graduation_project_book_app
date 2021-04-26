import 'dart:ui';

import 'package:flutter/material.dart';

import '../styles/colors.dart' show AtcColors;

extension AtcTextTheme on TextTheme {
  TextStyle get subtitle3 => const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      letterSpacing: 0.09);
  TextStyle get subtitle3Tablet => const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
      letterSpacing: 0.1);

  TextStyle get bodyText3 => const TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
      letterSpacing: 0.21);

  TextStyle get bodyText3Tablet => const TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Colors.black87,
      letterSpacing: 0.25);

  TextStyle get headline7 => const TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w900,
      color: AtcColors.primaryColor,
      letterSpacing: 0.12);

  TextStyle get headline7Tablet => const TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w900,
      color: AtcColors.primaryColor,
      letterSpacing: 0.15);
}

extension AtcTextStyle on TextStyle {
  /// Gets the high emphasis version of this style
  TextStyle get highEmphasis => this;

  /// Gets the medium emphasis version of this style
  TextStyle get mediumEmphasis => copyWith(
        color: color.withOpacity(0.6),
      );

  /// Gets the disabled version of this style
  TextStyle get disabled => copyWith(
        color: color.withOpacity(0.38),
      );
}
