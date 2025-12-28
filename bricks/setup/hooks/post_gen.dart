import 'dart:io';
import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';

Future<void> run(HookContext context) async {
  final file = File('pubspec.yaml');

  if (!file.existsSync()) {
    context.logger.err('pubspec.yaml not found');
    return;
  }

  final content = file.readAsStringSync();
  final doc = loadYaml(content) as YamlMap;
  final editor = YamlEditor(content);

  void ensureMap(String key) {
    if (!doc.containsKey(key)) {
      editor.update([key], {});
      context.logger.info('Created $key section');
    }
  }

  ensureMap('dependencies');
  ensureMap('dev_dependencies');

  final updatedDoc = loadYaml(editor.toString()) as YamlMap;

  void ensureDependency(String name, String version) {
    final deps = updatedDoc['dependencies'] as YamlMap;
    if (!deps.containsKey(name)) {
      editor.update(['dependencies', name], version);
      context.logger.info('Added dependency: $name');
    }
  }

  void ensureDevDependency(String name, String version) {
    final deps = updatedDoc['dev_dependencies'] as YamlMap;
    if (!deps.containsKey(name)) {
      editor.update(['dev_dependencies', name], version);
      context.logger.info('Added dev dependency: $name');
    }
  }

  ensureDependency('flutter_riverpod', '^3.0.3');
  ensureDependency('freezed_annotation', '^3.1.0');
  ensureDependency('dio', '^5.9.0');
  ensureDependency('get_it', '^9.2.0');
  ensureDependency('auto_route', '^11.1.0');
  ensureDependency('fpdart', '^1.2.0');
  ensureDependency('json_annotation', '^4.9.0');

  ensureDevDependency('build_runner', '^2.10.4');
  ensureDevDependency('freezed', '^3.2.3');
  ensureDevDependency('json_serializable', '^6.11.2');
  ensureDevDependency('auto_route_generator', '^10.4.0');
  ensureDevDependency('change_app_package_name', '^1.5.0');

  file.writeAsStringSync(editor.toString());
  context.logger.success('pubspec.yaml updated successfully');

  // Run flutter pub get
  final pubGetProgress = context.logger.progress('Running flutter pub get');
  try {
    await Process.run('flutter', ['pub', 'get']);
    pubGetProgress.complete('Dependencies installed');
  } catch (e) {
    pubGetProgress.fail('Failed to install dependencies: $e');
  }

  // Run build_runner
  final buildRunnerProgress = context.logger.progress(
    'Running build_runner build --delete-conflicting-outputs',
  );
  try {
    await Process.run('dart', [
      'run',
      'build_runner',
      'build',
      '--delete-conflicting-outputs',
    ]);
    buildRunnerProgress.complete('Code generation complete');
  } catch (e) {
    buildRunnerProgress.fail('Failed to run build_runner: $e');
  }
}
