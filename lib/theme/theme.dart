
import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade200,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade400,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade900,
      
    )
);

ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade800,
      secondary: Colors.grey.shade700,
      tertiary: Colors.grey.shade800,
      inversePrimary: Colors.grey.shade200,
      
    )
);