import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import '../state/product_provider.dart';
import 'product_widget.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider);
    final productsNotifier = ref.read(productsProvider.notifier);

    return productsState.when(
      data: (products) {
        final isLoadingMore = productsNotifier.isLoadingMore;

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isLoadingMore &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              productsNotifier.fetchMoreProducts();
            }
            return true;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DynamicHeightGridView(
              itemCount: products.length + (isLoadingMore ? 1 : 0),
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 0,
              builder: (ctx, index) {
                if (index >= products.length) {
                  // Loading indicator at the bottom
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final product = products[index];
                  return ProductWidget(product: product);
                }
              },
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}
