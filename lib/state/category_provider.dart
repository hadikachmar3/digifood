import 'package:digifood_app/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/api_service.dart';

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final apiService = ApiService();
  final categories = await apiService.fetchCategories();
  return categories;
});
