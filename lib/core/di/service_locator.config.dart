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
    gh.singleton<_i361.Dio>(() => registerModule.dio());
    gh.singleton<_i1050.AuthLocalDataSource>(() =>
        _i932.AuthSharedPrefLocalDataSource(
            sharedPref: gh<_i460.SharedPreferences>()));
    gh.singleton<_i255.AuthRemoteDataSource>(
        () => _i873.AuthApiRemoteDataSource(dio: gh<_i361.Dio>()));
    gh.singleton<_i804.AuthRepository>(() => _i386.AuthRepositoryImpl(
          authRemoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          authLocalDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.singleton<_i699.Login>(() => _i699.Login(gh<_i804.AuthRepository>()));
    gh.singleton<_i637.Register>(
        () => _i637.Register(gh<_i804.AuthRepository>()));
    gh.singleton<_i156.AuthCubit>(() => _i156.AuthCubit(
          gh<_i637.Register>(),
          gh<_i699.Login>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i286.RegisterModule {}
