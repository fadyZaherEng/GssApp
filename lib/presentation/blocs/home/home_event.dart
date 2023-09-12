import 'package:gss/domain/models/tower.dart';

abstract class AbstractionHomeEvent{}
class HomeChangeNavBottomEvent extends AbstractionHomeEvent{
  int homeChangNavIdx;

  HomeChangeNavBottomEvent({required this.homeChangNavIdx});
}
class HomeGetDataFromApiEvent extends AbstractionHomeEvent{}

class HomeItemListClickEvent extends AbstractionHomeEvent{}
class HomeLogoListClickEvent extends AbstractionHomeEvent{}
class HomeFavoritesClickEvent extends AbstractionHomeEvent{
  TowerModel towerModel;
  int index;
  HomeFavoritesClickEvent({required this.towerModel,required this.index});
}
class HomeOpenWhatsAppClickEvent extends AbstractionHomeEvent{
  String homeWhatsAppNumber;

  HomeOpenWhatsAppClickEvent({required this.homeWhatsAppNumber});
}
class HomeCallClickEvent extends AbstractionHomeEvent{
  String  homePhone;

  HomeCallClickEvent({required this.homePhone});
}
class HomeEmailClickEvent extends AbstractionHomeEvent{
  String homeEmail;

  HomeEmailClickEvent({required this.homeEmail});
}
class HomeSearchChangeEvent extends AbstractionHomeEvent{
  String homeSearchKey;

  HomeSearchChangeEvent({required this.homeSearchKey});
}
class HomeSavedClickedEvent extends AbstractionHomeEvent{}

class HomeFloatingMapClickEvent extends AbstractionHomeEvent{}
class HomeFloatingSortClickEvent extends AbstractionHomeEvent{}
class HomeAddTowerClickEvent extends AbstractionHomeEvent{
  TowerModel towerModel;

  HomeAddTowerClickEvent({required this.towerModel});
}
class HomeGetTowerClickEvent extends AbstractionHomeEvent{}
class HomeDeleteTowerClickEvent extends AbstractionHomeEvent{
  int homeTowerIndex;

  HomeDeleteTowerClickEvent({required this.homeTowerIndex});
}