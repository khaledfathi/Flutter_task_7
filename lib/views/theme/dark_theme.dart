import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData apply = ThemeData(
    //
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.red))),
    scaffoldBackgroundColor: Colors.black,
    //
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
      surfaceTintColor: Colors.transparent
    ),
    //
    navigationBarTheme: const NavigationBarThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.black,
      labelTextStyle: MaterialStatePropertyAll(
          TextStyle(color: Colors.white, fontSize: 16)),
      indicatorShape:
          ContinuousRectangleBorder(side: BorderSide(color: Colors.white)),
      indicatorColor: Colors.transparent,
      iconTheme: MaterialStatePropertyAll(IconThemeData(color: Colors.white)),
    ),
    //
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.grey,
    ),

    //
    // colorScheme: const ColorScheme.dark( background: Colors.white ,secondary: Colors.black , ),
    colorScheme: const ColorScheme.dark(
        background: Colors.deepOrangeAccent,
        outline: Colors.white,
        onSecondary: Colors.white),
    primaryColor: Colors.black,
    // primaryColorLight: Colors.white,
    // primaryColorDark: Colors.black,
    //
    textTheme: const TextTheme(
      // displaySmall: TextStyle(color: Colors.white),
      // displayMedium: TextStyle(color: Colors.white),
      // displayLarge: TextStyle(color: Colors.white),
      // headlineSmall: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      // headlineLarge: TextStyle(color: Colors.white),
      // labelSmall: TextStyle(color: Colors.white),
      // labelMedium: TextStyle(color: Colors.white),
      // labelLarg: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white, fontSize: 14),
      titleMedium: TextStyle(color: Colors.white, fontSize: 18),
      titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      // bodySmall: TextStyle(color: Colors.white),
      // bodyMedium: TextStyle(color: Colors.white),
      // bodyLarge: TextStyle(color: Colors.white),
    ),
  );
  //
}
