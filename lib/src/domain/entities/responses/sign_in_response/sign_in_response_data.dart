import 'package:gss/src/core/utils/extensions/sign_in_response_extension/sign_in_gender_extension.dart';
import 'package:gss/src/core/utils/extensions/sign_in_response_extension/sign_in_nationality_extension.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/sign_in_response/sign_in_response_gender.dart';
import 'package:gss/src/data/sources/remote/gbu/sign_in/sign_in_response/sign_in_response_nationality.dart';
import 'package:gss/src/domain/entities/responses/sign_in_response/sign_in_response_gender.dart';
import 'package:gss/src/domain/entities/responses/sign_in_response/sign_in_response_nationality.dart';

class SignInData {
  bool allowUseAgentApp;
  String birtDate;
  String email;
  String fullName;
  SignInGender? gender;
  int genderId;
  int id;
  bool isActivation;
  String mobile;
  SignInNationality? nationality;
  int nationalityId;
  String profileImage;
  int registerType;

  SignInData({
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

  factory SignInData.fromJson(Map<String, dynamic> json) {
    return SignInData(
      allowUseAgentApp: json['allowUseAgentApp'],
      birtDate: json['birtDate'],
      email: json['email'],
      fullName: json['fullName'],
      gender: SignInResponseGender.fromJson(json['gender']).toDomain(),
      genderId: json['genderId'],
      id: json['id'],
      isActivation: json['isActivation'],
      mobile: json['mobile'],
      nationality: SignInResponseNationality.fromJson(json['nationality']).toDomain(),
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
    data['gender'] = gender?.toJson();
    data['nationality'] = nationality?.toJson();
    return data;
  }
}
