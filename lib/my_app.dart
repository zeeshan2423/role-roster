import 'package:role_roster/core/constants/imports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil to provide responsive design capabilities
    return ScreenUtilInit(
      builder: (_, child) {
        // MaterialApp.router is used for a more complex routing configuration
        return ValueListenableBuilder(
          valueListenable: AppTheme.isDarkMode,
          builder: (context, value, child) {
            return MaterialApp.router(
              locale: const Locale('en', 'IN'),

              // App title displayed in the app switcher/task cubit
              title: AppStrings.appTitle,

              // Light Theme configuration using AppTheme class
              theme: AppTheme.lightTheme,

              // Dark Theme configuration using AppTheme class
              darkTheme: AppTheme.darkTheme,

              // Theme mode configuration using AppTheme class
              themeMode: value ? ThemeMode.dark : ThemeMode.light,

              // Router configuration using the GoRouter package
              routeInformationProvider:
                  AppRouter.router.routeInformationProvider,
              routeInformationParser: AppRouter.router.routeInformationParser,
              routerDelegate: AppRouter.router.routerDelegate,
            );
          },
        );
      },
    );
  }
}
