// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gbu_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GbuRequest<T> _$GbuRequestFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GbuRequest<T>(
      ip: json['ip'] as String?,
      deviceSerial: json['deviceSerial'] as String?,
      notificationToken: json['notificationToken'] as String?,
      osversion: json['osversion'] as String?,
      appLanguage: json['appLanguage'] as String?,
      appversion: json['appversion'] as String?,
      currencyId: json['currencyId'] as int?,
      measureUnitId: json['measureUnitId'] as int?,
      countryId: json['countryId'] as int?,
      deviceType: json['deviceType'] as int?,
      userId: json['userId'] as int?,
      subscriberId: json['subscriberId'] as int?,
      isWeb: json['isWeb'] as bool?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$GbuRequestToJson<T>(
  GbuRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'ip': instance.ip,
      'deviceSerial': instance.deviceSerial,
      'notificationToken': instance.notificationToken,
      'osversion': instance.osversion,
      'appLanguage': instance.appLanguage,
      'appversion': instance.appversion,
      'currencyId': instance.currencyId,
      'measureUnitId': instance.measureUnitId,
      'countryId': instance.countryId,
      'deviceType': instance.deviceType,
      'userId': instance.userId,
      'subscriberId': instance.subscriberId,
      'isWeb': instance.isWeb,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
