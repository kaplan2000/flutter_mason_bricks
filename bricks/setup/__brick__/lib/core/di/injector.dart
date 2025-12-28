import 'package:get_it/get_it.dart';
import 'package:{{name}}/app/router/app_router.dart';
import 'package:{{name}}/core/network/dio_client.dart';

/// Global service locator instance.
/// Used for dependency injection throughout the app.
final getIt = GetIt.instance;

/// Initializes and registers all dependencies.
/// Must be called before running the app.
Future<void> setupDependencies() async {
  // Core services
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  // Router
  getIt.registerLazySingleton<AppRouter>(() => AppRouter());

  // Add more dependencies here as features are implemented
  // Example:
  // getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

