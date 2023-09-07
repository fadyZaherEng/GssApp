import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gss/domain/models/tower.dart';
import 'package:gss/presentation/modules/home/cubit/events.dart';
import 'package:gss/presentation/modules/home/cubit/states.dart';


class AppBloc extends Bloc<AppEvent,AppStates>{
  AppBloc():super(AppInitState()){
    on<GetDataFromApiEvents>((event,state){
          emit(AppLoadingState());
        getLocalData().then((value) {
          emit(AppGetDataSuccessState(towers: towers));
        }).catchError((onError){
          emit(AppGetDataErrorsState(error: onError.toString()));
        });
  });
    on<GetChangeNavBottomEvents>((event,state){
      changBottomNav(event.idx);
      emit(AppEChangeNavState(idx: currentIdx));
    });
   }
  int currentIdx=0;
  changBottomNav(int idx){
    currentIdx=idx;
  }
  List<TowerModel>towers=[];
  Future<void> getLocalData()async{
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
    towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
  }
}