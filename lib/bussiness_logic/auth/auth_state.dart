part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoadingLogin extends AuthState {}

class LoadingRegister extends AuthState {}

class LoginError extends AuthState {
  final String message;
  LoginError({required this.message});
}

class RegisterSuccess extends AuthState {
  final RegisterSuccessModel registerModel;

  RegisterSuccess(this.registerModel);
}

class RegisterError extends AuthState {
  final String message;
  RegisterError({required this.message});
}

class PasswordVisibility extends AuthState {}
