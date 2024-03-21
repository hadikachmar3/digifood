import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../state/product_provider.dart';
import '../widgets/product_grid.dart';

class ProductsByCategoryScreen extends ConsumerWidget {
  final int categoryId;
  const ProductsByCategoryScreen({
    super.key,
    required this.categoryId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productsProvider.notifier).fetchProductsByCategory(categoryId);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products by Category'),
      ),
      body: const ProductGrid(),
    );
  }
}
