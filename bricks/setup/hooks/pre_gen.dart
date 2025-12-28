import 'dart:io';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';

void run(HookContext context) {
  final file = File('pubspec.yaml');
  if (file.existsSync()) {
    final content = file.readAsStringSync();
    final doc = loadYaml(content) as YamlMap;
    final projectName = doc['name'] as String?;
    if (projectName != null) {
      context.vars['name'] = projectName;
    }
  }
}

