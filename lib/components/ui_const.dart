import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  static const _fontFamily = 'Roboto';
  static const TextStyle mainStyle = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.black,
  );

  static const TextStyle boldStyle = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle appBarButton = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.black,
    fontSize: 18.0,
    // fontWeight: FontWeight.w500,
  );

  static TextStyle descriptionText = TextStyle(
    fontFamily: _fontFamily,
    color: Colors.grey.shade700,
    // fontWeight: FontWeight.w500,
  );
}
