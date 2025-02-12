import 'package:role_roster/core/constants/imports.dart';

/// Class responsible for initializing the application.
class AppInitializer {
  const AppInitializer._();

  /// Initializes the application by ensuring Flutter widgets are initialized,
  /// configuring the app environment, initializing dependencies, ensuring
  /// screen size, setting up a custom Bloc observer for logging Bloc events and
  /// state changes and initializing dotenv to read/access variable.
  static Future<void> initialize() async {
    // Ensure Flutter widgets are initialized.
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize application-specific dependencies.
    await init();

    // Ensure screen size is initialized for responsive design.
    await ScreenUtil.ensureScreenSize();

    // Lock device orientation in portrait up.
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Initialize the database
    await DatabaseHelper().database;

    // Set up a custom Bloc observer for logging Bloc events and state changes.
    Bloc.observer = AppBlocObserver();
  }
}
