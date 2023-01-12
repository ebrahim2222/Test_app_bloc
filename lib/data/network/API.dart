import 'package:dio/dio.dart';

import '../../core/values/constants.dart';
import '../../core/values/rest_full_api_enums.dart';
import '../../helper/api_errors/response_exceptions.dart';


class Api {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
        baseUrl: Constants.baseUrl, receiveDataWhenStatusError: true))
      ..interceptors.add(LogInterceptor(
          request: true,
          requestBody: true,
          error: true,
          responseHeader: false,
          responseBody: true,
          requestHeader: false));
  }

  static dynamic manageApiWithoutHeader({rest, path, data}) async {
    dio!.options.headers = {
      "Content-Type": "application/json",
      "lang": "en"
    };
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
        return await dio!.get(path,
            queryParameters: data,
            options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
            ));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();

        return errorMessage;
      }
    } else if (rest == RestFulApi.UPDATE) {
      try {
        return await dio!.put(path,
            data: data,
            options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
            ));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();

        return errorMessage;
      }
    } else {
      try {
        return await dio!.get(path,
            queryParameters: data,
            options: Options(
              followRedirects: false,
              // will not throw errors
              validateStatus: (status) => true,
            ));
      } on DioError catch (e) {
        final errorMessage = DioExceptions.fromDioError(e).toString();

        return errorMessage;
      }
    }
  }

 
}
