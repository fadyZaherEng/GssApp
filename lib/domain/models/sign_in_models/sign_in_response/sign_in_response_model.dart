// ignore_for_file: prefer_collection_literals
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_data.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_header_response.dart';

class SignInResponseModel {
  SignInResponseData loginData;
  SignInHeaderResponse headerResponse;

  SignInResponseModel({
    required this.loginData,
    required this.headerResponse,
  });

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) {
    return SignInResponseModel(
      loginData: json['data'] != null
          ? SignInResponseData.fromJson(json['data'])
          : SignInResponseData.fromJson({}),
      headerResponse: SignInHeaderResponse.fromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['data'] = loginData.toJson();
    data['responseCode'] = headerResponse.responseCode;
    data['responseMessage'] = headerResponse.responseMessage;
    data['responseMessageAr'] = headerResponse.responseMessageAr;
    data['responseMessageEn'] = headerResponse.responseMessageEn;
    data['responseRemark'] = headerResponse.responseRemark;
    return data;
  }
}
