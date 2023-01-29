import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:test_app/core/values/strings_manager.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = AppStrings.requestToAPICanceled;
        break;
      case DioErrorType.connectTimeout:
        message = AppStrings.connectionTimeOut;
        break;
      case DioErrorType.receiveTimeout:
        message = AppStrings.receiveTimeOutInConnection;
        break;
      case DioErrorType.response:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        );
        break;
      case DioErrorType.sendTimeout:
        message = AppStrings.sendTimeOut;
        break;
      case DioErrorType.other:
        if (dioError.message.contains("SocketException")) {
          message = AppStrings.noInternet;
          break;
        }
        message = AppStrings.unExpectedError;
        break;
      default:
        message = AppStrings.somethingWentWrong;
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        var decode = json.decode(error);
        return decode["message"];
      case 401:
        return AppStrings.unAuthorized;
      case 403:
        return AppStrings.forbidden;
      case 404:
        var decode = json.decode(error);
        return decode["message"];
      case 500:
        return AppStrings.internalServerError;
      case 502:
        return AppStrings.badGateway;
      default:
        return AppStrings.oopsWrong;
    }
  }

  @override
  String toString() => message;
}
