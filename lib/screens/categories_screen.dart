import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/category_provider.dart';
import '../utils/navigator.dart';
import 'products_by_category.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsyncValue = ref.watch(categoriesProvider);
    final navigationService = NavigationService.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a Category'),
      ),
      body: categoriesAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err'),
        data: (categories) {
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(category.image),
                ),
                title: Text(category.name),
                onTap: () {
                  navigationService.navigate(
                    ProductsByCategoryScreen(categoryId: category.id),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
