import 'Data.dart';

class LogInRequestModel {
  String? ip;
  String? deviceSerial;
  String? notificationToken;
  String? osversion;
  String? appLanguage;
  String? appversion;
  int? currencyId;
  int? measureUnitId;
  int? countryId;
  int? deviceType;
  int? userId;
  int? subscriberId;
  bool? isWeb;
  Data? data;

  LogInRequestModel({
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
     required this.data,
  });

  LogInRequestModel.fromJson(dynamic json) {
    ip = json['ip'];
    deviceSerial = json['deviceSerial'];
    notificationToken = json['notificationToken'];
    osversion = json['osversion'];
    appLanguage = json['appLanguage'];
    appversion = json['appversion'];
    currencyId = json['CurrencyId'];
    measureUnitId = json['MeasureUnitId'];
    countryId = json['CountryId'];
    deviceType = json['deviceType'];
    userId = json['userId'];
    subscriberId = json['SubscriberId'];
    isWeb = json['isWeb'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ip'] = ip;
    map['deviceSerial'] = deviceSerial;
    map['notificationToken'] = notificationToken;
    map['osversion'] = osversion;
    map['appLanguage'] = appLanguage;
    map['appversion'] = appversion;
    map['CurrencyId'] = currencyId;
    map['MeasureUnitId'] = measureUnitId;
    map['CountryId'] = countryId;
    map['deviceType'] = deviceType;
    map['userId'] = userId;
    map['SubscriberId'] = subscriberId;
    map['isWeb'] = isWeb;
    if (data != null) {
      map['data'] = data!.toJson();
    }
    return map;
  }

}