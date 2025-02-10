import 'package:role_roster/core/constants/imports.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  GoRouterState get goRouterState => GoRouterState.of(this);
}
