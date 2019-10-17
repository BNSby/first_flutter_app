import 'package:flutter/material.dart';

class Styles {
  static const double _textSizeDefault = 16.0;
  static const double _textSizeLarge = 25.0;
  static const String fontNameDefaut = 'Source Sans Pro';

  static final headerLarge = TextStyle(
      fontSize: _textSizeLarge,
      color: Colors.black,
      fontFamily: fontNameDefaut);
  static final textDefault = TextStyle(
      fontSize: _textSizeDefault,
      color: Colors.black,
      fontFamily: fontNameDefaut);
}
