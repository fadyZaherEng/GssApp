import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/src/presentation/blocs/internet/internet_event.dart';
import 'package:gss/src/presentation/blocs/internet/internet_state.dart';

class InternetBloc
    extends Bloc<AbstractionInternetEvent, AbstractionInternetState> {
  InternetBloc() : super(InitialAbstractionInternetState()) {
    on<AbstractionInternetEvent>(_onAbstractionInternetEvent);
  }
  FutureOr<void> _onAbstractionInternetEvent(
      AbstractionInternetEvent event, Emitter<AbstractionInternetState> emit) {
    if (event is  ConnectAbstractionInternetEvent) {
      emit(ConnectAbstractionInternetState(massage: "Connected"));
    } else {
      emit(DisconnectAbstractionInternetState(massage: "DisConnected"));
    }
  }
  void workLister(){
    Connectivity().onConnectivityChanged.listen((status) {
      if (status == ConnectivityResult.mobile ||
          status == ConnectivityResult.wifi) {
       add(ConnectAbstractionInternetEvent());
      } else {
       add(DisConnectAbstractionInternetEvent());
      }
    });
  }
}
