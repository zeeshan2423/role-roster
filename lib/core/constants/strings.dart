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

  /// App bar title of the add employee screen.
  static String get addEmployeeTitle => 'Add Employee Details';

  /// Hint text of the employee name field.
  static String get employeeNameHint => 'Employee name';

  /// Hint text of the select role field.
  static String get selectRoleHint => 'Select role';

  /// Hint text of the to date field.
  static String get noDateHint => 'No date';

  /// Label text of the cancel button.
  static String get cancel => 'Cancel';

  /// Label text of the save button.
  static String get save => 'Save';

  /// Label text of the today button.
  static String get today => 'Today';
}
