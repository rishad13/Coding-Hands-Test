import 'dart:convert';

class ProductListModal {
    final List<Product> products;
    final int total;
    final int skip;
    final int limit;

    ProductListModal({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory ProductListModal.fromRawJson(String str) => ProductListModal.fromJson(json.decode(str));


    factory ProductListModal.fromJson(Map<String, dynamic> json) => ProductListModal(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

}

class Product {
    final int id;
    final String title;
    final String description;
    final int price;
    final double discountPercentage;
    final double rating;
    final int stock;
    final String brand;
    final String category;
    final String thumbnail;
    final List<String> images;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.brand,
        required this.category,
        required this.thumbnail,
        required this.images,
    });

    factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));


    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

}
