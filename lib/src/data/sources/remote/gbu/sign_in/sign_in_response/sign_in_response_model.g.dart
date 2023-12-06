// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseData _$SignInResponseDataFromJson(Map<String, dynamic> json) =>
    SignInResponseData(
      allowUseAgentApp: json['allowUseAgentApp'] as bool?,
      birtDate: json['birtDate'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      gender: json['gender'] == null
          ? null
          : SignInResponseGender.fromJson(json['gender'] as Map<String, dynamic>),
      genderId: json['genderId'] as int?,
      id: json['id'] as int?,
      isActivation: json['isActivation'] as bool?,
      mobile: json['mobile'] as String?,
      nationality: json['nationality'] == null
          ? null
          : SignInResponseNationality.fromJson(
              json['nationality'] as Map<String, dynamic>),
      nationalityId: json['nationalityId'] as int?,
      profileImage: json['profileImage'] as String?,
      registerType: json['registerType'] as int?,
    );

Map<String, dynamic> _$SignInResponseDataToJson(SignInResponseData instance) =>
    <String, dynamic>{
      'allowUseAgentApp': instance.allowUseAgentApp,
      'birtDate': instance.birtDate,
      'email': instance.email,
      'fullName': instance.fullName,
      'gender': instance.gender,
      'genderId': instance.genderId,
      'id': instance.id,
      'isActivation': instance.isActivation,
      'mobile': instance.mobile,
      'nationality': instance.nationality,
      'nationalityId': instance.nationalityId,
      'profileImage': instance.profileImage,
      'registerType': instance.registerType,
    };
