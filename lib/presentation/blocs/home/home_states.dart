import 'package:gss/domain/models/tower.dart';

abstract class AppStates{}

class AppInitState extends AppStates{}
class AppLoadingState extends AppStates{}
class AppGetDataSuccessState extends AppStates{
  List<TowerModel>towers;

  AppGetDataSuccessState({required this.towers});
}
class AppGetDataErrorsState extends AppStates{
  String error;

  AppGetDataErrorsState({required this.error});
}
class AppEChangeNavState extends AppStates{
  int idx;

  AppEChangeNavState({required this.idx});
}