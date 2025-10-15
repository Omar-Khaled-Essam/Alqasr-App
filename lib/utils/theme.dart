import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppConstants.primaryGold,
        brightness: Brightness.light,
        primary: AppConstants.primaryGold,
        secondary: AppConstants.primaryGoldDark,
        surface: AppConstants.backgroundColor,
        error: AppConstants.errorColor,
      ),
      
      // App Bar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppConstants.backgroundColor,
        foregroundColor: AppConstants.textPrimary,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: AppConstants.subtitleFontSize,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
        iconTheme: const IconThemeData(
          color: AppConstants.textPrimary,
        ),
      ),
      
      // Text Theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.cairo(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppConstants.textPrimary,
        ),
        displayMedium: GoogleFonts.cairo(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppConstants.textPrimary,
        ),
        displaySmall: GoogleFonts.cairo(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
        headlineLarge: GoogleFonts.cairo(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
        headlineMedium: GoogleFonts.cairo(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
        headlineSmall: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
        titleLarge: GoogleFonts.cairo(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppConstants.textPrimary,
        ),
        titleMedium: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppConstants.textPrimary,
        ),
        titleSmall: GoogleFonts.cairo(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppConstants.textPrimary,
        ),
        bodyLarge: GoogleFonts.cairo(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppConstants.textPrimary,
        ),
        bodyMedium: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppConstants.textPrimary,
        ),
        bodySmall: GoogleFonts.cairo(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppConstants.textSecondary,
        ),
        labelLarge: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppConstants.textPrimary,
        ),
        labelMedium: GoogleFonts.cairo(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppConstants.textPrimary,
        ),
        labelSmall: GoogleFonts.cairo(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: AppConstants.textSecondary,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: AppConstants.cardBackground,
        elevation: AppConstants.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        ),
        margin: const EdgeInsets.all(AppConstants.smallPadding),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryGold,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.defaultPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          textStyle: GoogleFonts.cairo(
            fontSize: AppConstants.bodyFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppConstants.primaryGold,
          side: const BorderSide(color: AppConstants.primaryGold),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.largePadding,
            vertical: AppConstants.defaultPadding,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          ),
          textStyle: GoogleFonts.cairo(
            fontSize: AppConstants.bodyFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppConstants.primaryGold,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
            vertical: AppConstants.smallPadding,
          ),
          textStyle: GoogleFonts.cairo(
            fontSize: AppConstants.bodyFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppConstants.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: const BorderSide(color: AppConstants.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: const BorderSide(color: AppConstants.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: const BorderSide(color: AppConstants.primaryGold, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          borderSide: const BorderSide(color: AppConstants.errorColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.defaultPadding,
        ),
        labelStyle: GoogleFonts.cairo(
          color: AppConstants.textSecondary,
          fontSize: AppConstants.bodyFontSize,
        ),
        hintStyle: GoogleFonts.cairo(
          color: AppConstants.textSecondary,
          fontSize: AppConstants.bodyFontSize,
        ),
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppConstants.backgroundColor,
        selectedItemColor: AppConstants.primaryGold,
        unselectedItemColor: AppConstants.textSecondary,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppConstants.borderColor,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
