part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {
  LoginModel? loginModel;
  SuccessLoginState(this.loginModel);
}

class ErrorLoginState extends LoginState {
  String? message;
  ErrorLoginState(this.message);
}
