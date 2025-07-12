import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future <Either<Failure,UserEntity>> register(RegisterRequest request);

  Future<Either<Failure,UserEntity>> login(LoginRequest request);
}