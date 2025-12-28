import 'package:flutter_riverpod/flutter_riverpod.dart';

/// State for {{page_name.pascalCase()}}
class {{page_name.pascalCase()}}State {
  // TODO: Add state fields
  const {{page_name.pascalCase()}}State();
}

/// ViewModel for {{page_name.pascalCase()}}Page
class {{page_name.pascalCase()}}ViewModel extends Notifier<{{page_name.pascalCase()}}State> {
  @override
  {{page_name.pascalCase()}}State build() {
    // TODO: Initial state logic
    return const {{page_name.pascalCase()}}State();
  }

  // TODO: Add methods for business logic
}

/// Provider for {{page_name.pascalCase()}}ViewModel
final {{page_name.camelCase()}}ViewModelProvider = NotifierProvider<{{page_name.pascalCase()}}ViewModel, {{page_name.pascalCase()}}State>(
  {{page_name.pascalCase()}}ViewModel.new,
);

