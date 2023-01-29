import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/bloc/login_bloc/login_bloc.dart';
import 'package:test_app/bloc/register_bloc/register_bloc.dart';
import 'package:test_app/repo/login_repo.dart';
import 'package:test_app/repo/register_repo.dart';

import '../values/constants.dart';

class DependencyInjection {
  static final getIt = GetIt.instance;

  static void setup() async {
    getIt.registerFactory<LoginBloc>(() => LoginBloc());
    getIt.registerFactory<RegisterBloc>(() => RegisterBloc());
    getIt.registerFactory<RegisterRepo>(() => RegisterRepo());
    getIt.registerFactory<LoginRepo>(() => LoginRepo());
    getIt.registerLazySingleton(() => Dio(BaseOptions(
        baseUrl: Constants.baseUrl, receiveDataWhenStatusError: true))
      ..interceptors.add(LogInterceptor(
          request: true,
          requestBody: true,
          error: true,
          responseHeader: false,
          responseBody: true,
          requestHeader: false)));

    var shared = await SharedPreferences.getInstance();

    getIt.registerLazySingleton(() => shared);
  }
}
