import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_gender.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SignInResponseGender {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  SignInResponseGender({
    this.id,
    this.name,
  });

  factory SignInResponseGender.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseGenderFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SignInResponseGenderToJson(this);


  factory SignInResponseGender.fromMap(Map<String, dynamic> json) {
    return SignInResponseGender(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
