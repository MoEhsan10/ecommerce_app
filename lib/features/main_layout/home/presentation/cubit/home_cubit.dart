import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeStates> {
  final GetCategories _getCategories;

  HomeCubit(this._getCategories) : super(HomeInitial()) {
    getCategories();
  }

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _getCategories();
    result.fold(
      (failure) => emit(GetCategoriesError(message: failure.message)),
      (categories) => emit(GetCategoriesSuccess(categories: categories)),
    );
  }
}
