import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Builds the theme from the [brightness].
ThemeData buildTheme(Brightness brightness) {
  final theme = ThemeData(
    brightness: brightness,
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
    ),
  );

  return theme.copyWith(
    // cSpell:ignore inconsolata
    textTheme: GoogleFonts.inconsolataTextTheme(theme.textTheme),
  );
}
