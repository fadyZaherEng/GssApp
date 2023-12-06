// ignore_for_file: prefer_collection_literals

class GbuModel <T>{
  int responseCode;
  String responseMessage;
  String responseMessageAr;
  String responseMessageEn;
  String responseRemark;
  T result;

  GbuModel({
   required this.responseCode,
   required this.responseMessage,
   required this.responseMessageAr,
   required this.responseMessageEn,
   required this.responseRemark,
   required this.result,
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

  factory GbuModel.fromMap(Map<String, dynamic> map) {
    return GbuModel(
      responseCode: map['responseCode'],
      responseMessage: map['responseMessage'] ,
      responseMessageAr: map['responseMessageAr'] ,
      responseMessageEn: map['responseMessageEn'] ,
      responseRemark: map['responseRemark'] ,
      result: map['data'] ,
    );
  }
}
