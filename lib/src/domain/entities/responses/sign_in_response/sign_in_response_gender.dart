class SignInGender {
  int id;
  String name;

  SignInGender({
    required this.id,
    required this.name,
  });

  factory SignInGender.fromJson(Map<String, dynamic> json) {
    return SignInGender(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
