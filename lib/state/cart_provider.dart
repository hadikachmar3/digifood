import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';

final cartProvider =
    StateNotifierProvider<CartState, Map<Product, int>>((ref) => CartState());

final cartTotalItemsProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.values.fold(0, (total, quantity) => total + quantity);
});

final cartProductCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.length;
});

class CartState extends StateNotifier<Map<Product, int>> {
  CartState() : super({});

  void addToCart(Product product) {
    state = Map.from(state)
      ..update(product, (value) => value + 1, ifAbsent: () => 1);
  }

  void removeFromCart(Product product) {
    state = Map.from(state)
      ..update(product, (value) => value > 1 ? value - 1 : 0)
      ..removeWhere((key, value) => value == 0);
  }

  double get totalPrice => state.entries
      .fold(0, (total, entry) => total + (entry.key.price * entry.value));
}
