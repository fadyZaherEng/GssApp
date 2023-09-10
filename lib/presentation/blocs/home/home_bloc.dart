import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/blocs/home/home_events.dart';
import 'package:gss/presentation/blocs/home/home_states.dart';


class AppBloc extends Bloc<AppEvent,AppStates>{
  AppBloc():super(AppInitState()){
    on<GetDataFromApiEvents>(_onGetDataFromApiEvents);
    on<GetChangeNavBottomEvents>(_onGetChangeNavBottomEvents);
  }
  int currentIdx=0;
  changBottomNav(int idx){
    currentIdx=idx;
  }
  List<TowerModel>towers= [
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  TowerModel(title: 'UGP', address: 'Locate Tower 1 La Cote,Port De LaMera', pounds: 134000, beds: 1, bath: 1, sqft: 900, numOfDay: 11),
  ];
  FutureOr<void> _onGetDataFromApiEvents(GetDataFromApiEvents event, Emitter<AppStates> emit)async {
    emit(AppLoadingState());
   await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(AppGetDataSuccessState(towers: towers));
    })
    .catchError((onError){
      emit(AppGetDataErrorsState(error: onError.toString()));
    });
  }
  FutureOr<void> _onGetChangeNavBottomEvents(GetChangeNavBottomEvents event, Emitter<AppStates> emit)async {
   await Future.delayed(const Duration(milliseconds: 100))
        .then((value) {
      changBottomNav(event.idx);
      emit(AppEChangeNavState(idx: currentIdx));
    })
        .catchError((onError){

    });
  }
}