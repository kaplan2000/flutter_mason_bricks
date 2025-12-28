import 'dart:io';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

Future<void> run(HookContext context) async {
  final useAutoRoute = context.vars['use_autoroute'] as bool? ?? false;
  if (!useAutoRoute) return;

  final featureName = context.vars['feature_name'] as String;
  final pageName = context.vars['page_name'] as String;

  final pubspecFile = File('pubspec.yaml');
  if (!pubspecFile.existsSync()) {
    context.logger.err('pubspec.yaml not found');
    return;
  }

  final pubspecContent = pubspecFile.readAsStringSync();
  final pubspecYaml = loadYaml(pubspecContent) as YamlMap;
  final packageName = pubspecYaml['name'] as String;

  final routerFile = File('lib/app/router/app_router.dart');
  if (!routerFile.existsSync()) {
    context.logger.warn('lib/app/router/app_router.dart not found. Skipping route registration.');
    return;
  }

  var content = routerFile.readAsStringSync();

  final pageSnake = pageName.snakeCase;
  final featureSnake = featureName.snakeCase;
  final pagePascal = pageName.pascalCase;
  
  final importLine = "import 'package:$packageName/features/$featureSnake/presentation/pages/${pageSnake}_page.dart';";
  final routeLine = "    AutoRoute(page: ${pagePascal}Route.page),";

  // Add import if it doesn't exist
  if (!content.contains(importLine)) {
    final lastImportIndex = content.lastIndexOf('import ');
    if (lastImportIndex != -1) {
      final endOfLastImport = content.indexOf(';', lastImportIndex) + 1;
      content = content.substring(0, endOfLastImport) + '\n' + importLine + content.substring(endOfLastImport);
    } else {
      // No imports found, prepend
      content = importLine + '\n' + content;
    }
  }

  // Add route if it doesn't exist
  if (!content.contains('${pagePascal}Route.page')) {
    final placeholder = '// Add more routes here as features are implemented';
    if (content.contains(placeholder)) {
      content = content.replaceFirst(placeholder, '$routeLine\n\n    $placeholder');
    } else {
      // Fallback: try to insert before the last ];
      final lastBracketIndex = content.lastIndexOf('];');
      if (lastBracketIndex != -1) {
        content = content.substring(0, lastBracketIndex) + '  ' + routeLine + '\n  ' + content.substring(lastBracketIndex);
      }
    }
  }

  routerFile.writeAsStringSync(content);
  context.logger.success('Registered ${pagePascal}Page in app_router.dart');
}

