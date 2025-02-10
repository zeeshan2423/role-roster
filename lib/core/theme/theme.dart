/// File: theme.dart
/// Description: Class responsible for defining the overall theme of the
/// application.
library;

import 'package:role_roster/core/constants/imports.dart';

// Package imports

/// Class responsible for defining the overall theme of the application.
class AppTheme {
  const AppTheme._();

  static final ValueNotifier<bool> isDarkMode = ValueNotifier<bool>(
    PlatformDispatcher.instance.platformBrightness == Brightness.dark,
  );

  /// The primary light theme configuration for the application.
  static final lightTheme = ThemeData(
    // Seed color for the color scheme.
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    ),

    // Brightness for the color scheme.
    brightness: Brightness.light,

    // Enable Material 3 design principles.
    useMaterial3: true,

    // Text theme configuration.
    textTheme: AppTextTheme.textTheme,
  );

  /// The primary dark theme configuration for the application.
  static final darkTheme = ThemeData(
    // Seed color for the color scheme.
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    ),

    // Brightness for the color scheme.
    brightness: Brightness.dark,

    // Enable Material 3 design principles.
    useMaterial3: true,

    // Text theme configuration.
    textTheme: AppTextTheme.textTheme,
  );
}
