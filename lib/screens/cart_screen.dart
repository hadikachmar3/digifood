import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/cart_provider.dart';
import '../widgets/texts/text_w500.dart';
import '../widgets/texts/text_w600.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const TextW600(label: 'Your Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart.keys.elementAt(index);
          final quantity = cart.values.elementAt(index);
          return ListTile(
            title: TextW600(
              label: product.title,
              fontSize: 16,
            ),
            subtitle: TextW500(label: '${product.price}'),
            leading: CircleAvatar(
              child: FancyShimmerImage(
                width: double.infinity,
                imageUrl: product.images[0].toString(),
                boxFit: BoxFit.cover,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.remove,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    ref.read(cartProvider.notifier).removeFromCart(product);
                  },
                ),
                Text('$quantity'),
                IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    ref.read(cartProvider.notifier).addToCart(product);
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Items: ${ref.watch(cartTotalItemsProvider)}'),
              Text(
                  'Total Price: ${ref.watch(cartProvider.notifier).totalPrice}'),
            ],
          ),
        ),
      ),
    );
  }
}
