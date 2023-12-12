import 'package:flutter/material.dart';

class DarkTheme {
  static  ThemeData theme = ThemeData(
    textButtonTheme: TextButtonThemeData(style: ButtonStyle(foregroundColor:MaterialStateProperty.all(Colors.red) )),
    scaffoldBackgroundColor: Colors.black,

    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white ,
      backgroundColor: Colors.black,
      centerTitle: true, 
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      headlineMedium: TextStyle(color: Colors.white),
      headlineSmall: TextStyle(color: Colors.white),
      labelLarge: TextStyle(color: Colors.white),
      labelMedium: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white),
      titleSmall: TextStyle(color: Colors.white ,),
    ),

    navigationBarTheme:  const NavigationBarThemeData(
      backgroundColor: Colors.black,
      labelTextStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white  , fontSize: 16 )),
      indicatorShape: ContinuousRectangleBorder(side: BorderSide(color: Colors.white) ),
      indicatorColor: Colors.transparent,
      iconTheme: MaterialStatePropertyAll(IconThemeData(color: Colors.white)),
    ),
  ); 
}