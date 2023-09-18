import 'package:gss/domain/models/sign_in_models/sign_in_request/sign_in_request_data.dart';
import 'package:gss/domain/models/sign_in_models/sign_in_request/sign_header_request.dart';

class SignInRequestModel {
  SignInRequestData? data;
  SignInHeaderRequest? headerRequest;

  SignInRequestModel({
    required this.data,
    required this.headerRequest,
  });

  SignInRequestModel.fromJson(dynamic json) {
    data = json['data'] != null
        ? SignInRequestData.fromJson(json['data'])
        : SignInRequestData.fromJson({});
    headerRequest = json != null
        ? SignInHeaderRequest.fromJson(json)
        : SignInHeaderRequest.fromJson({});
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data!.toJson();
    }
    if (headerRequest != null) {
      map['ip'] = headerRequest!.ip;
      map['deviceSerial'] = headerRequest!.deviceSerial;
      map['notificationToken'] = headerRequest!.notificationToken;
      map['osversion'] = headerRequest!.osversion;
      map['appLanguage'] = headerRequest!.appLanguage;
      map['appversion'] = headerRequest!.appversion;
      map['CurrencyId'] = headerRequest!.currencyId;
      map['MeasureUnitId'] = headerRequest!.measureUnitId;
      map['CountryId'] = headerRequest!.countryId;
      map['deviceType'] = headerRequest!.deviceType;
      map['userId'] = headerRequest!.userId;
      map['SubscriberId'] = headerRequest!.subscriberId;
      map['isWeb'] = headerRequest!.isWeb;
    }
    return map;
  }
}
