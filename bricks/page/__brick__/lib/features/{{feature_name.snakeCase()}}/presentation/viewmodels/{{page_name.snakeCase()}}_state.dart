import 'package:freezed_annotation/freezed_annotation.dart';

part '{{page_name.snakeCase()}}_state.freezed.dart';

@freezed
sealed class {{page_name.pascalCase()}}State with _${{page_name.pascalCase()}}State {
  const factory {{page_name.pascalCase()}}State.loading() = _Loading;

  const factory {{page_name.pascalCase()}}State.loaded() = _Loaded;

  const factory {{page_name.pascalCase()}}State.error({
    required String message,
  }) = _Error;
}

