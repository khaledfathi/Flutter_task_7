import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData apply = ThemeData(
    //
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red))),
    scaffoldBackgroundColor: Colors.white,
    //
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent
    ),
    //
    navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      labelTextStyle: MaterialStatePropertyAll(
          TextStyle(color: Colors.black, fontSize: 16)),
      indicatorShape:
          ContinuousRectangleBorder(side: BorderSide(color: Colors.black)),
      indicatorColor: Colors.transparent,
      iconTheme: MaterialStatePropertyAll(IconThemeData(color: Colors.black)),
    ),
    //
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.grey,
    ),
    //
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light(
        background: Colors.deepOrangeAccent,
        onBackground: Colors.white,
        outline: Colors.black,
        onSecondary: Colors.black),
    // colorScheme: const ColorScheme.light(background: Colors.black ,secondary: Colors.white , ),
    // primaryColorLight: Colors.black,
    // primaryColorDark: Colors.white,
    //
    textTheme: const TextTheme(
      // bodySmall: TextStyle(color: Colors.white),
      // bodyMedium: TextStyle(color: Colors.white),
      // bodyLarge: TextStyle(color: Colors.white),
      // displaySmall: TextStyle(color: Colors.white),
      // displayMedium: TextStyle(color: Colors.white),
      // displayLarge: TextStyle(color: Colors.white),
      // headlineSmall: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(
          color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
      // headlineLarge: TextStyle(color: Colors.white),
      // labelSmall: TextStyle(color: Colors.white),
      // labelMedium: TextStyle(color: Colors.white),
      // labelLarg: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.black, fontSize: 14),
      titleMedium: TextStyle(color: Colors.black, fontSize: 18),
      titleLarge: TextStyle(color: Colors.black, fontSize: 20),
    ),
  );
  //
}
