class Data {
  String? mobile;
  String? password;

  Data({
     required this.mobile,
    required  this.password,
  });

  Data.fromJson(dynamic json) {
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