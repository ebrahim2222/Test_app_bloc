part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {
  final RegisterModel? registerModel;
  SuccessRegisterState(this.registerModel);
}

class ErrorRegisterState extends RegisterState {
  final String? message;
  ErrorRegisterState(this.message);
}
