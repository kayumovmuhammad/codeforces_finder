import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: ThemeData.light().colorScheme.brightness,
    primary: Colors.teal,
    onPrimary: ThemeData.light().colorScheme.onPrimary,
    secondary: const Color.fromARGB(255, 31, 31, 31),
    onSecondary: ThemeData.light().colorScheme.onSecondary,
    error: ThemeData.light().colorScheme.error,
    onError: ThemeData.light().colorScheme.onError,
    surface: ThemeData.light().colorScheme.surface,
    onSurface: ThemeData.light().colorScheme.onSurface,
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),
);
