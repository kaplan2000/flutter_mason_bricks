import 'dart:io';
import 'package:mason/mason.dart';

// Version: 0.1.1-fix
void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final flowName = context.vars['flow_name'] as String;
  final hasRemote = context.vars['has_remote'] as bool;
  final hasMock = context.vars['has_mock'] as bool;

  // Using the snakeCase extension from package:mason
  final featureSnake = featureName.snakeCase;
  final flowSnake = flowName.snakeCase;

  if (!hasRemote) {
    final remoteFile = File('lib/features/$featureSnake/data/datasources/${featureSnake}_${flowSnake}_remote_datasource.dart');
    if (remoteFile.existsSync()) {
      remoteFile.deleteSync();
    }
  }

  if (!hasMock) {
    final mockFile = File('lib/features/$featureSnake/data/datasources/${featureSnake}_${flowSnake}_mock_datasource.dart');
    if (mockFile.existsSync()) {
      mockFile.deleteSync();
    }
  }
}
