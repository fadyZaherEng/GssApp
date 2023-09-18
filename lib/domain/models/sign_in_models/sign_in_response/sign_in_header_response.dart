// ignore_for_file: prefer_collection_literals

class SignInHeaderResponse{
  int responseCode;
  String responseMessage;
  String responseMessageAr;
  String responseMessageEn;
  String responseRemark;
  SignInHeaderResponse({
    required this.responseCode,
    required this.responseMessage,
    required this.responseMessageAr,
    required this.responseMessageEn,
    required this.responseRemark,
  });

  factory SignInHeaderResponse.fromJson(Map<String, dynamic> json) {
    return SignInHeaderResponse(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      responseMessageAr: json['responseMessageAr'],
      responseMessageEn: json['responseMessageEn'],
      responseRemark: json['responseRemark'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseCode'] = responseCode;
    data['responseMessage'] = responseMessage;
    data['responseMessageAr'] = responseMessageAr;
    data['responseMessageEn'] = responseMessageEn;
    data['responseRemark'] = responseRemark;
    return data;
  }
}