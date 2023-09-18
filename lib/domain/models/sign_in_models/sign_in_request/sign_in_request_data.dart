class SignInRequestData {
  String? mobile;
  String? password;

  SignInRequestData({
     required this.mobile,
    required  this.password,
  });

  SignInRequestData.fromJson(dynamic json) {
    mobile = json['mobile'];
    password = json['password'];
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = mobile;
    map['password'] = password;
    return map;
  }

}