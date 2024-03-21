class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] ?? 'No title',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? 'No description',
      category: json['category']['name'] ?? 'No category',
      images: List<String>.from(json['images'] ?? []),
    );
  }
}
