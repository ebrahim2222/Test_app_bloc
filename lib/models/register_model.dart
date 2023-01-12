class RegisterModel {
  int? statusCode;
  bool? success;
  Data? data;
  String? message;

  RegisterModel({this.statusCode, this.success, this.data, this.message});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProvidorsID'] = this.providorsID;
    data['ProvidorName'] = this.providorName;
    data['ProvidorMobile'] = this.providorMobile;
    data['ProvidorCompanyName'] = this.providorCompanyName;
    data['ProvidorPassword'] = this.providorPassword;
    data['Token'] = this.token;
    data['FirebaseToken'] = this.firebaseToken;
    data['CompleteServices'] = this.completeServices;
    data['lastUpdatedProvidors'] = this.lastUpdatedProvidors;
    data['CreatedAtProvidors'] = this.createdAtProvidors;
    return data;
  }
}
