import 'package:ecommerce_app/features/auth/cubit/auth_state.dart';
import 'package:ecommerce_app/features/auth/data/models/Login_request.dart';
import 'package:ecommerce_app/features/auth/data/models/Register_request.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
     this._register, this._login
) : super(AuthInitial());

  final Register _register;
  final Login _login;

  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    final result = await _register(request);
    result.fold(
        ((failure) => emit(RegisterError(errorMessage: failure.message))),
        ((_) => emit(RegisterSuccess()))
    );
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    final result = await _login(request);
    result.fold(
        ((failure) => emit(LoginError(errorMessage: failure.message))),
        ((_)=> emit(LoginSuccess()))
    );
  }
}
