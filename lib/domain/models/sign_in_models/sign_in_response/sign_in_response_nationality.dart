class SignInNationality {
    int? id;
    String? name;

    SignInNationality({
        required this.id,
        required this.name,
    });

    factory SignInNationality.fromJson(Map<String, dynamic> json) {
        return SignInNationality(
            id: json['id'], 
            name: json['name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data =  Map<String, dynamic>();
        data['id'] = id;
        data['name'] = name;
        return data;
    }
}