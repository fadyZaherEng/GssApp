import 'package:json_annotation/json_annotation.dart';

part 'gbu_request.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class GbuRequest<T> {
  @JsonKey(name: 'ip')
  String? ip;
  @JsonKey(name: 'deviceSerial')
  String? deviceSerial;
  @JsonKey(name: 'notificationToken')
  String? notificationToken;
  @JsonKey(name: 'osversion')
  String? osversion;
  @JsonKey(name: 'appLanguage')
  String? appLanguage;
  @JsonKey(name: 'appversion')
  String? appversion;
  @JsonKey(name: 'currencyId')
  int? currencyId;
  @JsonKey(name: 'measureUnitId')
  int? measureUnitId;
  @JsonKey(name: 'countryId')
  int? countryId;
  @JsonKey(name: 'deviceType')
  int? deviceType;
  @JsonKey(name: 'userId')
  int? userId;
  @JsonKey(name: 'subscriberId')
  int? subscriberId;
  @JsonKey(name: 'isWeb')
  bool? isWeb;
  @JsonKey(name: 'data')
  T? data;

  GbuRequest({
    this.ip,
    this.deviceSerial,
    this.notificationToken,
    this.osversion,
    this.appLanguage,
    this.appversion,
    this.currencyId,
    this.measureUnitId,
    this.countryId,
    this.deviceType,
    this.userId,
    this.subscriberId,
    this.isWeb,
    this.data});

  factory GbuRequest.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$GbuRequestFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$GbuRequestToJson(this, (T) {
        return T;
      });

  Map<String, dynamic> toMap() {
    return {
      'ip': this.ip,
      'deviceSerial': this.deviceSerial,
      'notificationToken': this.notificationToken,
      'osversion': this.osversion,
      'appLanguage': this.appLanguage,
      'appversion': this.appversion,
      'currencyId': this.currencyId,
      'measureUnitId': this.measureUnitId,
      'countryId': this.countryId,
      'deviceType': this.deviceType,
      'userId': this.userId,
      'subscriberId': this.subscriberId,
      'isWeb': this.isWeb,
      'data': this.data,
    };
  }

  factory GbuRequest.fromMap(Map<String, dynamic> map) {
    return GbuRequest(
      ip: map['ip'] as String,
      deviceSerial: map['deviceSerial'] as String,
      notificationToken: map['notificationToken'] as String,
      osversion: map['osversion'] as String,
      appLanguage: map['appLanguage'] as String,
      appversion: map['appversion'] as String,
      currencyId: map['currencyId'] as int,
      measureUnitId: map['measureUnitId'] as int,
      countryId: map['countryId'] as int,
      deviceType: map['deviceType'] as int,
      userId: map['userId'] as int,
      subscriberId: map['subscriberId'] as int,
      isWeb: map['isWeb'] as bool,
      data: map['data'] as T,
    );
  }
}
