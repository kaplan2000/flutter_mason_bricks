import 'package:flutter/material.dart';
import 'package:{{name}}/app/router/app_router.dart';
import 'package:{{name}}/app/themes/app_theme.dart';
import 'package:{{name}}/core/di/injector.dart';

/// Root application widget.
/// Configures the MaterialApp with routing and theming.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<AppRouter>();

    return MaterialApp.router(
      title: '{{name.pascalCase()}}',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      routerConfig: router.config(),
    );
  }
}

