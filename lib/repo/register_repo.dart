import 'package:dartz/dartz.dart';
import 'package:test_app/models/register_model.dart';
import 'dart:convert';
import '../core/values/api_manager.dart';
import '../core/values/rest_full_api_enums.dart';
import '../data/network/API.dart';

class RegisterRepo {
  RegisterModel? registerModel;
  Future<Either<String, RegisterModel>> register(formData) async {
    var value = await Api.manageApiWithoutHeader(
        rest: RestFulApi.POST, path: ApiManager.registerPath, data: formData);
    if (value is String) {
      return Left(value);
    } else {
      var jsonDecode = json.decode(value.data);
      registerModel = RegisterModel.fromJson(jsonDecode);
      return Right(registerModel!);
    }
  }
}
