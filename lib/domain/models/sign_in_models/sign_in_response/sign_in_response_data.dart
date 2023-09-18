import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_gender.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/sign_in_response_nationality.dart';

class SignInResponseData {
  bool? allowUseAgentApp;
  String? birtDate;
  String? email;
  String? fullName;
  SignInGender? gender;
  int? genderId;
  int? id;
  bool? isActivation;
  String? mobile;
  SignInNationality? nationality;
  int? nationalityId;
  String? profileImage;
  int? registerType;

  SignInResponseData({
    required this.allowUseAgentApp,
    required this.birtDate,
    required this.email,
    required this.fullName,
    required this.gender,
    required this.genderId,
    required this.id,
    required this.isActivation,
    required this.mobile,
    required this.nationality,
    required this.nationalityId,
    required this.profileImage,
    required this.registerType,
  });

  factory SignInResponseData.fromJson(Map<String, dynamic> json) {
    return SignInResponseData(
      allowUseAgentApp: json['allowUseAgentApp'],
      birtDate: json['birtDate'],
      email: json['email'],
      fullName: json['fullName'],
      gender: json['gender'] != null
          ? SignInGender.fromJson(json['gender'])
          : SignInGender.fromJson({}),
      genderId: json['genderId'],
      id: json['id'],
      isActivation: json['isActivation'],
      mobile: json['mobile'],
      nationality: json['nationality'] != null
          ? SignInNationality.fromJson(json['nationality'])
          : SignInNationality.fromJson({}),
      nationalityId: json['nationalityId'],
      profileImage: json['profileImage'],
      registerType: json['registerType'],
    );
  }

  Map<String, dynamic> toJson() {
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
