import '../models/{{flow_name.snakeCase()}}_model.dart';

/// Abstract repository for {{feature_name.titleCase()}} {{flow_name.titleCase()}}
abstract class {{feature_name.pascalCase()}}Repository {
  // TODO: Add repository methods
  Future<{{flow_name.pascalCase()}}Model> get{{flow_name.pascalCase()}}();
}

