import 'package:ecommerce_app/features/products_screen/data/models/product_model.dart';
import 'package:ecommerce_app/features/products_screen/domain/entitiy/product.dart';

extension ProductMappers on ProductsModel{

  Product get toEntity => Product(
  sold: sold,
  imagesURLs: imagesURLs,
  ratingsQuantity: ratingsQuantity,
  id: id,
  title: title,
  description: description,
  quantity: quantity,
  price: price,
  imagesCoverURL: imagesCoverURL,
  category: category,
  brand: brand,
  ratingsAverage: ratingsAverage
  );
}
