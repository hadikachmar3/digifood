import 'package:flutter/material.dart';
import 'package:digifood_app/screens/cart_screen.dart';
import 'package:digifood_app/utils/navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/cart_provider.dart';
import '../widgets/product_grid.dart';
import 'categories_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = NavigationService.instance;
    final cartProductCount = ref.watch(cartProductCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        leading: IconButton(
          onPressed: () {
            navigationService.navigateWithTopToBottomAnimation(
              const CategoriesScreen(),
            );
          },
          icon: const Icon(Icons.category),
        ),
        actions: [
          Badge(
            alignment: Alignment.topCenter,
            label: Text(cartProductCount.toString()),
            child: IconButton(
              onPressed: () {
                navigationService.navigate(const CartScreen());
              },
              icon: const Icon(Icons.shopping_basket),
            ),
          ),
        ],
      ),
      body: const ProductGrid(),
    );
  }
}
