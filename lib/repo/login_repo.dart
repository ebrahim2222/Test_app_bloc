import 'package:dartz/dartz.dart';
import 'package:test_app/models/login_model.dart';
import 'dart:convert';
import '../core/values/api_manager.dart';
import '../core/values/rest_full_api_enums.dart';
import '../core/data/network/API.dart';

class LoginRepo {
  LoginModel? loginModel;
  Future<Either<String, LoginModel>> login(formData) async {
    var value = await Api.sendRequest(
        rest: RestFulApi.POST, path: ApiManager.loginPath, data: formData);
    if (value is String) {
      return Left(value);
    } else {
      var jsonDecode = json.decode(value.data);
      loginModel = LoginModel.fromJson(jsonDecode);
      return Right(loginModel!);
    }
  }
}
