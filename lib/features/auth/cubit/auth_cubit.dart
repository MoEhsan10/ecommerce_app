import 'package:ecommerce_app/features/auth/cubit/auth_state.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit  extends Cubit<AuthState>{
  AuthCubit() : super(AuthInitial());

  final _authRepository = AuthRepository();


  Future<void> register(RegisterRequest request) async{
    emit(RegisterLoading());
    try{
      _authRepository.register(request);
      emit(RegisterSuccess());
    }catch(error){
      emit(RegisterError(errorMessage: error.toString()));
    }
  }

  Future<void> login(LoginRequest request) async{
    emit(LoginLoading());
    try{
      _authRepository.login(request);
      emit(LoginSuccess());
    }catch(error){
      emit(LoginError(errorMessage: error.toString()));
    }
  }
}