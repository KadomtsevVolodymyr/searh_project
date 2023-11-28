import 'package:flutter/material.dart';
import 'package:search_project/core/theme/solution_theme.dart';
import 'package:search_project/core/theme/theme_palette/default_palette.dart';
import 'package:search_project/generated/assets/fonts.gen.dart';

abstract class VendorOneCoreTheme implements SolutionTheme {
  @override
  SolutionSizeTheme sizeTheme = SolutionSizeTheme(
    iconSize: 36.0,
    buttonBorderRadius: 12.0,
  );

  SolutionDataTheme dataTheme = SolutionDataTheme(
    privacyPolicy: 'privacyPolicyURL',
  );
}

class VendorThemeOneLight extends VendorOneCoreTheme {
  @override
  ThemeData get themeData {
    return ThemeData(
      disabledColor: DefaultPalette.deepPurpleAccent,
      primaryColor: DefaultPalette.deepPurpleAccent,
      dividerColor: DefaultPalette.deepPurpleAccent,
      unselectedWidgetColor: DefaultPalette.deepPurpleAccent,
      hintColor: DefaultPalette.deepPurpleAccent,
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        color: DefaultPalette.deepPurpleAccent,
      ),
      iconTheme: const IconThemeData(color: DefaultPalette.deepPurpleAccent),
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DefaultPalette.deepPurpleAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: DefaultPalette.deepPurpleAccent, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: DefaultPalette.deepPurpleAccent, width: 2.0),
        ),
      ),
      scaffoldBackgroundColor: DefaultPalette.whiteBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DefaultPalette.whiteBackground,
        elevation: 8.0,
        selectedItemColor: DefaultPalette.whiteBackground,
        unselectedItemColor: DefaultPalette.whiteBackground,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 96,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 60,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 48,
          letterSpacing: 0,
        ),
        headlineMedium: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          letterSpacing: 0,
        ),
        headlineSmall: TextStyle(
          color: DefaultPalette.accentPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontSize: 20,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          color: DefaultPalette.textPlaceholder,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 0.25,
        ),
        labelLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 1.25,
        ),
        labelSmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontSize: 10,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ).apply(fontFamily: FontFamily.raleway),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: DefaultPalette.kToDark)
          .copyWith(background: DefaultPalette.deepPurpleAccent)
          .copyWith(error: DefaultPalette.redAccent),
    );
  }

  @override
  SolutionAssetsTheme get assetsTheme =>
      SolutionAssetsTheme(logoImage: 'logo2/', envelopeImage: 'assetsTheme');

  @override
  SolutionColorTheme get colorTheme => SolutionColorTheme(
        gray1Color: Colors.greenAccent,
        grayColor: Colors.indigo,
      );
}

class VendorThemeOneDark extends VendorOneCoreTheme {
  @override
  ThemeData get themeData {
    return ThemeData(
      disabledColor: DefaultPalette.deepPurpleAccent,
      primaryColor: DefaultPalette.deepPurpleAccent,
      dividerColor: DefaultPalette.deepPurpleAccent,
      unselectedWidgetColor: DefaultPalette.deepPurpleAccent,
      hintColor: DefaultPalette.deepPurpleAccent,
      appBarTheme: const AppBarTheme(
        shadowColor: Colors.black,
        color: DefaultPalette.deepPurpleAccent,
      ),
      iconTheme: const IconThemeData(color: DefaultPalette.deepPurpleAccent),
      inputDecorationTheme: const InputDecorationTheme(
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: DefaultPalette.deepPurpleAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: DefaultPalette.deepPurpleAccent, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: DefaultPalette.deepPurpleAccent, width: 2.0),
        ),
      ),
      scaffoldBackgroundColor: DefaultPalette.whiteBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: DefaultPalette.whiteBackground,
        elevation: 8.0,
        selectedItemColor: DefaultPalette.whiteBackground,
        unselectedItemColor: DefaultPalette.whiteBackground,
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 96,
          letterSpacing: -1.5,
        ),
        displayMedium: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 60,
          letterSpacing: -0.5,
        ),
        displaySmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 48,
          letterSpacing: 0,
        ),
        headlineMedium: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0,
        ),
        headlineSmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontSize: 24,
          letterSpacing: 0.18,
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontSize: 20,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.15,
        ),
        titleSmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 0.1,
        ),
        bodyLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 16,
          letterSpacing: 0.5,
        ),
        bodyMedium: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: 0.25,
        ),
        labelLarge: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w500,
          fontSize: 14,
          letterSpacing: 1.25,
        ),
        bodySmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          letterSpacing: 0.4,
        ),
        labelSmall: TextStyle(
          color: DefaultPalette.textPrimary,
          fontSize: 10,
          letterSpacing: 1.5,
          fontWeight: FontWeight.w500,
        ),
      ).apply(fontFamily: FontFamily.raleway),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return DefaultPalette.deepPurpleAccent;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return DefaultPalette.deepPurpleAccent;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return DefaultPalette.deepPurpleAccent;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return DefaultPalette.deepPurpleAccent;
          }
          return null;
        }),
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: DefaultPalette.kToDark)
          .copyWith(background: DefaultPalette.deepPurpleAccent)
          .copyWith(
            error: DefaultPalette.redAccent,
          ),
    );
  }

  @override
  SolutionAssetsTheme get assetsTheme =>
      SolutionAssetsTheme(logoImage: 'logo/', envelopeImage: 'envelope');

  @override
  SolutionColorTheme get colorTheme =>
      SolutionColorTheme(gray1Color: Colors.grey, grayColor: Colors.indigo);
}
