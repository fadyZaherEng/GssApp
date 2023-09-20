// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gbu_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GbuResponse<T> _$GbuResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    GbuResponse<T>(
      responseCode: json['responseCode'] as int?,
      responseMessage: json['responseMessage'] as String?,
      responseMessageAr: json['responseMessageAr'] as String?,
      responseMessageEn: json['responseMessageEn'] as String?,
      responseRemark: json['responseRemark'] as String?,
      result: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$GbuResponseToJson<T>(
  GbuResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'responseMessage': instance.responseMessage,
      'responseMessageAr': instance.responseMessageAr,
      'responseMessageEn': instance.responseMessageEn,
      'responseRemark': instance.responseRemark,
      'data': _$nullableGenericToJson(instance.result, toJsonT),
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
