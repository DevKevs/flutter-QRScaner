import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.black;
  static const Color darkPrimary = Colors.green;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    //primary color
    primaryColor: primary,
    //appbar theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),
    //TextButton theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: primary),
    ),
    //floatingActionButton
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primary, elevation: 10),
    //ElevatedButtontheme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            shape: const StadiumBorder(),
            elevation: 5)),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    //primary color
    primaryColor: darkPrimary,
    //appbar theme
    appBarTheme: const AppBarTheme(
      color: darkPrimary,
      elevation: 0,
    ),
    //TextButton theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: darkPrimary),
    ),
    //floatingActionButton
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: darkPrimary, elevation: 10),
    //ElevatedButtontheme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: darkPrimary,
            shape: const StadiumBorder(),
            elevation: 5)),
  );
}
