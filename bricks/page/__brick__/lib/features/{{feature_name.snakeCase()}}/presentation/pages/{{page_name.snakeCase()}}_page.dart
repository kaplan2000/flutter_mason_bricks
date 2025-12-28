{{#use_autoroute}}
import 'package:auto_route/auto_route.dart';
{{/use_autoroute}}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/{{page_name.snakeCase()}}_viewmodel.dart';
import '../viewmodels/{{page_name.snakeCase()}}_state.dart';

{{#use_autoroute}}
@RoutePage()
{{/use_autoroute}}
class {{page_name.pascalCase()}}Page extends ConsumerWidget {
  const {{page_name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch({{page_name.camelCase()}}ViewModelProvider);
    // ignore: unused_local_variable
    final viewModel = ref.read({{page_name.camelCase()}}ViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('{{page_name.titleCase()}}'),
      ),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        loaded: () => const Center(
          child: Text('{{page_name.titleCase()}} Page Content'),
        ),
        error: (message) => Center(child: Text(message)),
      ),
    );
  }
}
