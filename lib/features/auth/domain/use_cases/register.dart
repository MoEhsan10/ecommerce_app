import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class Register {
  final AuthRepository _authRepository;

  Register(this._authRepository);

  Future<Either<Failure, UserEntity>>  call(RegisterRequest request) => _authRepository.register(request);
}