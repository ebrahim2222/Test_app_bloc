import 'package:get_it/get_it.dart';
import 'package:test_app/bloc/login_bloc/login_bloc.dart';
import 'package:test_app/bloc/register_bloc/register_bloc.dart';
import 'package:test_app/repo/login_repo.dart';
import 'package:test_app/repo/register_repo.dart';

class DependencyInjection{

  static final getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<LoginBloc>(() => LoginBloc());
    getIt.registerLazySingleton<RegisterBloc>(() => RegisterBloc());
    getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo());
    getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  }

}