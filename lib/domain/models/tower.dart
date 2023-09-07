class TowerModel {
  String title, address;
  double pounds;
  int beds, bath, sqft, numOfDay;

  TowerModel(
      {required this.title,
      required this.address,
      required this.pounds,
      required this.beds,
      required this.bath,
      required this.sqft,
      required this.numOfDay});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'address': address,
      'pounds': pounds,
      'beds': beds,
      'bath': bath,
      'sqft': sqft,
      'numOfDay': numOfDay,
    };
  }

  factory TowerModel.fromMap(Map<String, dynamic> map) {
    return TowerModel(
      title: map['title'] ,
      address: map['address'] ,
      pounds: map['pounds'] ,
      beds: map['beds'] ,
      bath: map['bath'] ,
      sqft: map['sqft'] ,
      numOfDay: map['numOfDay'] ,
    );
  }
}
