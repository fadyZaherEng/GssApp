// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/app/constants.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/blocs/home/home_event.dart';
import 'package:gss/presentation/blocs/home/home_state.dart';
import 'package:gss/utils/show_toast.dart';
import 'package:hive_flutter/adapters.dart';

class HomeBloc extends Bloc<AbstractionHomeEvent, AbstractionHomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeGetDataFromApiEvent>(_onGetDataFromApiEvents);
    on<HomeChangeNavBottomEvent>(_onGetChangeNavBottomEvents);
    on<HomeItemListClickEvent>(_onHomeItemListClickEvent);
    on<HomeLogoListClickEvent>(_onHomeLogoListClickEvent);
    on<HomeFavoritesClickEvent>(_onHomeFavoritesClickEvent);
    on<HomeOpenWhatsAppClickEvent>(_onHomeOpenWhatsAppClickEvent);
    on<HomeCallClickEvent>(_onHomeCallClickEvent);
    on<HomeEmailClickEvent>(_onHomeEmailClickEvent);
    on<HomeSearchChangeEvent>(_onHomeSearchChangeEvent);
    on<HomeSavedClickedEvent>(_onHomeSavedClickedEvent);
    on<HomeFloatingMapClickEvent>(_onHomeFloatingMapClickEvent);
    on<HomeFloatingSortClickEvent>(_onHomeFloatingSortClickEvent);
    on<HomeGetTowerClickEvent>(_onHomeGetTowerClickEvent);
  }

  int currentIdx = 0;

  changBottomNav(int idx) {
    currentIdx = idx;
  }

  FutureOr<void> _onGetDataFromApiEvents(
      HomeGetDataFromApiEvent event, Emitter<AbstractionHomeState> emit) async {
    emit(HomeInitialState());
    await Future.delayed(const Duration(seconds: 1)).then((value) {
      emit(HomeGetDataSuccessState(towers: towers));
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onGetChangeNavBottomEvents(HomeChangeNavBottomEvent event,
      Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      changBottomNav(event.homeChangNavIdx);
      emit(HomeChangeNavState(homeChangeNavIdx: currentIdx));
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeItemListClickEvent(
      HomeItemListClickEvent event, Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeItemListClickState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeLogoListClickEvent(
      HomeLogoListClickEvent event, Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeLogoListClickState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeOpenWhatsAppClickEvent(HomeOpenWhatsAppClickEvent event,
      Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeFavoritesClickState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeCallClickEvent(
      HomeCallClickEvent event, Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeCallClickState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeEmailClickEvent(
      HomeEmailClickEvent event, Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeEmailClickState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeSearchChangeEvent(
      HomeSearchChangeEvent event, Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeSearchChangeState(homeResult: []));
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeSavedClickedEvent(
      HomeSavedClickedEvent event, Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeSavedClickedState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeFloatingMapClickEvent(HomeFloatingMapClickEvent event,
      Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeFloatingMapClickState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  FutureOr<void> _onHomeFloatingSortClickEvent(HomeFloatingSortClickEvent event,
      Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 100)).then((value) {
      emit(HomeFloatingSortClickState());
    }).catchError((onError) {
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  List<TowerModel> towers = [
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
    TowerModel(
        title: 'UGP',
        address: 'Locate Tower 1 La Cote,Port De LaMera',
        pounds: 134000,
        beds: 1,
        bath: 1,
        sqft: 900,
        numOfDay: 11),
  ];
  Box savedTowers = Hive.box<TowerModel>("towers");
  Box favoritiesOption = Hive.box<bool>("favorite");

  FutureOr<void> _onHomeGetTowerClickEvent(
      HomeGetTowerClickEvent event, Emitter<AbstractionHomeState> emit) async {
    await Future.delayed(const Duration(milliseconds: 50)).then((value) async {
      savedTowers = Hive.box<TowerModel>("towers");
      emit(HomeGetFavState(savedTower: savedTowers));
    }).catchError((onError) {
      showToast(message: onError.toString(), state: ToastState.SUCCESS);
      emit(HomeCallClickState());
    });
  }

  FutureOr<void> _onHomeFavoritesClickEvent(
      HomeFavoritesClickEvent event, Emitter<AbstractionHomeState> emit) async {
    emit(HomeChangeFavColorState(index: event.index));

    await Future.delayed(const Duration(seconds: 1)).then((value) async {
      print(favorities[event.index]);
      bool favorite = favorities[event.index]!;
      if (favorite) {
        favorities[event.index] = false;
        favorite = !favorite;
        changeFavorities(event.index, false);
      } else {
        favorities[event.index] = true;
        favorite = !favorite;
        changeFavorities(event.index, true);
      }
      print(favorities[event.index]);
      if (favorities[event.index]!) {
        await savedTowers.add(event.towerModel);
        print(savedTowers.length);
        print("fav");
        showToast(message: "Favorite Success", state: ToastState.SUCCESS);
        emit(HomeGetTowerClickState(
            savedTowers: savedTowers, index: event.index));
      } else if (!favorities[event.index]!) {
        event.towerModel.delete();
        print('dis');
        await savedTowers.delete(event.towerModel);
        print(savedTowers.containsKey(event.towerModel));
        print(savedTowers.length);
        showToast(message: "disFavorite Success", state: ToastState.SUCCESS);
        emit(HomeGetTowerClickState(
            savedTowers: savedTowers, index: event.index));
      }
    }).catchError((onError) {
      showToast(message: onError.toString(), state: ToastState.SUCCESS);
      print(onError.toString());
      emit(HomeGetDataErrorsState(error: onError.toString()));
    });
  }

  void initFavoritiesValueOFList() {
   if(favoritiesOption.length==0){
     for (int i = 0; i < towers.length; i++) {
       favorities[i] = false;
       favoritiesOption.add(favorities[i]);
     }
   }else if(favoritiesOption.length!=0){
     for (int i = 0; i < towers.length; i++) {
       favorities[i] = favoritiesOption.getAt(i);
     }
   }
   ///////////
    print(favorities);
    emit(HomeSavedClickedState());
  }
  void changeFavorities(int index,bool value){
    favoritiesOption.putAt(index, value);
    emit(HomeSavedClickedState());
  }
}
