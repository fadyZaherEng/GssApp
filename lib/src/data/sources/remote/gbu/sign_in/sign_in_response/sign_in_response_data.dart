// ignore_for_file: depend_on_referenced_packages, prefer_collection_literals

import 'package:gss/src/data/sources/remote/gbu/sign_in/sign_in_response/sign_in_response_gender.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/sign_in_response/sign_in_response_nationality.dart';
import 'package:json_annotation/json_annotation.dart';
part 'sign_in_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SignInResponseData {
  @JsonKey(name: 'allowUseAgentApp')
  bool? allowUseAgentApp;
  @JsonKey(name: 'birtDate')
  String? birtDate;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'fullName')
  String? fullName;
  @JsonKey(name: 'gender')
  SignInResponseGender? gender;
  @JsonKey(name: 'genderId')
  int? genderId;
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'isActivation')
  bool? isActivation;
  @JsonKey(name: 'mobile')
  String? mobile;
  @JsonKey(name: 'nationality')
  SignInResponseNationality? nationality;
  @JsonKey(name: 'nationalityId')
  int? nationalityId;
  @JsonKey(name: 'profileImage')
  String? profileImage;
  @JsonKey(name: 'registerType')
  int? registerType;


  SignInResponseData({
     this.allowUseAgentApp,
     this.birtDate,
     this.email,
     this.fullName,
     this.gender,
     this.genderId,
     this.id,
     this.isActivation,
     this.mobile,
     this.nationality,
     this.nationalityId,
     this.profileImage,
     this.registerType,
  });

  factory SignInResponseData.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SignInResponseDataToJson(this);


  factory SignInResponseData.fromMap(Map<String, dynamic> json) {
    return SignInResponseData(
      allowUseAgentApp: json['allowUseAgentApp'],
      birtDate: json['birtDate'],
      email: json['email'],
      fullName: json['fullName'],
      gender: json['gender'] != null
          ? SignInResponseGender.fromJson(json['gender'])
          : SignInResponseGender.fromJson({}),
      genderId: json['genderId'],
      id: json['id'],
      isActivation: json['isActivation'],
      mobile: json['mobile'],
      nationality: json['nationality'] != null
          ? SignInResponseNationality.fromJson(json['nationality'])
          : SignInResponseNationality.fromJson({}),
      nationalityId: json['nationalityId'],
      profileImage: json['profileImage'],
      registerType: json['registerType'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['allowUseAgentApp'] = allowUseAgentApp;
    data['birtDate'] = birtDate;
    data['email'] = email;
    data['fullName'] = fullName;
    data['genderId'] = genderId;
    data['id'] = id;
    data['isActivation'] = isActivation;
    data['mobile'] = mobile;
    data['nationalityId'] = nationalityId;
    data['profileImage'] = profileImage;
    data['registerType'] = registerType;
    if (gender != null) {
      data['gender'] = gender!.toJson();
    }
    if (nationality != null) {
      data['nationality'] = nationality!.toJson();
    }
    return data;
  }
}
