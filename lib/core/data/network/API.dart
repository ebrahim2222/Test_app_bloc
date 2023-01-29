import 'package:dio/dio.dart';
import 'package:test_app/core/DI/d_injection.dart';
import 'package:test_app/core/values/constants.dart';
import '../../values/rest_full_api_enums.dart';
import '../../helper/api_errors/response_exceptions.dart';

class Api {
  static Dio? dio = DependencyInjection.getIt<Dio>();

  static dynamic sendRequest({rest, path, data}) async {
    if (Constants.isLogin == true) {
      dio!.options.headers = {
        "Content-Type": "application/json",
        "Token": "",
        "lang": "en"
      };
    } else {
      dio!.options.headers = {"Content-Type": "application/json", "lang": "en"};
    }
    if (rest == RestFulApi.POST) {
      try {
        return await dio!.post(
          path,
          data: data,
        );
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();
        return errorMessage;
      }
    } else if (rest == RestFulApi.GET) {
      try {
        return await dio!.get(
          path,
          queryParameters: data,
        );
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();

        return errorMessage;
      }
    } else if (rest == RestFulApi.UPDATE) {
      try {
        return await dio!.put(
          path,
          data: data,
        );
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();

        return errorMessage;
      }
    } else {
      try {
        return await dio!.get(
          path,
          queryParameters: data,
        );
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();

        return errorMessage;
      }
    }
  }
}
