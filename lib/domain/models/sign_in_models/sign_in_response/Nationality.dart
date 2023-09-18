class Nationality {
    int? id;
    String? name;

    Nationality({
        required this.id,
        required this.name,
    });

    factory Nationality.fromJson(Map<String, dynamic> json) {
        return Nationality(
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