import 'package:flutter/material.dart';

class PatternTheme {
  PatternTheme._();
// primarySwatch: Color(0xFF131316),
  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        background: Color(0xFF131316),
        primary: Colors.transparent,
        onBackground: Colors.black,
        onPrimary: Colors.white,
        secondary: Colors.yellow,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Color(0xFF131316),
        onSurface: Colors.grey,
      ),
    );
  }
}
