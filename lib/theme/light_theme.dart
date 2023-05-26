import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    background: Colors.white,
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    elevation: 10,
    backgroundColor: Colors.deepPurple.shade400,
    centerTitle: true,
  ),
  buttonTheme: ButtonThemeData(),
  textTheme: TextTheme(
    headlineMedium: TextStyle(
      color: Colors.grey.shade700,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.grey.shade700,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: const TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Colors.grey.shade400,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  ),
);
