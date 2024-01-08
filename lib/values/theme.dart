import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData themeData = ThemeData(
  inputDecorationTheme: const InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
    ),
  ).copyWith(
    labelStyle: const TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
    ),
  ),
  primaryTextTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
    ),
  ).copyWith(
    bodyMedium: const TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
    ),
  ),
  textTheme: const TextTheme(
    headlineMedium: TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
    ),
  ).copyWith(
    bodyMedium: const TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      // elevation: 1,
      textStyle: const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
      ),
    ).copyWith(
        textStyle: MaterialStateProperty.all(
      const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
      ),
    )),
  ),
  scaffoldBackgroundColor:  Colors.white,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 22,
      color: Color(0xFF222222),
      fontStyle: FontStyle.normal,
    ),
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.black),
  ).copyWith(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor:Colors.transparent, // Status bar brightness (optional)
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.light, // For iOS (dark icons)
    ),
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 22,
      color: Color(0xFF222222),
      fontStyle: FontStyle.normal,
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(secondary: Colors.transparent),
);