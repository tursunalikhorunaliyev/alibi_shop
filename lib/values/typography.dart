import 'package:flutter/material.dart';

class AppFonts {
  AppFonts._();

  ///HBold
  static const hh2Bold = TextStyle(
    fontSize: 24,
    height: 28 / 24,
    fontWeight: FontWeight.w700,
    color: Color(0xFF121212),
    fontFamily: AppFontFamilies.plusJakarta,
  );
  static const bb1Regular = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF121212),
    fontFamily: AppFontFamilies.plusJakarta,
  );
  static const bb1Medium = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w500,
    color: Color(0xFF121212),
    fontFamily: AppFontFamilies.plusJakarta,
  );
  static const bb2Medium = TextStyle(
    fontSize: 14,
    height: 22 / 14,
    fontWeight: FontWeight.w500,
    color: Color(0xFF121212),
    fontFamily: AppFontFamilies.plusJakarta,
  );
  static const bb1Semibold = TextStyle(
    fontSize: 16,
    height: 20 / 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF121212),
    fontFamily: AppFontFamilies.plusJakarta,
  );
}

class AppFontFamilies {
  static const plusJakarta = 'PlusJakartaSans';
}
