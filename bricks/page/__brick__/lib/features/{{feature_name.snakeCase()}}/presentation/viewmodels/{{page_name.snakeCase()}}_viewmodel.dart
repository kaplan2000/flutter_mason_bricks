import 'package:flutter_riverpod/flutter_riverpod.dart';
import '{{page_name.snakeCase()}}_state.dart';

/// ViewModel for {{page_name.pascalCase()}}Page
class {{page_name.pascalCase()}}ViewModel extends Notifier<{{page_name.pascalCase()}}State> {
  @override
  {{page_name.pascalCase()}}State build() {
    // TODO: Initial state logic
    return const {{page_name.pascalCase()}}State.loaded();
  }

  // TODO: Add methods for business logic
}

/// Provider for {{page_name.pascalCase()}}ViewModel
final {{page_name.camelCase()}}ViewModelProvider = NotifierProvider<{{page_name.pascalCase()}}ViewModel, {{page_name.pascalCase()}}State>(
  {{page_name.pascalCase()}}ViewModel.new,
);
