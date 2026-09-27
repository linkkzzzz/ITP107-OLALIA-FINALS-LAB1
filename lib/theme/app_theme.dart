import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// "Cozy Greige" palette — a warm, neutral grey (greige/taupe) instead of
/// the cooler blue-grey, for a softer, more relaxed feel.
class AppColors {
  AppColors._();

  static const Color mist1 = Color(0xFFF7F5F2); // warm ivory fog
  static const Color mist2 = Color(0xFFEDEAE4); // warm pale cloud
  static const Color mist3 = Color(0xFFE0DBD3); // warm soft grey
  static const Color cloud = Color(0xFFCFC7BC); // warm taupe haze
  static const Color slateBlue = Color(0xFF8A7F73); // primary accent (warm mocha-grey)
  static const Color slateBlueDark = Color(0xFF5C5349); // deep accent (espresso-grey)
  static const Color charcoal = Color(0xFF3A352F); // primary text (warm charcoal)
  static const Color graphite = Color(0xFF77706A); // secondary text (warm grey)
}

class AppTheme {
  AppTheme._();

  static ThemeData get theme {
    final base = ThemeData.light(useMaterial3: true);
    final textTheme = GoogleFonts.poppinsTextTheme(base.textTheme).apply(
      bodyColor: AppColors.charcoal,
      displayColor: AppColors.charcoal,
    );

    return base.copyWith(
      scaffoldBackgroundColor: AppColors.mist1,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.slateBlue,
        brightness: Brightness.light,
        primary: AppColors.slateBlue,
        secondary: AppColors.slateBlueDark,
        surface: AppColors.mist1,
      ),
      textTheme: textTheme,
      splashFactory: InkRipple.splashFactory,
    );
  }
}
