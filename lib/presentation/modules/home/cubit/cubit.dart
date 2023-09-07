// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gss/layout/home/cubit/states.dart';
// import 'package:gss/models/tower.dart';
// import 'package:gss/shared/components/components.dart';
//
// class AppHomeCubit extends Cubit<AppStates>{
//   AppHomeCubit():super(AppInitState());
//
//   static AppHomeCubit get(context)=>BlocProvider.of(context);
//   int currentIdx=0;
//   changBottomNav(int idx){
//     currentIdx=idx;
//     emit(AppEChangeNavState());
//   }
//   List<TowerModel>towers=[];
//   void getLocalData(){
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     towers.add(TowerModel(title: 'UGP', address: 'Locate Tower 2 La Cote,Port De LaMera', pounds: 234000, beds: 2, bath: 2, sqft: 900, numOfDay: 12));
//     emit(AppSuccessState());
//   }
//
// }
//
