import 'package:flutter/material.dart';
import 'package:foresight_care/core/constants/app_constants.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'LeagueSpartan',
      
      // Color Scheme
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(AppConstants.primaryBlue),
        brightness: Brightness.light,
        primary: const Color(AppConstants.primaryBlue),
        onPrimary: const Color(AppConstants.white),
        secondary: const Color(AppConstants.primaryBlueLight),
        onSecondary: const Color(AppConstants.white),
        surface: const Color(AppConstants.white),
        onSurface: const Color(AppConstants.textDark),
        background: const Color(AppConstants.backgroundGray),
        onBackground: const Color(AppConstants.textDark),
        error: const Color(AppConstants.errorRed),
        onError: const Color(AppConstants.white),
      ),
      
      // Scaffold Theme
      scaffoldBackgroundColor: const Color(AppConstants.backgroundGray),
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(AppConstants.white),
        foregroundColor: Color(AppConstants.textDark),
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeXLarge,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.textDark),
        ),
      ),
      
      // Text Theme
      textTheme: const TextTheme(
        // Headings
        headlineLarge: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeXXLarge,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.primaryBlue),
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeXLarge,
          fontWeight: FontWeight.w500,
          color: Color(AppConstants.darkBlue),
          height: 1.4,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeLarge,
          fontWeight: FontWeight.w500,
          color: Color(AppConstants.textSecondary),
          height: 1.4,
        ),
        
        // Body Text
        bodyLarge: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeLarge,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.textSecondary),
          height: 1.4,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeMedium,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.primaryBlueLight),
          height: 1.4,
        ),
        bodySmall: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeSmall,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.textGray),
          height: 1.4,
        ),
        
        // Labels
        labelLarge: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeXLarge,
          fontWeight: FontWeight.w600,
          color: Color(AppConstants.white),
          height: 1.2,
        ),
        labelMedium: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeMedium,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.textPlaceholder),
          height: 1.4,
        ),
        labelSmall: TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeSmall,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.textGray),
          height: 1.4,
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(AppConstants.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          borderSide: const BorderSide(
            color: Color(AppConstants.borderGray),
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          borderSide: const BorderSide(
            color: Color(AppConstants.borderGray),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          borderSide: const BorderSide(
            color: Color(AppConstants.primaryBlue),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          borderSide: const BorderSide(
            color: Color(AppConstants.errorRed),
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          borderSide: const BorderSide(
            color: Color(AppConstants.errorRed),
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppConstants.paddingMedium,
          vertical: AppConstants.paddingMedium,
        ),
        labelStyle: const TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeLarge,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.textSecondary),
        ),
        hintStyle: const TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeMedium,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.textPlaceholder),
        ),
        errorStyle: const TextStyle(
          fontFamily: 'LeagueSpartan',
          fontSize: AppConstants.fontSizeSmall,
          fontWeight: FontWeight.w400,
          color: Color(AppConstants.errorRed),
        ),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(AppConstants.primaryBlue),
          foregroundColor: const Color(AppConstants.white),
          elevation: 0,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingXLarge,
            vertical: AppConstants.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          ),
          textStyle: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: AppConstants.fontSizeXLarge,
            fontWeight: FontWeight.w600,
          ),
          minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(AppConstants.errorRedDark),
          backgroundColor: const Color(AppConstants.errorRedLight),
          side: const BorderSide(
            color: Color(AppConstants.errorRed),
            width: 1,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingMedium,
            vertical: AppConstants.paddingSmall,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.borderRadiusSmall),
          ),
          textStyle: const TextStyle(
            fontFamily: 'LeagueSpartan',
            fontSize: AppConstants.fontSizeSmall,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        color: const Color(AppConstants.white),
        elevation: 4,
        shadowColor: Colors.grey.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        margin: const EdgeInsets.all(AppConstants.paddingSmall),
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: Color(AppConstants.borderGray),
        thickness: 1,
        space: 1,
      ),
    );
  }
} 