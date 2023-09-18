
import 'package:gss/domain/models/sign_in_models/sign_in_response/Gender.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_response/Nationality.dart';

class Data {
  bool? allowUseAgentApp;
  String? birtDate;
  String? email;
  String? fullName;
  Gender? gender;
  int? genderId;
  int? id;
  bool? isActivation;
  String? mobile;
  Nationality? nationality;
  int? nationalityId;
  String? profileImage;
  int? registerType;

  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      allowUseAgentApp: json['allowUseAgentApp'],
      birtDate: json['birtDate'],
      email: json['email'],
      fullName: json['fullName'],
      gender:json['gender']!=null? Gender.fromJson(json['gender']) :Gender.fromJson({}),
      genderId: json['genderId'],
      id: json['id'],
      isActivation: json['isActivation'],
      mobile: json['mobile'],
      nationality: json['nationality']!=null? Nationality.fromJson(json['nationality']):Nationality.fromJson({}),
      nationalityId: json['nationalityId'],
      profileImage: json['profileImage'],
      registerType: json['registerType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
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
