class SignInRequestData {
  String mobile;
  String password;

  SignInRequestData({
     required this.mobile,
    required  this.password,

  });

  Map<String, dynamic> toMap() {
    return {
      'mobile': mobile,
      'password': password,
    };
  }

  factory SignInRequestData.fromMap(Map<String, dynamic> map) {
    return SignInRequestData(
      mobile: map['mobile'],
      password: map['password'],
    );
  }
}