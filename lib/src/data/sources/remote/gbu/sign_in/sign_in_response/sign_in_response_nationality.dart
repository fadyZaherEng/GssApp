import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_nationality.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SignInResponseNationality {
    @JsonKey(name: 'id')
    int? id;
    @JsonKey(name: 'name')
    String? name;

    SignInResponseNationality({
        this.id,
        this.name,
    });

    factory SignInResponseNationality.fromJson(Map<String, dynamic> json) =>
        _$SignInResponseNationalityFromJson(json);

    Map<String, dynamic> toJson() =>
        _$SignInResponseNationalityToJson(this);


    factory SignInResponseNationality.fromMap(Map<String, dynamic> json) {
        return SignInResponseNationality(
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toMap() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        return data;
    }
}