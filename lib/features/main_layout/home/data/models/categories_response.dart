import 'metadata.dart';
import 'category_model.dart';

class CategoriesResponse {
  final num results;
  final Metadata metadata;
  final List<CategoryModel> categories;

  CategoriesResponse({
    required this.results,
    required this.metadata,
    required this.categories,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      results: json['results'] as num,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      categories: (json['data'] as List)
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}