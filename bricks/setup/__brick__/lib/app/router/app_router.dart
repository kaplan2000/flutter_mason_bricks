import 'package:auto_route/auto_route.dart';
import 'package:{{name}}/features/splash/presentation/pages/splash_page.dart';

part 'app_router.gr.dart';

/// Main application router configuration.
/// Manages all navigation routes using AutoRoute.
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    // Splash screen as the initial route
    AutoRoute(page: SplashRoute.page, initial: true),

    // Add more routes here as features are implemented
  ];
}

