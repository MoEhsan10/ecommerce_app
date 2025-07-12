import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exceptions.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/mappers/User_entity_mapper.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../data_sources/local/auth_local_data_source.dart';


@Singleton(as: AuthRepository)
class AuthRepositoryImpl  implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource,required this.authLocalDataSource});


  @override
  Future <Either<Failure,UserEntity>> register(RegisterRequest request)async{
    try{
      final response = await authRemoteDataSource.register(request);
      authLocalDataSource.saveToken(response.token);
      return Right(response.user.toEntity);
    } on AppExceptions catch (exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure,UserEntity>> login(LoginRequest request)async{
    try{
      final response = await authRemoteDataSource.login(request);
      await authLocalDataSource.saveToken(response.token ?? '');
      return Right(response.user!.toEntity);
    }on AppExceptions catch (exception){
      return Left(Failure(message: exception.message));
    }
  }
}
