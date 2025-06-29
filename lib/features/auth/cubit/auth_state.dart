abstract class AuthState {}

class AuthInitial extends AuthState{}


class RegisterSuccess extends AuthState{}
class RegisterLoading extends AuthState{}
class RegisterError extends AuthState{
  final String errorMessage;

  RegisterError({required this.errorMessage});
}


class LoginSuccess extends AuthState{}
class LoginLoading extends AuthState{}
class LoginError extends AuthState{
  final String errorMessage;

  LoginError({required this.errorMessage});
}