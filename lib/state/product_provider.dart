import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_model.dart';
import '../services/api_service.dart';

final productsProvider =
    StateNotifierProvider<ProductsNotifier, AsyncValue<List<Product>>>((ref) {
  return ProductsNotifier();
});

class ProductsNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final List<Product> _allProducts = [];
  List<Product> _categoryProducts = [];
  int _offset = 0;
  final int _limit = 10;
  bool _isLoadingMore = false;
  int? _currentCategoryId;

  ProductsNotifier() : super(const AsyncValue.loading()) {
    fetchInitialProducts();
  }

  bool get isLoadingMore => _isLoadingMore;

  bool _hasMoreProducts = true;

  bool get hasMoreProducts => _hasMoreProducts;

  Future<void> _fetchProducts() async {
    _isLoadingMore = true;
    try {
      final newProducts =
          await ApiService().fetchProducts(offset: _offset, limit: _limit);
      _isLoadingMore = false;
      if (newProducts.isEmpty || newProducts.length < _limit) {
        _hasMoreProducts = false; // No more products to load
      } else {
        _offset += _limit;
      }
      _allProducts.addAll(newProducts);
      state = AsyncValue.data(List.from(_allProducts));
    } catch (error, stackTrace) {
      _isLoadingMore = false;
      state = AsyncValue.error(error, stackTrace);
    }
  }

  // check before attempting to load more
  void fetchMoreProducts() {
    if (_isLoadingMore || !_hasMoreProducts) return;
    _fetchProducts();
  }

  Future<void> fetchInitialProducts() async {
    _isLoadingMore = false;
    _fetchProducts();
  }

  Future<void> fetchProductsByCategory(int categoryId) async {
    // if already in the selected category to avoid refetching
    if (_currentCategoryId == categoryId) {
      return;
    }

    // Clear previous category products and set the current category ID
    _categoryProducts.clear();
    _currentCategoryId = categoryId;

    try {
      final products = await ApiService().fetchProductsByCategoryId(categoryId);
      _categoryProducts = products;
      state = AsyncValue.data(List.from(_categoryProducts));
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }

  // Reset to initial state
  void clearCategory() {
    _currentCategoryId = null;
    _categoryProducts.clear();
  }
}
