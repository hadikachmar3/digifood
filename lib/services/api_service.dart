import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';
import '../models/product_model.dart';
import '../utils/errors_parser.dart';

class ApiService {
  final String _baseUrl = 'https://api.escuelajs.co/api/v1';
  final Duration durationTimeOut = const Duration(seconds: 10);

  Future<List<Product>> fetchProducts({int offset = 0, int limit = 10}) async {
    final url = '$_baseUrl/products?offset=$offset&limit=$limit';
    return _fetchData(url);
  }

  Future<List<Product>> fetchProductsByCategoryId(int categoryId) async {
    final url = '$_baseUrl/categories/$categoryId/products';
    return _fetchData(url);
  }

  Future<List<Product>> _fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url)).timeout(durationTimeOut);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body
            .map((dynamic item) =>
                Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            'Failed to load data with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw ErrorParser.parseApiError(error);
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    final url = '$_baseUrl/categories';
    try {
      final response = await http.get(Uri.parse(url)).timeout(durationTimeOut);
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body
            .map((dynamic item) =>
                CategoryModel.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception(
            'Failed to load categories with status code: ${response.statusCode}');
      }
    } catch (error) {
      throw ErrorParser.parseApiError(error);
    }
  }
}
