/// File: strings.dart
/// Description: Centralized class containing string constants used in the
/// application.
library;

/// Centralized class containing string constants used in the application.
class AppStrings {
  const AppStrings._(); // Private constructor to prevent instantiation.

  /// The title of the application.
  static String get appTitle => 'Role Roster';

  /// App bar title of the employee screen.
  static String get employeeTitle => 'Employee List';

  /// Text to display when no employee record is found in the employee screen.
  static String get noEmployee => 'No employee record found';
}
