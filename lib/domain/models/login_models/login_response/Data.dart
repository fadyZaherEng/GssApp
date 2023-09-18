import 'package:gss/domain/models/login_models/login_response/Gender.dart';
import 'package:gss/domain/models/login_models/login_response/Nationality.dart';

class Data {
  dynamic allowUseAgentApp;
  dynamic birtDate;
  dynamic email;
  dynamic fullName;
  dynamic gender;
  dynamic genderId;
  dynamic id;
  dynamic isActivation;
  dynamic mobile;
  dynamic nationality;
  dynamic nationalityId;
  dynamic profileImage;
  dynamic registerType;

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
      gender: Gender.fromJson(json['gender']) ,
      genderId: json['genderId'],
      id: json['id'],
      isActivation: json['isActivation'],
      mobile: json['mobile'],
      nationality:  Nationality.fromJson(json['nationality']),
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
      data['gender'] = gender.toJson();
    }
    if (nationality != null) {
      data['nationality'] = nationality.toJson();
    }
    return data;
  }
}
