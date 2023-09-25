abstract class AbstractionInternetState{}

class InitialAbstractionInternetState extends AbstractionInternetState{}
class ConnectAbstractionInternetState extends AbstractionInternetState{
  String massage;

  ConnectAbstractionInternetState({required this.massage});
}
class DisconnectAbstractionInternetState extends AbstractionInternetState{
  String massage;

  DisconnectAbstractionInternetState({required this.massage});
}