import 'package:ecommerce_app/core/models/category_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category.dart';

extension CategoryMapper on CategoryModel{
  Category get toEntity => Category(id: id, name: name, imageUrl: imageUrl);
}