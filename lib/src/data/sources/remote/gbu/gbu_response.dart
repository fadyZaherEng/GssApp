// ignore_for_file: prefer_collection_literals
import 'package:json_annotation/json_annotation.dart';

part 'gbu_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class GbuResponse<T> {
  @JsonKey(name: 'responseCode')
  int? responseCode;
  @JsonKey(name: 'responseMessage')
  String? responseMessage;
  @JsonKey(name: 'responseMessageAr')
  String? responseMessageAr;
  @JsonKey(name: 'responseMessageEn')
  String? responseMessageEn;
  @JsonKey(name: 'responseRemark')
  String? responseRemark;
  @JsonKey(name: 'data')
  T? result;

  GbuResponse({
      this.responseCode,
      this.responseMessage,
      this.responseMessageAr,
      this.responseMessageEn,
      this.responseRemark,
      this.result,
      });
  factory GbuResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$GbuResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Function(dynamic value) value) =>
      _$GbuResponseToJson(this, (T) {
        return T;
      });

  Map<String, dynamic> toMap() {
    return {
      'responseCode': this.responseCode,
      'responseMessage': this.responseMessage,
      'responseMessageAr': this.responseMessageAr,
      'responseMessageEn': this.responseMessageEn,
      'responseRemark': this.responseRemark,
      'data': this.result,
    };
  }

  factory GbuResponse.fromMap(Map<String, dynamic> map) {
    return GbuResponse(
      responseCode: map['responseCode'],
      responseMessage: map['responseMessage'] ,
      responseMessageAr: map['responseMessageAr'] ,
      responseMessageEn: map['responseMessageEn'] ,
      responseRemark: map['responseRemark'] ,
      result: map['data'] ,
    );
  }
}
