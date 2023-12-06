
import 'package:gss/src/domain/entities/requests/sign_in_request/sign_in_request_data.dart';

class SignInRequestModel {
  SignInRequestData? data;
  String ip;
  String deviceSerial;
  String notificationToken;
  String osversion;
  String appLanguage;
  String appversion;
  int currencyId;
  int measureUnitId;
  int countryId;
  int deviceType;
  int userId;
  int subscriberId;
  bool isWeb;
  SignInRequestModel({
    required this.data,
    required this.ip,
    required this.deviceSerial,
    required this.notificationToken,
    required this.osversion,
    required this.appLanguage,
    required this.appversion,
    required this.currencyId,
    required this.measureUnitId,
    required this.countryId,
    required this.deviceType,
    required this.userId,
    required this.subscriberId,
    required this.isWeb,
  });

  Map<String, dynamic> toJson() {
   return {
    'data': data!.toMap(),
    'ip': ip,
    'deviceSerial': deviceSerial,
    'notificationToken': notificationToken,
    'osversion': osversion,
    'appLanguage': appLanguage,
    'appversion': appversion,
    'currencyId': currencyId,
    'measureUnitId': measureUnitId,
    'countryId': countryId,
    'deviceType': deviceType,
    'userId': userId,
    'subscriberId': subscriberId,
    'isWeb': isWeb,
    };
  }

  factory SignInRequestModel.fromMap(Map<String, dynamic> map) {
    return SignInRequestModel(
      data: map['data'] != null ? SignInRequestData.fromMap(map['data']) : SignInRequestData.fromMap({}) ,
      ip: map['ip'] ,
      deviceSerial: map['deviceSerial'],
      notificationToken: map['notificationToken'] ,
      osversion: map['osversion'] ,
      appLanguage: map['appLanguage'] ,
      appversion: map['appversion'] ,
      currencyId: map['CurrencyId'] ,
      measureUnitId: map['MeasureUnitId'] ,
      countryId: map['CountryId'] ,
      deviceType: map['deviceType'] ,
      userId: map['userId'] ,
      subscriberId: map['SubscriberId'] ,
      isWeb: map['isWeb'] ,
    );
  }
}
