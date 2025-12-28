// Basic widget test for the {{name.pascalCase()}} app.
// Tests that the app can be built and displays the splash screen.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:{{name}}/app/app.dart';
import 'package:{{name}}/core/di/injector.dart';

void main() {
  setUpAll(() async {
    // Setup dependencies before running tests
    await setupDependencies();
  });

  testWidgets('App shows splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: App()));

    // Wait for the initial frame to render
    await tester.pumpAndSettle();

    // Verify that the splash screen is displayed
    expect(find.text('Splash'), findsOneWidget);
  });
}

