import 'package:role_roster/core/constants/imports.dart';

/// Extension for providing additional functionality to the PAGES enum.
extension AppPageExtension on PAGES {
  /// Returns the route path associated with the page.
  String get screenPath {
    switch (this) {
      case PAGES.employee:
        return '/employee';
      case PAGES.addEmployee:
        return 'add-employee';
    }
  }

  /// Returns the screen name associated with the page.
  String get screenName {
    switch (this) {
      case PAGES.employee:
        return 'EMPLOYEE';
      case PAGES.addEmployee:
        return 'ADD EMPLOYEE';
    }
  }

  /// Returns the screen title associated with the page.
  String get screenTitle {
    switch (this) {
      case PAGES.employee:
        return 'Employee';
      case PAGES.addEmployee:
        return 'Add Employee';
    }
  }
}
