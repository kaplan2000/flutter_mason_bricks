import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:{{name}}/app/app.dart';
import 'package:{{name}}/core/di/injector.dart';

/// Main entry point for the application.
/// Initializes dependencies and launches the app.
Future<void> main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup dependency injection
  await setupDependencies();

  // Run the app wrapped in ProviderScope for Riverpod
  runApp(const ProviderScope(child: App()));
}

