import 'package:digifood_app/models/product_model.dart';
import 'package:digifood_app/state/cart_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  group('Cart functionality', () {
    final product1 = Product(
      id: 1,
      title: 'Test Product 1',
      price: 9.99,
      description: 'A test product',
      category: 'Test Category',
      images: [],
    );

    final product2 = Product(
      id: 2,
      title: 'Test Product 2',
      price: 19.99,
      description: 'Another test product',
      category: 'Test Category',
      images: [],
    );

    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    test('Adding a product increases cart total items and count', () {
      container.read(cartProvider.notifier).addToCart(product1);
      container.read(cartProvider.notifier).addToCart(product2);
      container.read(cartProvider.notifier).addToCart(product1);

      expect(container.read(cartTotalItemsProvider), 3,
          reason: 'Total items should be 3.');
      expect(container.read(cartProductCountProvider), 2,
          reason: 'Product count should be 2.');
    });

    test('Removing a product updates cart correctly', () {
      container.read(cartProvider.notifier).addToCart(product1);
      container.read(cartProvider.notifier).addToCart(product2);
      container.read(cartProvider.notifier).addToCart(product1);

      container.read(cartProvider.notifier).removeFromCart(product1);

      expect(container.read(cartTotalItemsProvider), 2,
          reason: 'Total items should be 2 after removal.');
      expect(container.read(cartProductCountProvider), 2,
          reason: 'Product count should remain 2.');
      expect(container.read(cartProvider)[product1], 1,
          reason: 'Quantity of product1 should be 1 after removal.');

      container.read(cartProvider.notifier).removeFromCart(product2);
      expect(container.read(cartProvider).containsKey(product2), isFalse,
          reason: 'Product2 should be removed completely.');
    });

    test('Total price calculation is correct', () {
      container.read(cartProvider.notifier).addToCart(product1);
      container.read(cartProvider.notifier).addToCart(product2);

      final totalPrice =
          ((container.read(cartProvider.notifier).totalPrice) * 100).round() /
              100;
      expect(totalPrice, 29.98,
          reason: 'Total price should be the sum of product prices.');
    });

    tearDown(() {
      container.dispose();
    });
  });
}
