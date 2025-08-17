// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerce_app/core/di/register_module.dart' as _i286;
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart' as _i156;
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i1050;
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i932;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i873;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i255;
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i386;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i804;
import 'package:ecommerce_app/features/auth/domain/use_cases/login.dart'
    as _i699;
import 'package:ecommerce_app/features/auth/domain/use_cases/register.dart'
    as _i637;
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_api_remote_data_source.dart'
    as _i934;
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart'
    as _i1015;
import 'package:ecommerce_app/features/cart/data/repositories/cart_repository_impl.dart'
    as _i84;
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repository.dart'
    as _i182;
import 'package:ecommerce_app/features/cart/domain/use_cases/add_to_cart.dart'
    as _i631;
import 'package:ecommerce_app/features/cart/domain/use_cases/delete_from_cart.dart'
    as _i535;
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart.dart'
    as _i622;
import 'package:ecommerce_app/features/cart/domain/use_cases/update_cart.dart'
    as _i558;
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart'
    as _i390;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i689;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i369;
import 'package:ecommerce_app/features/main_layout/home/data/repositories/home_repository_impl.dart'
    as _i447;
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/home_repository.dart'
    as _i548;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_categories.dart'
    as _i216;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/home_cubit.dart'
    as _i948;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_api_remote_data_source.dart'
    as _i302;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart'
    as _i1062;
import 'package:ecommerce_app/features/products_screen/data/repositories/products_repository_impl.dart'
    as _i486;
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repository.dart'
    as _i981;
import 'package:ecommerce_app/features/products_screen/domain/use_cases/get_products.dart'
    as _i937;
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart'
    as _i829;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPrefs,
      preResolve: true,
    );
    gh.singleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i369.HomeRemoteDataSource>(
        () => _i689.HomeApiRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i1050.AuthLocalDataSource>(() =>
        _i932.AuthSharedPrefLocalDataSource(
            sharedPref: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i1062.ProductsRemoteDataSource>(
        () => _i302.ProductsAPIRemoteDataSource(gh<_i361.Dio>()));
    gh.lazySingleton<_i1015.CartRemoteDataSource>(
        () => _i934.CartAPIRemoteDataSource(gh<_i361.Dio>()));
    gh.singleton<_i255.AuthRemoteDataSource>(
        () => _i873.AuthApiRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i548.HomeRepository>(
        () => _i447.HomeRepositoryImpl(gh<_i369.HomeRemoteDataSource>()));
    gh.lazySingleton<_i216.GetCategories>(
        () => _i216.GetCategories(gh<_i548.HomeRepository>()));
    gh.lazySingleton<_i948.HomeCubit>(
        () => _i948.HomeCubit(gh<_i216.GetCategories>()));
    gh.lazySingleton<_i182.CartRepository>(
        () => _i84.CartRepositoryImpl(gh<_i1015.CartRemoteDataSource>()));
    gh.lazySingleton<_i981.ProductsRepository>(() =>
        _i486.ProductsRepositoryImpl(gh<_i1062.ProductsRemoteDataSource>()));
    gh.singleton<_i804.AuthRepository>(() => _i386.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i937.GetProducts>(
        () => _i937.GetProducts(gh<_i981.ProductsRepository>()));
    gh.factory<_i829.ProductsCubit>(
        () => _i829.ProductsCubit(gh<_i937.GetProducts>()));
    gh.singleton<_i699.Login>(() => _i699.Login(gh<_i804.AuthRepository>()));
    gh.singleton<_i637.Register>(
        () => _i637.Register(gh<_i804.AuthRepository>()));
    gh.lazySingleton<_i631.AddToCart>(
        () => _i631.AddToCart(gh<_i182.CartRepository>()));
    gh.lazySingleton<_i535.DeleteFromCart>(
        () => _i535.DeleteFromCart(gh<_i182.CartRepository>()));
    gh.lazySingleton<_i622.GetCart>(
        () => _i622.GetCart(gh<_i182.CartRepository>()));
    gh.lazySingleton<_i558.UpdateCart>(
        () => _i558.UpdateCart(gh<_i182.CartRepository>()));
    gh.singleton<_i156.AuthCubit>(() => _i156.AuthCubit(
          gh<_i637.Register>(),
          gh<_i699.Login>(),
        ));
    gh.lazySingleton<_i390.CartCubit>(() => _i390.CartCubit(
          gh<_i631.AddToCart>(),
          gh<_i622.GetCart>(),
          gh<_i558.UpdateCart>(),
          gh<_i535.DeleteFromCart>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i286.RegisterModule {}
