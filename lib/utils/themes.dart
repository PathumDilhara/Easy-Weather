import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAThemeMode {
  // Light mode
  // brightness, font family, app bar, text input fields, scaffold bg
  final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  // Dark mode
  //
  final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 21, 21, 21),
  );
}
