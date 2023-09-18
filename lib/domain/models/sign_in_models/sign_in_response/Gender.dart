class Gender {
    int? id;
    String? name;

    Gender({required this.id,required this.name});

    factory Gender.fromJson(Map<String, dynamic> json) {
        return Gender(
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