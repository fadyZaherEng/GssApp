
import 'package:gss/domain/models/sign_in_models/sign_in_response/Data.dart';

class LoginResponseModel {
  Data loginData;
  int responseCode;
  String responseMessage;
  String responseMessageAr;
  String responseMessageEn;
  String responseRemark;

  LoginResponseModel({
    required this.loginData,
    required this.responseCode,
    required this.responseMessage,
    required this.responseMessageAr,
    required this.responseMessageEn,
    required this.responseRemark,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      loginData:json['data']!=null ?Data.fromJson(json['data']):Data.fromJson({}),
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
    data['data'] = loginData.toJson();
    return data;
  }
}
