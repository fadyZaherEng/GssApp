import 'package:gss/domain/models/login_models/login_response/Data.dart';

class LoginResponseModel {
  dynamic loginData;
  int responseCode;
  dynamic responseMessage;
  dynamic responseMessageAr;
  dynamic responseMessageEn;
  dynamic responseRemark;

  LoginResponseModel({
    this.loginData,
    required this.responseCode,
    required this.responseMessage,
    required this.responseMessageAr,
    required this.responseMessageEn,
    required this.responseRemark,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      loginData:json['data']!=null ?Data.fromJson(json['data']):Map(),
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      responseMessageAr: json['responseMessageAr'],
      responseMessageEn: json['responseMessageEn'],
      responseRemark: json['responseRemark'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseCode'] = responseCode;
    data['responseMessage'] = responseMessage;
    data['responseMessageAr'] = responseMessageAr;
    data['responseMessageEn'] = responseMessageEn;
    data['responseRemark'] = responseRemark;
    if (loginData != null) {
      data['data'] = loginData!.toJson();
    }
    return data;
  }
}
