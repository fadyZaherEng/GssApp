import 'package:hive_flutter/adapters.dart';
part 'tower.g.dart';
@HiveType(typeId: 1)
class TowerModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  String address;
  @HiveField(2)
  double pounds;
  @HiveField(3)
  int beds;
  @HiveField(4)
  int bath;
  @HiveField(5)
  int sqft;
  @HiveField(6)
  int numOfDay;

  TowerModel(
      {required this.title,
      required this.address,
      required this.pounds,
      required this.beds,
      required this.bath,
      required this.sqft,
      required this.numOfDay});
}
