import 'package:ecommerce_app/features/products_screen/domain/use_cases/get_products.dart';
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit(this._getProducts) : super(ProductInitial());


  final GetProducts _getProducts;
  int productQuantity=1;


  Future<void> getProducts({String? categoryId}) async{
    emit(GetProductLoading());
    final result = await _getProducts(categoryId);
    return result.fold(
            (failure) => emit(GetProductError(message: failure.message)),
            (products) => emit(GetProductSuccess(products: products)));
  }

  void onQuantityChanged(int updatedQuantity){
    productQuantity = updatedQuantity;
    emit(ProductQuantityChanged());
  }
}
