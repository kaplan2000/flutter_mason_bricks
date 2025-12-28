import '../../domain/repositories/{{feature_name.snakeCase()}}_repository.dart';
import '../../domain/models/{{flow_name.snakeCase()}}_model.dart';
{{#has_remote}}import '../datasources/{{feature_name.snakeCase()}}_{{flow_name.snakeCase()}}_remote_datasource.dart';{{/has_remote}}
{{#has_mock}}import '../datasources/{{feature_name.snakeCase()}}_{{flow_name.snakeCase()}}_mock_datasource.dart';{{/has_mock}}

/// Implementation of {{feature_name.pascalCase()}}Repository
class {{feature_name.pascalCase()}}RepositoryImpl implements {{feature_name.pascalCase()}}Repository {
  {{#has_remote}}
  // ignore: unused_field
  final {{feature_name.pascalCase()}}{{flow_name.pascalCase()}}RemoteDataSource _remoteDataSource;
  {{/has_remote}}
  {{#has_mock}}
  // ignore: unused_field
  final {{feature_name.pascalCase()}}{{flow_name.pascalCase()}}MockDataSource _mockDataSource;
  {{/has_mock}}

  {{feature_name.pascalCase()}}RepositoryImpl({
    {{#has_remote}}required {{feature_name.pascalCase()}}{{flow_name.pascalCase()}}RemoteDataSource remoteDataSource,{{/has_remote}}
    {{#has_mock}}required {{feature_name.pascalCase()}}{{flow_name.pascalCase()}}MockDataSource mockDataSource,{{/has_mock}}
  }) : {{#has_remote}}_remoteDataSource = remoteDataSource{{#has_mock}},{{/has_mock}}{{/has_remote}}
       {{#has_mock}}_mockDataSource = mockDataSource{{/has_mock}};

  @override
  Future<{{flow_name.pascalCase()}}Model> get{{flow_name.pascalCase()}}() async {
    // TODO: implement get{{flow_name.pascalCase()}}
    throw UnimplementedError();
  }
}

