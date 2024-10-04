import 'package:e_library_ciheul/shared/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData defaultTheme() {
  return ThemeData().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
    appBarTheme: AppBarTheme(
      elevation: 0.6,
      titleTextStyle: GoogleFonts.poppins(
        color: textColor,
      ),
      backgroundColor: cardBackground,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actionsIconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey,
      selectedItemColor: primaryColor,
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey,
      labelColor: Colors.blueGrey[900],
    ),
    iconTheme: IconThemeData(
      color: textColor,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.mulish(
        color: textColor,
      ),
      titleMedium: GoogleFonts.mulish(
        color: textColor,
      ),
      titleLarge: GoogleFonts.mulish(
        color: textColor,
      ),
      bodyLarge: GoogleFonts.mulish(
        color: textColor,
      ),
      bodySmall: GoogleFonts.mulish(
        color: textColor,
      ),
      bodyMedium: GoogleFonts.mulish(
        color: textColor,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 4,
      ),
      hoverColor: Colors.transparent,
      errorMaxLines: 1,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: primaryColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: dangerColor),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.grey[300]!,
        ),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          )),
      filled: true,
      fillColor: inputColor,
    ),
    cardTheme: CardTheme(
      elevation: 0.6,
      color: cardBackground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 0.4,
          color: Colors.grey[300]!,
        ),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: Colors.blueGrey,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    dataTableTheme: DataTableThemeData(
      dataTextStyle: TextStyle(
        color: textColor,
      ),
      headingRowColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.grey[200]!;
          }
          return Colors.grey[300]!;
        },
      ),
      headingTextStyle: const TextStyle(),
      dataRowColor: WidgetStateProperty.resolveWith<Color>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.grey[200]!;
          }
          return Colors.white;
        },
      ),
      dataRowMinHeight: 48,
    ),
  );
}
