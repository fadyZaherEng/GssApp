abstract class AbstractionHomeEvent{}
class HomeChangeNavBottomEvent extends AbstractionHomeEvent{
  int homeChangNavIdx;

  HomeChangeNavBottomEvent({required this.homeChangNavIdx});
}
class HomeGetDataFromApiEvent extends AbstractionHomeEvent{}

class HomeItemListClickEvent extends AbstractionHomeEvent{}
class HomeLogoListClickEvent extends AbstractionHomeEvent{}
class HomeFavoritesClickEvent extends AbstractionHomeEvent{}
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