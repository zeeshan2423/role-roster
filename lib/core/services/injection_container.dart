/// File: injection_container.dart
/// Description: Service Locator for Dependency Injection.
library;

import 'package:role_roster/core/constants/imports.dart';

/// Service Locator instance for dependency injection.
final sl = GetIt.instance;

/// Initializes the dependency injection by registering factories and
/// singletons.
Future<void> init() async {
  sl
    // Register EmployeeCubit as a factory, providing dependencies.
    ..registerFactory(EmployeeCubit.new);
}
