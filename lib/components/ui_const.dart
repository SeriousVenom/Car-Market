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
}
