import 'package:ecommerce_app/core/models/Metadata.dart';

import 'product_model.dart';

class ProductsResponse {
  final num results;
  final Metadata metadata;
  final List<ProductsModel> products;

  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.products,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'] as num,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      products: json['data'] != null
          ? List<ProductsModel>.from(
          json['data'].map((v) => ProductsModel.fromJson(v as Map<String, dynamic>))
      )
          : <ProductsModel>[],
    );
  }
}