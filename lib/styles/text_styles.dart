import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// A class for adding text styles in the app that are not part of the main theme
class AtcTextStyles {
  static const TextStyle BOTTOM_NAVIGATION_TEXT_STYLE = TextStyle(
    height: 1,
    letterSpacing: 0.18,
    fontWeight: FontWeight.bold,
    fontSize: 12,
    fontFamily: 'Roboto Black',
  );

  static const TextStyle KEYWORD_SEARCH_TEXT_STYLE = TextStyle(
    color: Colors.white,
    height: 1,
    letterSpacing: 0.2,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    fontFamily: 'Roboto Black',
  );
}
