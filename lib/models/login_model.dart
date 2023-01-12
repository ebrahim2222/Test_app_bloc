class LoginModel {
  int? statusCode;
  bool? success;
  Data? data;
  String? message;

  LoginModel({this.statusCode, this.success, this.data, this.message});

  LoginModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? providorsID;
  String? providorName;
  String? providorMobile;
  String? providorCompanyName;
  String? providorPassword;
  String? token;
  String? firebaseToken;
  String? completeServices;
  String? lastUpdatedProvidors;
  String? createdAtProvidors;

  Data(
      {this.providorsID,
      this.providorName,
      this.providorMobile,
      this.providorCompanyName,
      this.providorPassword,
      this.token,
      this.firebaseToken,
      this.completeServices,
      this.lastUpdatedProvidors,
      this.createdAtProvidors});

  Data.fromJson(Map<String, dynamic> json) {
    providorsID = json['ProvidorsID'];
    providorName = json['ProvidorName'];
    providorMobile = json['ProvidorMobile'];
    providorCompanyName = json['ProvidorCompanyName'];
    providorPassword = json['ProvidorPassword'];
    token = json['Token'];
    firebaseToken = json['FirebaseToken'];
    completeServices = json['CompleteServices'];
    lastUpdatedProvidors = json['lastUpdatedProvidors'];
    createdAtProvidors = json['CreatedAtProvidors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProvidorsID'] = providorsID;
    data['ProvidorName'] = providorName;
    data['ProvidorMobile'] = providorMobile;
    data['ProvidorCompanyName'] = providorCompanyName;
    data['ProvidorPassword'] = providorPassword;
    data['Token'] = token;
    data['FirebaseToken'] = firebaseToken;
    data['CompleteServices'] = completeServices;
    data['lastUpdatedProvidors'] = lastUpdatedProvidors;
    data['CreatedAtProvidors'] = createdAtProvidors;
    return data;
  }
}
